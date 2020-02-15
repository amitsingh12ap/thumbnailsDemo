//
//  PhotoListViewModel.swift
//  Movies
//
//  Created by 13216146 on 30/01/20.
//  Copyright © 2020 13216146. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

final class PhotoListViewModel: ObservableObject {
    @Published  private(set) var model: PhotosBase?
    @Published  private(set) var error: Error?
    @Published private(set) var photos: [Photo]?
    @Published private(set) var shouldHide: Bool?
    @Published private(set) var gridPhotos: [[Photo]]? = [[Photo]]()
    init() {
        self.getPhotos()
    }
    
    func imageURL(forPhoto photo: Photo) -> String {
        return ImageBinder.imageURL(photo.farm ?? 0,photo.server ?? "",photo.id ?? "" ,photo.secret ?? "")
    }
    
    func title(forPhoto photo: Photo) -> String {
        return photo.title ?? "No title available"
    }
    
    private func updateGridData() {
        guard let photos = self.photos else {
            return
        }
        var curIndex = 0
        var list = [Photo]()
        for photo in photos {
            if curIndex == 3 {
                curIndex = 0
                self.gridPhotos?.append(list)
                list.removeAll()
            }
            list.append(photo)
            curIndex += 1
        }
    }
    
    
    private func getPhotos(){
        self.executeApi {[weak self] (result) in
            switch result {
            case .success(let response):
                if let resData = response as? Data {
                    if let model = self?.parse(model: PhotosBase.self, data: resData) {
                        DispatchQueue.main.sync {
                            self?.model = model
                            self?.photos = model.photos?.photo
                            self?.shouldHide = true
                            self?.updateGridData()
                        }
                    } else {
                        self?.error = GenericError.invalidResponse
                    }
                }
            case .failure(let error):
                self?.error = error
            }
        }
    }
}

extension PhotoListViewModel: Service {
    var endPoint: String {
        return ServiceApiManager.photoApi
    }
    
    
}

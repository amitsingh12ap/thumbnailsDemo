//
//  ContentView.swift
//  Movies
//
//  Created by 13216146 on 30/01/20.
//  Copyright © 2020 13216146. All rights reserved.
//

import SwiftUI
import Combine
import Foundation
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject private var photoListViewModel: PhotoListViewModel
    @State var alertMessage: String = ""
    @State var shouldShow: Bool = false
    var alert: Alert {
        Alert(title: Text("Message"), message: Text(alertMessage), dismissButton: .default(Text("Dismiss")))
    }
    public init(with model: PhotoListViewModel) {
        self.photoListViewModel = model
    }
    var body: some View {
        NavigationView {
            VStack {
                if photoListViewModel.gridPhotos?.count ?? 0 > 0 {
                    List {
                        ForEach(0..<photoListViewModel.gridPhotos!.count, id:\.self) { photoArray in
                            HStack {
                                ForEach((self.photoListViewModel.gridPhotos?[photoArray])!) { photo in
                                    WebImage(url: URL(string: self.photoListViewModel.imageURL(forPhoto: photo)), options: .progressiveLoad, context: .none)
                                        .resizable()
                                        .frame(minWidth: 50, idealWidth: 100, maxWidth: 120, minHeight: 50, idealHeight: 100, maxHeight: 120, alignment: .center)
                                        .gesture(
                                            TapGesture()
                                                .onEnded { view in
                                                    self.alertMessage = "\(self.photoListViewModel.title(forPhoto: photo))"
                                                    self.shouldShow = true
                                            }
                                    )
                                }.alert(isPresented: self.$shouldShow, content: { self.alert })
                            }
                        }
                    }.padding(EdgeInsets.init(top: 0, leading: 0, bottom: 20, trailing: 0))
                    
                    
                }
                } .navigationBarTitle("Gallery")
            
        }
    }
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(with: PhotoListViewModel())
    }
}

//
//  CurrencyViewModel.swift
//  Movies
//
//  Created by 13216146 on 03/02/20.
//  Copyright © 2020 13216146. All rights reserved.
//

import Foundation
final class CurrencyViewModel: ObservableObject {
    @Published var currencyList: Currencies?
    @Published var error: Error?
    init() {
        self.getCurrencies()
    }
}
extension CurrencyViewModel: Service {
    var endPoint: String {
        return ServiceApiManager.currencyApi
    }
    
    fileprivate func getCurrencies(){
        self.executeApi {[weak self] (result) in
            switch result {
            case .success(let response):
                if let resData = response as? Data {
                    if let model = self?.parse(model: CurrencyListModel.self, data: resData) {
                        DispatchQueue.main.sync {
                            self?.currencyList = model.currencies
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

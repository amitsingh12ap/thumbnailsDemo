//
//  ServiceApiManager.swift
//  Movies
//
//  Created by 13216146 on 30/01/20.
//  Copyright © 2020 13216146. All rights reserved.
//

import Foundation

struct ServiceApiManager {
    static var photoApi: String = "https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=548aac38636d6b1224a928547c81797e&format=json&nojsoncallback=1"
    static var currencyApi = "https://currency-converter5.p.rapidapi.com/currency/list"
}

struct ImageBinder {
    static let imageURL:(Int,String,String,String) -> String = { formId,serverID,id,secret  in
        return "https://farm\(formId).staticflickr.com/\(serverID)/\(id)_\(secret).jpg"
    }
}



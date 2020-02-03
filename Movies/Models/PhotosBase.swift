//
//  PhotosBase.swift
//  Movies
//
//  Created by 13216146 on 30/01/20.
//  Copyright © 2020 13216146. All rights reserved.
//

import Foundation
struct PhotosBase : Codable,Identifiable {
    let id = UUID()
	let photos : Photos?
	let stat : String?

	enum CodingKeys: String, CodingKey {

		case photos = "photos"
		case stat = "stat"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		photos = try values.decodeIfPresent(Photos.self, forKey: .photos)
		stat = try values.decodeIfPresent(String.self, forKey: .stat)
	}

}

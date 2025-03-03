///  Movies
//
//  Created by 13216146 on 30/01/20.
//  Copyright © 2020 13216146. All rights reserved.
//
import Foundation
struct Photos : Codable,Identifiable {
    var id = UUID()
	let page : Int?
	let pages : Int?
	let perpage : Int?
	let total : Int?
	let photo : [Photo]?

	enum CodingKeys: String, CodingKey {

		case page = "page"
		case pages = "pages"
		case perpage = "perpage"
		case total = "total"
		case photo = "photo"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		page = try values.decodeIfPresent(Int.self, forKey: .page)
		pages = try values.decodeIfPresent(Int.self, forKey: .pages)
		perpage = try values.decodeIfPresent(Int.self, forKey: .perpage)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
		photo = try values.decodeIfPresent([Photo].self, forKey: .photo)
	}

}

//
//  ResponceModel.swift
//  TestMarsSwinJectProject
//
//  Created by User on 05.03.2021.
//

import Foundation
import Foundation
// MARK: - ResponceModel
struct ResponceModel: Codable {
    let photos: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
    let id: Int
    let imgSrc: String

enum CodingKeys: String, CodingKey {
    case id
    case imgSrc = "img_src"
}
}


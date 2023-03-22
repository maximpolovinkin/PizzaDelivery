//
//  DataModel.swift
//  hammer
//
//  Created by Максим Половинкин on 15.10.2022.
//

import Foundation

struct initial: Codable {
    var menuItems: [menuItems]

    enum CodingKeys: String, CodingKey {
            case menuItems = "menuItems"
        }
}

struct menuItems: Codable {
    let id: Int
    let title: String
    let image: String

    enum CodingKeys: String, CodingKey{
        case title = "title"
        case image = "image"
        case id = "id"
    }

}

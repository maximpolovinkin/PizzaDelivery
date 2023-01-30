//
//  DataModel.swift
//  hammer
//
//  Created by Максим Половинкин on 15.10.2022.
//

import Foundation

struct initial: Codable {
    var menuItems: [menuItems]
}

struct menuItems: Codable {
    var title: String
    var image: String
    //var imageView: UIImage
}

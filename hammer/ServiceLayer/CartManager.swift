//
//  CartManager.swift
//  hammer
//
//  Created by Максим Половинкин on 15.03.2023.
//

import Foundation
import UIKit

class Cart {
    var items = [menuItems]()
    var images = [UIImage]()
    static private var instance = Cart()
    
     func setItem(item: menuItems){
        self.items.append(item)
    }
    
     func getItems() -> [menuItems] {
        return self.items
    }
    
    func setImages(image: UIImage){
        self.images.append(image)
    }
    
    func getImages() -> [UIImage]{
        return self.images
    }
    
    static func shareInstance() -> Cart {
        return .instance
    }
}

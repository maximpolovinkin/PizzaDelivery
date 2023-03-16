//
//  TrashManager.swift
//  hammer
//
//  Created by Максим Половинкин on 15.03.2023.
//

import Foundation
import UIKit

class TrashManager{
    public var images = [UIImage]()
    public var items = [menuItems]()
    
    func setItem(item: menuItems, image: UIImage) {
        self.images.append(image)
        self.items.append(item)
    }
}

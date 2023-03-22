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
    var countedItems = [Int : Int]()
    var prices = [Int]()
    
    private var allItemsCount = 0
    
    static private var instance = Cart()
    
    func setItem(item: menuItems){
        if !items.contains(where: { $0.id == item.id }) {
            self.items.append(item)
            countedItems[item.id, default: 0] += 1
            allItemsCount += 1
        } else {
            countedItems[item.id]! += 1
            allItemsCount += 1
        }
    }
    
    func addPrice(price: Int) {
        prices.append(price)
    }
    
    func updatePrice(stepperValue: Int, index: Int) {
        prices[index] = 345 * stepperValue
    }
    
    func getItem(forId index: Int) -> (item: menuItems?, repeating: Int?) {
        (items[index], countedItems[items[index].id])
    }
    
    func getPrice(for index: Int) -> Int {
        self.prices[index]
    }
    
    func deleteItemFor(id: Int, image: UIImage) {
        self.countedItems[id]! -= 1
        allItemsCount -= 1
        if self.countedItems[id]! == 0 {
            self.countedItems[id] = nil
            self.items.removeAll(where: {$0.id == id})
            self.images.removeAll(where: {$0 == image})
            print(items.count)
        }
    }
    
    func getUniqueItemsCount() -> Int {
        self.countedItems.keys.count
    }
    
    func getAllItemsCount() -> Int {
        allItemsCount
    }
    
    func setImages(image: UIImage){
        if !images.contains(image) {
            self.images.append(image)
        }
    }
    
    func getImage(forIndex index: Int) -> UIImage? {
        self.images[index]
    }
    
    static func shareInstance() -> Cart {
        .instance
    }
}

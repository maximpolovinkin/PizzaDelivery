//
//  menuButtons.swift
//  hammer
//
//  Created by Максим Половинкин on 15.10.2022.
//

import Foundation
import UIKit


struct menu {
    var image: UIImage
    static let categoryNames = [ "Пицца", "Комбо", "Десерты", "Напитки",]
    
    static func fetchBanners() -> [menu]{
        let firstBanner = menu(image: UIImage(named: "menu1")!)// forse inwrp because I'm sure it exists
        let secondBanner = menu(image: UIImage(named: "menu2")!)// forse inwrp because I'm sure it exists
        let firdtBanner = menu(image: UIImage(named: "menu3")!)// forse inwrp because I'm sure it exists
        let fourBanner = menu(image: UIImage(named: "menu4")!)// forse inwrp because I'm sure it exists
        
        return [firstBanner, secondBanner, firdtBanner, fourBanner]
    }
}

//
//  BannersModel.swift
//  hammer
//
//  Created by Максим Половинкин on 14.10.2022.
//

import Foundation
import UIKit


struct banner {
    var image: UIImage
    
    static func fetchBanners() -> [banner]{
        let firstBanner = banner(image: UIImage(named: "banner1")!)// forse inwrp because I'm sure it exists
        let secondBanner = banner(image: UIImage(named: "banner2")!)// forse inwrp because I'm sure it exists
        let firdtBanner = banner(image: UIImage(named: "banner3")!)// forse inwrp because I'm sure it exists
        return [firstBanner, secondBanner, firdtBanner]
    }
}

//
//  Presentor.swift
//  hammer
//
//  Created by Максим Половинкин on 15.10.2022.
//

import Foundation
import UIKit
// https://api.spoonacular.com/food/menuItems/search?query=pizza&number=20?apiKey=b0912c42d2ac47ca9b8a40ec6ca11313
// https://api.spoonacular.com/recipes/716429/information?apiKey=YOUR-API-KEY&includeNutrition=true

protocol presentorDelegate: AnyObject {
    func presentData(data: [menuItems])
}

typealias PresentorDelegate = presentorDelegate & UIViewController

class presentor {
    
    weak var delegate: PresentorDelegate?
    
    public func getData() { // Первый скрин с пиццами
        guard let url = URL(string: "https://api.spoonacular.com/food/menuItems/search?query=pizza&number=20&apiKey=b0912c42d2ac47ca9b8a40ec6ca11313") else { return }

            let task = URLSession.shared.dataTask(with: url) {data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                print(data)
                do {
                    let responce = try JSONDecoder().decode(initial.self, from: data)
                    DispatchQueue.global().async {
                        self.delegate?.presentData(data: responce.menuItems)
                    }
                    
                }
                catch {
                    print(error)
                }
            }
            task.resume()
        
    }
    public func setViewDelegate(delegate: PresentorDelegate) {
        self.delegate = delegate
    }
}

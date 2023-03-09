//
//  Presenter.swift
//  hammer
//
//  Created by Максим Половинкин on 15.10.2022.
//

import Foundation
import UIKit

protocol NetworkServiceProtocol {
    func getData(completion: @escaping (Result<[menuItems]?, Error>) -> Void)
    func loadImage(key: String, completion: @escaping ((UIImage?) -> Void))
    var cachedImages: NSCache<NSString, UIImage>? {get set}
}

class NetworkService: NetworkServiceProtocol {
    var cachedImages: NSCache<NSString, UIImage>?
    
    //MARK:  Menu data request
    func getData(completion: @escaping (Result<[menuItems]?, Error>) -> Void) {
        DispatchQueue.global().async {
            guard let url = URL(string: "https://api.spoonacular.com/food/menuItems/search?query=pizza&number=20&apiKey=b0912c42d2ac47ca9b8a40ec6ca11313") else { return }
            
            URLSession.shared.dataTask(with: url) {data, _, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                do{
                    let data = try JSONDecoder().decode(initial.self, from: data!)
                    DispatchQueue.main.async {
                        print(data.menuItems)
                        completion(.success(data.menuItems))
                    }
                    
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
                
            }.resume()
        }
    }
    
    //MARK: Loading images into the cache
    func loadImage(key: String, completion: @escaping ((UIImage?) -> Void)) {
        guard let url = URL(string: key) else { return }
        
        print(url)
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = (UIImage(data: data)){
                    DispatchQueue.main.async {
                        print("hui")
                        self.cachedImages?.setObject(image, forKey: key as NSString)
                        completion(image)
                    }
                }
            }
        }
    }
}



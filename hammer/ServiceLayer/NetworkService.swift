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
    func loadTitle(key: String, object: String, completion: @escaping ((String?) -> Void))
    var cachedImages: NSCache<NSString, UIImage>? {get set}
    var cachedTitles: NSCache<NSString, NSString>? {get set}
}

class NetworkService: NetworkServiceProtocol {
    var cachedImages: NSCache<NSString, UIImage>? = {
        let cache = NSCache<NSString, UIImage>()
        
        return cache
    }()
    
    var cachedTitles: NSCache<NSString, NSString>? = {
        let cache = NSCache<NSString, NSString>()
        
        return cache
    }()
    
    //MARK:  Menu data request
    func getData(completion: @escaping (Result<[menuItems]?, Error>) -> Void) {
        DispatchQueue.global().async {
            guard let url = URL(string: "https://api.spoonacular.com/food/menuItems/search?query=pizza&number=20&apiKey=aae9736dc9bd406483a18beabea7f3f7") else { return }
            
            URLSession.shared.dataTask(with: url) {data, _, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                do{
                    let data = try JSONDecoder().decode(initial.self, from: data!)
                    DispatchQueue.main.async {
                        completion(.success(data.menuItems))
                    }
                    
                } catch {
                    DispatchQueue.main.async {
                        print(error.localizedDescription)
                        completion(.failure(error))
                    }
                }
                
            }.resume()
        }
    }
    
    //MARK: Loading images into the cache
    func loadImage(key: String, completion: @escaping ((UIImage?) -> Void)) {
        guard let url = URL(string: key) else { return }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = (UIImage(data: data)){
                    DispatchQueue.main.async { [self] in
                        cachedImages?.setObject(image, forKey: key as NSString)
                        completion(image)
                    }
                }
            }
        }
    }
    
    func loadTitle(key: String, object: String, completion: @escaping ((String?) -> Void)) {
        DispatchQueue.global().async {
            DispatchQueue.main.async { [self] in
                cachedTitles?.setObject(object as NSString, forKey: key as NSString)
                completion(object)
            }
        }
    }
}



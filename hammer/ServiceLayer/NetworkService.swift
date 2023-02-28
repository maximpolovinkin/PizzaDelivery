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
}

class NetworkService: NetworkServiceProtocol {
    func getData(completion: @escaping (Result<[menuItems]?, Error>) -> Void) {
        guard let url = URL(string: "https://api.spoonacular.com/food/menuItems/search?query=pizza&number=20&apiKey=b0912c42d2ac47ca9b8a40ec6ca11313") else { return }
        
        URLSession.shared.dataTask(with: url) {data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do{
                let data = try JSONDecoder().decode(initial.self, from: data!)
                completion(.success(data.menuItems))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}



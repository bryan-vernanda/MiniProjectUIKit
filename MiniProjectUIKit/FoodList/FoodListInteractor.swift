//
//  FoodListInteractor.swift
//  MiniProjectUIKit
//
//  Created by Bryan Vernanda on 05/12/24.
//

import Foundation

// Talk to presenter
protocol FoodListInteractorProtocol {
    var presenter: FoodListPresenterProtocol? {get set}
    
    func getFoodListData()
}

class FoodListInteractor: FoodListInteractorProtocol {
    var presenter: FoodListPresenterProtocol?
    
    func getFoodListData() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorWithData(result: .failure(NetworkError.serverError))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(FoodList.self, from: data)
                
                if let foods = response.meals {
                    self?.presenter?.interactorWithData(result: .success(foods))
                } else {
                    self?.presenter?.interactorWithData(result: .failure(NetworkError.dataNotFound))
                }
            } catch {
                self?.presenter?.interactorWithData(result: .failure(NetworkError.decodingError))
            }
        }
        task.resume()
    }
    
}



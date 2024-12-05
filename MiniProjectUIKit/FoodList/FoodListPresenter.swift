//
//  FoodListPresenter.swift
//  MiniProjectUIKit
//
//  Created by Bryan Vernanda on 05/12/24.
//

import Foundation

// Talk to router
// Talk to view
// Talk to interactor
protocol FoodListPresenterProtocol {
    var router: FoodListRouterProtocol? {get set}
    var view: FoodListViewProtocol? {get set}
    var interactor: FoodListInteractorProtocol? {get set}
    
    func viewDidLoad()
    func interactorWithData(result: Result<[Food], Error>)
    func tapOnDetail(_ food: Food)
}

class FoodListPresenter: FoodListPresenterProtocol {
    var router: FoodListRouterProtocol?
    var view: FoodListViewProtocol?
    var interactor: FoodListInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.getFoodListData()
    }
    
    func interactorWithData(result: Result<[Food], any Error>) {
        switch result {
        case .success(let foods):
            view?.update(with: foods)
        case .failure(let error):
            print(error)
            view?.update(with: "Try again later...")
        }
    }
    
    func tapOnDetail(_ food: Food) {
        router?.gotoDetailView(food: food)
    }
    
}

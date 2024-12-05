//
//  FoodListRouter.swift
//  MiniProjectUIKit
//
//  Created by Bryan Vernanda on 05/12/24.
//

import UIKit

// EntryPoint
protocol FoodListRouterProtocol {
    var entry: FoodListViewController? {get}
    static func startExecution() -> FoodListRouterProtocol
    
    func gotoDetailView(food: Food)
}

class FoodListRouter: FoodListRouterProtocol {
    var entry: FoodListViewController?
    
    static func startExecution() -> FoodListRouterProtocol {
        let router = FoodListRouter()
        let view = FoodListViewController()
        let presenter = FoodListPresenter()
        let interactor = FoodListInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view
        return router
    }
    
    func gotoDetailView(food: Food) {
//        let detailRouter = CartoonDetail_Router.createCartoonDetail(with: cartoon)
//        guard let detailView = detailRouter.entry else { return }
//        guard let viewController = self.entry else { return }
//        
//        viewController.navigationController?.pushViewController(detailView, animated: true)
    }
}

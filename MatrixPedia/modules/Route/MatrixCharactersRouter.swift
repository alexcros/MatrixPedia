//
//  MatrixCharactersRouter.swift
//  MatrixPedia
//
//  Created by Alexandre on 21/11/18.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import UIKit

class MatrixCharactersRouter: PresenterToRouterProtocol {
    
    class func createModule() -> UIViewController {
        
//        let view = mainstoryboard.instantiateViewController(withIdentifier: "CharactersTableViewController") as? CharactersTableViewController
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "CharactersViewController") as? CharactersViewController
        
        //if let view = navController.childViewControllers.first as? LiveNewsViewController {
        //fix
        let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = MatrixCharactersPresenter() //LiveNewsPresenter()
        let interactor: PresentorToInterectorProtocol = MatrixCharactersInteractor()
        let router: PresenterToRouterProtocol = MatrixCharactersRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interector = interactor
        interactor.presenter = presenter
        
        return view!

    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}

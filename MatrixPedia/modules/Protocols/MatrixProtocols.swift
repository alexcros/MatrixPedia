//
//  MatrixProtocols.swift
//  MatrixPedia
//
//  Created by Alexandre on 21/11/18.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import UIKit

protocol PresenterToViewProtocol: class {
    func showCharacters(characters: MatrixCharacter)
    func showError()
}
// fix
protocol InterectorToPresenterProtocol: class {
    func matrixCharactersFetched(characters: MatrixCharacter)
    func matrixCharactersFetchedFailed()
}

protocol PresentorToInterectorProtocol: class {
    var presenter: InterectorToPresenterProtocol? {get set}
    func fetchMatrixCharacters()
}

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interector: PresentorToInterectorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func updateView()
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> UIViewController;
}


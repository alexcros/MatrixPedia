//
//  LiveNewsPresenter.swift
//  MatrixPedia
//
//  Created by Alexandre on 21/11/18.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import Foundation

class MatrixCharactersPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interector: PresentorToInterectorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        interector?.fetchMatrixCharacters()
    }
}

extension MatrixCharactersPresenter: InteractorToPresenterProtocol {
    
    func matrixCharactersFetched(characters: [MatrixCharacter]) {
        view?.showCharacters(characters: characters)
    }
    
    func matrixCharactersFetchedFailed(){
        view?.showError()
    }
}

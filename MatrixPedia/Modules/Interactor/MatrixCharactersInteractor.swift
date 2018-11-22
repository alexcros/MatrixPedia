//
//  MatrixCharactersInteractor.swift
//  MatrixPedia
//
//  Created by Alexandre on 21/11/18.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import Foundation
import Alamofire

class MatrixCharactersInteractor: PresentorToInterectorProtocol{
    
    var presenter: InteractorToPresenterProtocol?
    
    func fetchMatrixCharacters() {
        Alamofire.request(Constants.URL).responseJSON { [weak self] response in
            
            if let data = response.data,
                let jsonDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let characters = jsonDictionary as? [[String : Any]] {
                
                var matrixCharacters = [MatrixCharacter]()
                
                for character in characters {
                    guard let matrixCharacter = MatrixCharacter(json: character) else {
                        continue
                    }
                    matrixCharacters.append(matrixCharacter)
                }
                
                self?.presenter?.matrixCharactersFetched(characters: matrixCharacters)
                
            } else {
                self?.presenter?.matrixCharactersFetchedFailed()
            }
        }
    }
}


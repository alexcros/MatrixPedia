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
    
    var presenter: InterectorToPresenterProtocol?;
    
    // TODO: PASAR LA VISTA AL PRESENTER YA QUE EN LA MASTERCLASS
    // DE VIPER LOS DATOS LOS PASABA DIRECTAMENTE DESDE EL TVC
    func fetchMatrixCharacters() {
        Alamofire.request("http://127.0.0.1/characters").responseJSON { [weak self] response in
            
            if let data = response.data,
                let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let characters = jsonData as? [[String : Any]] {
                var newCharacters = [MatrixCharacter]()
                
                for character in characters {
                    guard let newCharacter = MatrixCharacter(json: character) else {
                        continue
                    }
                    newCharacters.append(newCharacter)
                }
                // pasar a presenter
//                self?.characters = newCharacters
//                self?.tableView.reloadData()
            } else {
                print("FAIL")
            }
            
        }
    }
    
//    func fetchLiveNews() {
//        Alamofire.request(Constants.URL).responseJSON { response in
//
//            if(response.response?.statusCode == 200){
//                if let json = response.result.value as! AnyObject? {
//                    let arrayResponse = json["articles"] as! NSArray
//                    let arrayObject = Mapper<LiveNewsModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
//                    self.presenter?.liveNewsFetched(news: (arrayObject?[0])!);
//                }
//            }
//            else {
//                self.presenter?.liveNewsFetchedFailed();
//            }
//        }
//    }
}


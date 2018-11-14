//
//  CharactersTableViewController.swift
//  MatrixPedia
//
//  Created by Alexandre on 7/11/18.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import UIKit
import Alamofire

class CharactersTableViewController: UITableViewController {
    
    var characters = [MatrixCharacter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        loadCharacters()
    }
    
    func tableViewSetup() {
        self.title = "Characters"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
    }
    
    func loadCharacters() {
        Alamofire.request("http://127.0.0.1/characters".responseJSON { [weak self] response in
            
            if let data = response.data, let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments), let characters = jsonData as? [[String : Any]] {
                var newCharacters = [MatrixCharacter]()
                
                for character in characters {
                    guard let newCharacter = MatrixCharacter(json: character) else {
                        continue
                    }
                    newCharacters.append(newCharacter)
                }
                self?.characters = newCharacters
                self?.tableView.reloadData()
            }
            
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.CellStyle.subtitle, reuseidentifier: "characterCell") else {
            
            return UITableViewCell()
        }()
        
        
        let character = characters[indexPath.row]
        
        cell.textLabel?.text = character.alias
        cell.detailedTextLabel.text = character.type.rawValue.capitalized
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characterSelected = characters[indexPath.row]
        let characterProfileVC = CharacterProfileViewController(withCharacterId: characterSelected.id)
        self.navigationController?.pushViewController(characterProfileVC, animated: true)
        tableView.cellForRow(at: indexPath)?.selectionStyle = .none
    }
}
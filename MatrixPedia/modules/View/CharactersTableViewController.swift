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
    var presenter: ViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        loadCharacters()
        presenter?.updateView()
    }
    
    func tableViewSetup() {
        self.title = "Characters"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
    }
    
    func loadCharacters() {
        Alamofire.request("http://127.0.0.1/characters").responseJSON { [weak self] response in
            
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
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell") else {
                
                return UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "characterCell")
            }
            return cell
        }()
        
        let character = characters[indexPath.row]
        
        cell.textLabel?.text = character.alias
        cell.detailTextLabel?.text = character.type.rawValue.capitalized
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characterSelected = characters[indexPath.row]
        let characterProfileVC = CharacterrProfileViewController(withCharacterId: characterSelected.id)//CharacterProfileViewController(withCharacterId: characterSelected.id)
        self.navigationController?.pushViewController(characterProfileVC, animated: true)
        tableView.cellForRow(at: indexPath)?.selectionStyle = .none
    }
}

extension CharactersTableViewController: PresenterToViewProtocol {
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching characters", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showCharacters(characters: MatrixCharacter) {
        print(characters)
        print("DONE")
    }
    
//    func showNews(news: LiveNewsModel) {
//        authorLabel.text = news.author;
//        titleLabel.text = news.title;
//        descriptionLabel.text = news.description;
//    }
//
//    func showError() {
//        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
    
}


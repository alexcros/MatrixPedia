//
//  CharactersViewController.swift
//  MatrixPedia
//
//  Created by Alexandre on 21/11/18.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import UIKit
import Alamofire

class CharactersViewController: UIViewController {
    
    var presenter: ViewToPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var matrixCharacters: [MatrixCharacter] = []
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
//        tableView.delegate = self
        presenter?.updateView()
        
    }

}

extension CharactersViewController: PresenterToViewProtocol, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matrixCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "MatricCell"
        
        let person = matrixCharacters[indexPath.row]
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        
        cell?.textLabel?.text = person.alias
        cell?.detailTextLabel?.text = person.type.rawValue
        
        return cell!
    }
    
    
    func showCharacters(characters: [MatrixCharacter]) {
        self.matrixCharacters = characters
        self.tableView.reloadData()
//        authorLabel.text = "\(characters.id)"
//        titleLabel.text = characters.alias
//        descriptionLabel.text = "\(characters.type)"
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

//
//  CharactersViewController.swift
//  MatrixPedia
//
//  Created by Alexandre on 21/11/18.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import UIKit
import Alamofire

class CharactersViewController: UIViewController, Alertable {
    
    // MARK: - Properties
    var matrixCharacters: [MatrixCharacter] = []
    var presenter: ViewToPresenterProtocol?
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        presenter?.updateView()
    }
}

extension CharactersViewController: PresenterToViewProtocol, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matrixCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "MatrixCell"
        
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
    }
    
    func showError() {
        showAlert(title: "Alert!", message: "Problem fetching Characters")
    }
    
}

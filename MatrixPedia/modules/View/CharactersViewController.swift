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
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        
    }

}

extension CharactersViewController: PresenterToViewProtocol {
    
    func showCharacters(characters: MatrixCharacter) {
        authorLabel.text = "\(characters.id)"
        titleLabel.text = characters.alias
        descriptionLabel.text = "\(characters.type)"
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

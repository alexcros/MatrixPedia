//
//  CharacterrProfileViewController.swift
//  MatrixPedia
//
//  Created by Alexandre on 7/11/18.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import UIKit
import Alamofire

class CharacterrProfileViewController: UIViewController {
    
    let characterId: Int
    
    fileprivate lazy var scrollView: UIScrollView = { [unowned self] in
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .yellow
        return scrollView
        }()
    
    fileprivate lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        return stackView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        
    }
    
    init(withCharacterId characterId: Int) {
        self.characterId = characterId
        super.init(nibName:nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadProfile() {
        Alamofire.request("http://127.0.0.1/characters\(characterId)/info").responseJSON{ [weak self] response in
            
            if let data = response.data,
                let jsonData = try? JSONSerialization.jsonObject(with: data,
                                                                 options: JSONSerialization.ReadingOptions.allowFragments),
                let charactersInfo = jsonData as? [[String: Any]],
                let characterInfo = charactersInfo.first,
                let info = CharacterProfile(json: characterInfo) {
                self?.configureViewWith(info: info)
                
            } else {
                self?.navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
    func configureViewWithInfo(info: CharacterProfile) {
        addCoverView(info.coverURL)
        addSectionView(with: "Alias", content: info.alias)
        addSectionView(with: "Name", content: info.name)
        addSectionView(with: "Description", content: info.description)
    }
    
    func setupView() {
        self.title = "Profile"
        setupScrollView()
        setupStackView()
    }
    
    func setupScrollView() {
        self.view.addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
    }
    
    func setupStackView() {
        //scrollView
        
    }
}

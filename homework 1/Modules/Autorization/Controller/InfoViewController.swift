//
//  InfoViewController.swift
//  homework 1
//
//  Created by Dariya on 30/12/23.
//

import UIKit

class InfoViewController: UIViewController {
    
    var person: PersonModel?
    
    private let nameLbl = MakerView.shared.makeLbl()
    
    private let surnameLbl = MakerView.shared.makeLbl()
    
    private let phoneNumLbl = MakerView.shared.makeLbl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
        update()
    }
    
    private func initUI() {
        view.addSubview(nameLbl)
        setupConstraintsForNameLbl()
        
        view.addSubview(surnameLbl)
        setupConstraintsForSurnameLbl()
        
        view.addSubview(phoneNumLbl)
        setupConstraintsForPhoneNumLbl()
    }
    
    private func setupConstraintsForNameLbl() {
        NSLayoutConstraint.activate([
            nameLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }
    
    private func setupConstraintsForSurnameLbl() {
        NSLayoutConstraint.activate([
            surnameLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            surnameLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 30)
        ])
    }
    
    private func setupConstraintsForPhoneNumLbl() {
        NSLayoutConstraint.activate([
            phoneNumLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            phoneNumLbl.topAnchor.constraint(equalTo: surnameLbl.bottomAnchor, constant: 30)
        ])
    }
    
    private func update() {
        if let person = person {
            nameLbl.text = "Name: \(person.name ?? "")"
            surnameLbl.text = "Surname: \(person.surname)"
            phoneNumLbl.text = "Phone Number: \(person.phoneNumber)"
        }
    }
}

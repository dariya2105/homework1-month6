//
//  InfoViewController.swift
//  homework 1
//
//  Created by Dariya on 30/12/23.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let surnameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let phoneNumberLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var personInfo: PersonModel? {
        didSet {
            nameLabel.text = "Name: \(personInfo?.name ?? "" )"
            surnameLabel.text = "Surname: \(personInfo?.surname ?? "")"
            phoneNumberLabel.text = "Phone Number: \(personInfo?.phoneNumber ?? "")"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let personModel = UserSessionManager.shared.getPersonInfo()
        personInfo = personModel
        initUI()
    }
    
    private func initUI() {
        view.addSubview(nameLabel)
        setupConstraintsForNameLabel()
        
        view.addSubview(surnameLabel)
        setupConstraintsForSurnameLabel()
        
        view.addSubview(phoneNumberLabel)
        setupConstraintsForPhoneNumLabel()
    }
    
    private func setupConstraintsForNameLabel() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }
    
    private func setupConstraintsForSurnameLabel() {
        NSLayoutConstraint.activate([
            surnameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            surnameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30)
        ])
    }
    
    private func setupConstraintsForPhoneNumLabel() {
        NSLayoutConstraint.activate([
            phoneNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            phoneNumberLabel.topAnchor.constraint(equalTo: surnameLabel.bottomAnchor, constant: 30)
        ])
    }
}

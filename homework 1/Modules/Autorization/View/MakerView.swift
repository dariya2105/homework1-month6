//
//  MakerView.swift
//  homework 1
//
//  Created by Dariya on 30/12/23.
//

import Foundation
import UIKit

class MakerView {
    
    static let shared = MakerView()
    
    func makeLbl(textColor: UIColor = .black,
                 size: CGFloat = 20,
                 weight: UIFont.Weight = .bold,
                 isFrameLayouts: Bool = false) -> UILabel {
        let label = UILabel()
        label.textColor = textColor
        label.font = .systemFont(ofSize: size, weight: weight)
        label.translatesAutoresizingMaskIntoConstraints = isFrameLayouts
        return label
    }
    
    func makeTF(placeholder: String = " ...",
                textColor: UIColor = .black,
                cornerRadius: CGFloat = 18,
                backgroundColor: UIColor = .systemBackground,
                borderColor: CGColor = UIColor(red: 0.012, green: 0.012, blue: 0.012, alpha: 1).cgColor,
                size: CGFloat = 16,
                weight: UIFont.Weight = .regular,
                borderWidth: CGFloat = 0.5,
                isFrameLayouts: Bool = false
    ) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textColor = textColor
        textField.layer.cornerRadius = cornerRadius
        textField.backgroundColor = backgroundColor
        textField.layer.borderColor = borderColor
        textField.font = .systemFont(ofSize: size, weight: weight)
        textField.translatesAutoresizingMaskIntoConstraints = isFrameLayouts
        let prefixLabel = UILabel()
        prefixLabel.text = "   "
        textField.leftView = prefixLabel
        textField.leftViewMode = .always
        textField.layer.borderWidth = borderWidth
        return textField
    }
    
    func makeButton(setTitle: String = "",
                    setTitleColor: UIColor = .white,
                    backgroundColor: UIColor = .clear,
                    cornerRadius: CGFloat = 0,
                    tintColor: UIColor = .clear,
                    fontSize: CGFloat = 0,
                    fontWeight: UIFont.Weight = .bold,
                    borderWidth: CGFloat = 0,
                    borderColor: CGColor = UIColor.clear.cgColor,
                    isFrameLayouts: Bool = false,
                    isEnabled: Bool = true
    ) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(setTitle, for: .normal)
        button.setTitleColor(setTitleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.tintColor = tintColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
        button.translatesAutoresizingMaskIntoConstraints = isFrameLayouts
        button.isEnabled = isEnabled
        return button
    }
}

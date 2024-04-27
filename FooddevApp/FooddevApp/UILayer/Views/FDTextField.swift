//
//  FDTextField.swift
//  FooddevApp
//
//  Created by Dima on 21.04.2024.
//

import UIKit

class FDTextField: UITextField {

    init(){
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(){
        self.layer.cornerRadius = 24
        self.backgroundColor = AppColors.grey
        self.font = .Roboto.regular.size(of: 14)
        self.placeholder = "Text to input"
        let paddingview = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        self.leftView = paddingview
        self.rightView = paddingview
        self.leftViewMode = .always
        self.rightViewMode = .always
    }
}

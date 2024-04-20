//
//  LoginViewController.swift
//  FooddevApp
//
//  Created by Dima on 19.04.2024.
//

import UIKit

class LoginViewController: UIViewController {

    private let bottomView = BottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.background
        setupLayout()
            }
    
    func facebookPress(){
        print("Facebook pressed")
    }
    func googlePress(){
        print("Google pressed")
    }
}

private extension LoginViewController{
    func setupLayout(){
        setupBottomView()
    }
    func setupBottomView(){
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        bottomView.button1Action = facebookPress
        bottomView.button2Action = googlePress

    }
}

#Preview("LoginVC"){
    LoginViewController()
}

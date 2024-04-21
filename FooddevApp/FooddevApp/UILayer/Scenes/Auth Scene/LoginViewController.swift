//
//  LoginViewController.swift
//  FooddevApp
//
//  Created by Dima on 19.04.2024.
//

import UIKit
protocol LoginViewInput: AnyObject{
    func onSignInTapped()
    func onSignUpTapped()
    func onFacebookTapped()
    func onGoogleTapped()
    func onForgotTapped()
    func onBackPressed()
}
enum LoginViewState{
    case initial
    case siagnIn
    case signUp
}

class LoginViewController: UIViewController {

    //MARK: - Properties
    private var state: LoginViewState = .initial
    weak var viewOutput: LoginViewOutput!
    
    //MARK: - Views
    private lazy var bottomView = BottomView()
    private lazy var textField = FDTextField()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    
    //MARK: - Initializers
    init(viewOutput: LoginViewOutput, state: LoginViewState){
        self.viewOutput = viewOutput
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = AppColors.background
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
        switch state{
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSignInButton()
            setupSignUpButton()
        case .siagnIn:
            setupBottomView()
            
        case .signUp:
            setupBottomView()
            
        }
        
       
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
    
    func setupTextField(){
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 354)
        ])
    }
    
    func setupLogoImage(){
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(resource: .loginLogo)
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 109),
            logoImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 57),
            logoImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -57),
            logoImage.heightAnchor.constraint(equalToConstant: 300)
            
        ])
    }
    func setupSignInButton(){
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.setTitle("Sign In")
        signInButton.scheme = .gray
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
            signInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    func setupSignUpButton(){
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        signUpButton.setTitle("Sign Up")
        signUpButton.scheme = .orange
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            signUpButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}

extension LoginViewController: LoginViewInput{
   
    
    func onSignInTapped() {
        
    }
    
    func onSignUpTapped() {
        
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
    func onBackPressed() {
        
    }
    
}
#Preview("LoginVC"){
    LoginViewController(viewOutput: LoginPresenter(), state: .initial)
}

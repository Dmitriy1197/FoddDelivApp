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
    case signIn
    case signUp
}

class LoginViewController: UIViewController {

    //MARK: - Properties
    private var state: LoginViewState = .initial
    var viewOutput: LoginViewOutput!
    
    //MARK: - Views
    private lazy var bottomView = BottomView()
    private lazy var titleLabel = UILabel()
    private lazy var signInUsername = FDTextField()
    private lazy var signInPassword = FDTextField()
    private lazy var signUpUsername = FDTextField()
    private lazy var signUpPassword = FDTextField()
    private lazy var signUpReEnerPass = FDTextField()
    private lazy var forgotLabel = UILabel()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    private lazy var verticalStack = UIStackView()
    
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
        view.backgroundColor = AppColors.white
        setupLayout()
            }
    
    func facebookPress(){
        print("Facebook pressed")
    }
    func googlePress(){
        print("Google pressed")
    }
}

//MARK: - Layout
private extension LoginViewController{
    func setupLayout(){
        switch state{
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSignInButton()
            setupSignUpButton()
        case .signIn:
            setupBottomView()
            setupVerticalStack()
            setupSignInPassword()
            setupSignInUsername()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
            
        case .signUp:
            setupBottomView()
            setupVerticalStack()
            setupSignUpPass()
            setupSignUpUsername()
            setupSignUpReEnterPass()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
        }
        
       
    }
    
    func setupVerticalStack(){
        view.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStack.spacing = 20
        verticalStack.axis = .vertical
        
        switch state{
        case.initial:
            return
        case.signIn:
            verticalStack.addArrangedSubview(signInUsername)
            verticalStack.addArrangedSubview(signInPassword)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -262)
            ])
        case.signUp:
            verticalStack.addArrangedSubview(signUpUsername)
            verticalStack.addArrangedSubview(signUpPassword)
            verticalStack.addArrangedSubview(signUpReEnerPass)

            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -227)
            ])
        }
        
        
    }
    
    func setupTitleLabel(){
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .Roboto.bold.size(of: 24)
      
        
        switch state{
        case.initial:
            return
        case.signIn:
            titleLabel.text = "Sign In"
    
        case.signUp:
            titleLabel.text = "Sign UP"
        }
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: verticalStack.topAnchor, constant: -38),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30)
        ])
       
    }
    func setupSignInUsername(){
//        view.addSubview(signInUsername)
        signInUsername.translatesAutoresizingMaskIntoConstraints = false
        
        signInUsername.placeholder = "Username"
        NSLayoutConstraint.activate([
//            signInUsername.bottomAnchor.constraint(equalTo: signInPassword.topAnchor, constant: -20),
            signInUsername.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            signInUsername.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            signInUsername.heightAnchor.constraint(equalToConstant: 50)
          
        ])
    }
    func setupSignInPassword(){
//        view.addSubview(signInPassword)
        signInPassword.translatesAutoresizingMaskIntoConstraints = false
        signInPassword.placeholder = "Password"
        
        NSLayoutConstraint.activate([
//            signInPassword.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signInPassword.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            signInPassword.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            signInPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSignUpPass(){
//        view.addSubview(signUpPassword)
        signUpPassword.translatesAutoresizingMaskIntoConstraints = false
        signUpPassword.placeholder = "Enter Password"
        
        NSLayoutConstraint.activate([
//            signUpPassword.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signUpPassword.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            signUpPassword.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            signUpPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignUpUsername(){
//        view.addSubview(signUpUsername)
        signUpUsername.translatesAutoresizingMaskIntoConstraints = false
        signUpUsername.placeholder = "Enter Username"
        
        NSLayoutConstraint.activate([
//            signUpUsername.bottomAnchor.constraint(equalTo: signUpPassword.topAnchor, constant: -20),
            signUpUsername.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            signUpUsername.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            signUpUsername.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignUpReEnterPass(){
//        view.addSubview(signUpReEnerPass)
        signUpReEnerPass.translatesAutoresizingMaskIntoConstraints = false
        signUpReEnerPass.placeholder = "Re-enter Password"
        
        NSLayoutConstraint.activate([
//            signUpReEnerPass.topAnchor.constraint(equalTo: signUpPassword.bottomAnchor, constant: 20),
            signUpReEnerPass.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            signUpReEnerPass.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            signUpReEnerPass.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupForgotLabel(){
        view.addSubview(forgotLabel)
        forgotLabel.translatesAutoresizingMaskIntoConstraints = false
        
        forgotLabel.text = "Forgot Password?"
        forgotLabel.textColor = AppColors.bottomViewGrey
        forgotLabel.font = .Roboto.regular.size(of: 14)
        NSLayoutConstraint.activate([
            forgotLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            forgotLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
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
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor)
            
        ])
    }
    func setupSignInButton(){
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.setTitle("Sign In")
        signInButton.scheme = .orange
        signInButton.action = onSignInTapped
        switch state{
        case .initial:
           
            
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
                signInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
                
            ])
        case .signIn:
            
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
                
            ])
        case .signUp:
            
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
                
            ])
        }
      
    }
    func setupSignUpButton(){
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        signUpButton.setTitle("Sign Up")
        signUpButton.scheme = .orange
        signUpButton.action = onSignUpTapped
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            signUpButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
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


//MARK: - LoginViewInput delegate
extension LoginViewController: LoginViewInput{
   
    
    func onSignInTapped() {
        switch state{
        case.initial:
            viewOutput.goToSignIn()
        case.signIn:
            return
        case.signUp:
            return
        }
    }
    
    func onSignUpTapped() {
        switch state{
        case.initial:
            viewOutput.goToSignUp()
        case.signIn:
            return
        case.signUp:
            return
        }
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
//#Preview("LoginVC"){
//    LoginViewController(viewOutput: LoginPresenter(), state: .initial)
//}

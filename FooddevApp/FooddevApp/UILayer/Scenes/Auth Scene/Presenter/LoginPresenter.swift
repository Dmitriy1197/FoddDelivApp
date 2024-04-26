//
//  LoginPresenter.swift
//  FooddevApp
//
//  Created by Dima on 21.04.2024.
//

import Foundation

protocol LoginViewOutput: AnyObject{
    func loginStart(login: String, password: String)
    func registrationStart()
    func goTofacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotFass()
    func back()
}
class LoginPresenter{
    private var coordinator :LoginCoordinator?
    weak var viewInput : LoginViewInput?
    init(coordinator: LoginCoordinator? = nil, viewInput: LoginViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
}

private extension LoginPresenter{
    func goToMainScreen(){
        coordinator?.finish()
    }
}
extension LoginPresenter: LoginViewOutput{
    func loginStart(login: String, password: String) {
        viewInput?.startLoader()
        if login == "Test@mail.com" && password == "Test123"{
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.0){
                DispatchQueue.main.async {
                    self.viewInput?.stopLoader()
                    self.goToMainScreen()
                }
            }
        } else{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                print("Wrong email or password")
                self.viewInput?.stopLoader()
            }
        }
    }
    
    func registrationStart() {
        
    }
    
    func goTofacebookLogin() {
        
    }
    
    func goToGoogleLogin() {
        
    }
    
    func goToSignIn() {
        coordinator?.showSignInScene()
    }
    
    func goToSignUp() {
        coordinator?.showSignUpScene()
    }
    
    func goToForgotFass() {
        
    }
    
    func back() {
        
    }
    
    
}

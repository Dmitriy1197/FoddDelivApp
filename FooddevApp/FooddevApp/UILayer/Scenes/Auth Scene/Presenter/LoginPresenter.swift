//
//  LoginPresenter.swift
//  FooddevApp
//
//  Created by Dima on 21.04.2024.
//

import Foundation

protocol LoginViewOutput: AnyObject{
    func loginStart()
    func registrationStart()
    func goTofacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotFass()
    func back()
}
class LoginPresenter{
    private var coordinator :AppCoordinator?
    weak var viewInput : LoginViewInput?
    init(coordinator: AppCoordinator? = nil, viewInput: LoginViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
}
extension LoginPresenter: LoginViewOutput{
    func loginStart() {
        
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

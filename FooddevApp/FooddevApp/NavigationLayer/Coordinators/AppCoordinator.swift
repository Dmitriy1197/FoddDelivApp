//
//  AppCoordinator.swift
//  FooddevApp
//
//  Created by Dima on 19.04.2024.
//

import UIKit

class AppCoordinator: Coordinator{
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    override func start() {
        if userStorage.passedOnboarding{
            showAuthFlow()
        } else{
            showOnboardingFlow()
        }
//        let loginPresenter = LoginPresenter(coordinator: self)
//        let loginVC = LoginViewController(viewOutput: loginPresenter, state: .initial)
//        navigationController?.pushViewController(loginVC, animated: true)
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - Navigations metods
private extension AppCoordinator{
    func showOnboardingFlow(){
        guard let navigationController = navigationController else { return}
        factory.makeOnboardingFlow(coordinato: self, finishDelegate: self, navigationController: navigationController)
    }
    func showMainFlow(){
        guard let navigationController = navigationController else { return }
        
        let tabBarController = factory.makeMainFlow(coordinator: self, finishDelegate: self)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
    func showAuthFlow(){
        guard let navigationController = navigationController else { return }
        let vc = factory.makeAuthScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
   
}

//MARK: - Methods
extension AppCoordinator{
    func showSignInScene(){
        guard let navigationController = navigationController else { return }
        let vc = factory.makeSignInScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    func showSignUpScene(){
        guard let navigationController = navigationController else { return }
        let vc = factory.makeSignUpScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
extension AppCoordinator: CoordinatorFinishDelegate{
    func coordinatorDidFinish(childCordinator:  CoordinatorProtocol) {
        removeChildCoordinator(childCordinator)
        switch childCordinator.type{
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showAuthFlow()
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
    
    
}

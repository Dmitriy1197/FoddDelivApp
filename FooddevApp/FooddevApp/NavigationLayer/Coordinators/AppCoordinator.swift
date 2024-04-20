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
//        if userStorage.passedOnboarding{
//            showMainFlow()
//        } else{
//            showOnboardingFlow()
//        }
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - Navigations metod
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
}
extension AppCoordinator: CoordinatorFinishDelegate{
    func coordinatorDidFinish(childCordinator:  CoordinatorProtocol) {
        removeChildCoordinator(childCordinator)
        switch childCordinator.type{
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
    
    
}

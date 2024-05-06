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
    var tabBarController: UITabBarController?
    override func start() {
//                if userStorage.passedOnboarding{
//                    showAuthFlow()
//                } else{
//                    showOnboardingFlow()
//                }
        showMainFlow()
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - Navigations metods
private extension AppCoordinator{
    func showOnboardingFlow(){
        guard let navigationController = navigationController else { return}
        let onboardingCoordinator =  factory.makeOnboardingFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
        onboardingCoordinator.start()
    }
    func showMainFlow(){
        guard let navigationController = navigationController else { return }
        
        let tabBarController = factory.makeMainFlow(coordinator: self, finishDelegate: self)
        self.tabBarController = tabBarController
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .fade
        window?.layer.add(transition, forKey: kCATransition)
        self.window?.rootViewController = self.tabBarController
    }
    func showAuthFlow(){
        guard let navigationController = navigationController else { return }
        let loginCoordinator = factory.makeLoginFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
        loginCoordinator.start()
    }
    
}

//MARK: - FinishDelegate

extension AppCoordinator: CoordinatorFinishDelegate{
    func coordinatorDidFinish(childCordinator:  CoordinatorProtocol) {
        removeChildCoordinator(childCordinator)
        switch childCordinator.type{
        case .onboarding:
            showAuthFlow()
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
        case .login:
            showMainFlow()
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
    
    
}

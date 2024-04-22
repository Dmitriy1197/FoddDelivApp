//
//  SceneFactory.swift
//  FooddevApp
//
//  Created by Dima on 19.04.2024.
//

import UIKit


struct SceneFactory{
    
    //MARK: - Onboarding Flow
    static func makeOnboardingFlow(coordinato: AppCoordinator, finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController){
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: finishDelegate)
        coordinato.addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    static func makeOnboardingScene(coordinator: OnboardingCoordinator) -> OnboardingViewController{
        var pages = [OnboardingPartViewController]()
        
        let firstVC = OnboardingPartViewController()
        firstVC.imageToShow = UIImage(resource: .chickenLeg1)
        firstVC.titleText = "Delicious Food"
        firstVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        firstVC.buttonText = "Next"
        
        let secondVC = OnboardingPartViewController()
        secondVC.imageToShow = UIImage(resource: .shipped1)
        secondVC.titleText = "Fast Shipping"
        secondVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        secondVC.buttonText = "Next"
        
        let thirdVC = OnboardingPartViewController()
        thirdVC.imageToShow = UIImage(resource: .medal1)
        thirdVC.titleText = "Certificate Food"
        thirdVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id."
        thirdVC.buttonText = "Next"
        
        let fourthVC = OnboardingPartViewController()
        fourthVC.imageToShow = UIImage(resource: .creditCard1)
        fourthVC.titleText = "Payment Online"
        fourthVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa."
        fourthVC.buttonText = "Finish!"
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)

        let presenter = OnboardingViewPresenter(coordinator: coordinator)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        return viewController
    }
    
    //MARK: - Main flow
    
    static func makeMainFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate) -> TabBarController{
        let homeNavigationConroller = UINavigationController()
        homeNavigationConroller.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "homekit"), tag: 0)
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationConroller)
        homeCoordinator.finishDelegate = finishDelegate
        homeCoordinator.start()
        
        let orderNavigationConroller = UINavigationController()
        orderNavigationConroller.tabBarItem = UITabBarItem(title: "Order", image: UIImage.init(systemName: "list.bullet.clipboard") , tag: 1)
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationConroller)
        orderCoordinator.finishDelegate = finishDelegate
        orderCoordinator.start()
        
        let listNavigationConroller = UINavigationController()
        listNavigationConroller.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "bookmark.circle"), tag: 2)
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationConroller)
        listCoordinator.finishDelegate = finishDelegate
        listCoordinator.start()
        
        let profileNavigationConroller = UINavigationController()
        profileNavigationConroller.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "person.fill.viewfinder"), tag: 3)
        let profileCoordinator = ProfileCoordinator(type: .home, navigationController: profileNavigationConroller)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        coordinator.addChildCoordinator(homeCoordinator)
        coordinator.addChildCoordinator(orderCoordinator)
        coordinator.addChildCoordinator(listCoordinator)
        coordinator.addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationConroller, orderNavigationConroller, listNavigationConroller, profileNavigationConroller]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        return tabBarController
    }
    
    static func makeAuthScene(coordinator: AppCoordinator) -> LoginViewController{
        let presenter = LoginPresenter(coordinator: coordinator)
        let controller = LoginViewController(viewOutput: presenter, state: .initial)
        return controller
    }
    static func makeSignInScene(coordinator: AppCoordinator) -> LoginViewController{
        let presenter = LoginPresenter(coordinator: coordinator)
        let controller = LoginViewController(viewOutput: presenter, state: .signIn)
        return controller

    }
    static func makeSignUpScene(coordinator: AppCoordinator) -> LoginViewController{
        let presenter = LoginPresenter(coordinator: coordinator)
        let controller = LoginViewController(viewOutput: presenter, state: .signUp)
        return controller

    }
    
}

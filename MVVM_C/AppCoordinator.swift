//
//  AppCoordinator.swift
//  MVVM_C
//
//  Created by developer on 28.08.17.
//  Copyright © 2017 burunduk. All rights reserved.
//

import Foundation
import UIKit


class AppCoordinator : BaseCoordinator<AppCoordinatorFactory, AppControllerFactory>
{
    override func start() {
        let mainCoordinator = coordinatorFactory.makeMainCoordinator(router: router)
        
        mainCoordinator.completionHandler = { [weak self, weak mainCoordinator] in
            if mainCoordinator != nil {
                self?.removeChild(mainCoordinator!)
            }
            
            self?.completionHandler?()
        }
        
        addChild(mainCoordinator)
        mainCoordinator.start()
    }
}



class AppCoordinatorFactory
{
    func makeMainCoordinator(router: Routable) -> MainCoordinator {
        return MainCoordinator(
            router: router,
            coordinatorFactory: MainCoordinatorFactory(),
            controllerFactory: MainControllerFactory()
        )
    }
}


class AppControllerFactory
{
    // Empty
}


class AppRouter : Routable
{
    var presenter: UINavigationController?
    
    
    required init(presenter: UINavigationController) {
        self.presenter = presenter
    }
}

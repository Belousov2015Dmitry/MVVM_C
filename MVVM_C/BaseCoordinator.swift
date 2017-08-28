//
//  BaseCoordinator.swift
//  MVVM_C
//
//  Created by developer on 28.08.17.
//  Copyright © 2017 burunduk. All rights reserved.
//

import Foundation
import UIKit



class BaseCoordinator<CoordinatorFactory, ControllerFactory> : Coordinatable
{
    var completionHandler: CoordinatorHandler? = nil
    
    var router: Routable
    
    let coordinatorFactory: CoordinatorFactory
    let controllerFactory: ControllerFactory
    
    var childCoordinators: [Coordinatable] = []
    
    
    required init(
        router: Routable,
        coordinatorFactory: CoordinatorFactory,
        controllerFactory: ControllerFactory
    ) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.controllerFactory = controllerFactory
    }
    
    func start() { }
    
    
    
    func addChild(_ coordinator: Coordinatable) {
        guard
            childCoordinators.contains(
                where: { (child) -> Bool in return child === coordinator }
            )
            else { return }
        
        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinatable) {
        guard
            let index = childCoordinators.index(
                where: { (child) -> Bool in return child === coordinator }
            )
            else { return }
        
        childCoordinators.remove(at: index)
    }
}

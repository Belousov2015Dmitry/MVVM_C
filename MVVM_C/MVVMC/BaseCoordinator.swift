//
//  BaseCoordinator.swift
//  MVVM_C
//
//  Created by Dmitry Belousov on 28.08.17.
//  Copyright © 2017 Dmitry Belousov. All rights reserved.
//

import Foundation
import UIKit



class BaseCoordinator<CoordinatorFactory, ControllerFactory, ViewModelFactory> : Coordinatable
{
    var completionHandler: CoordinatorHandler? = nil
    
    var router: Routable
    
    let coordinatorFactory: CoordinatorFactory
    let controllerFactory: ControllerFactory
    let viewModelFactory: ViewModelFactory
    
    var childCoordinators: [Coordinatable] = []
    
    
    required init(
        router: Routable,
        coordinatorFactory: CoordinatorFactory,
        controllerFactory: ControllerFactory,
        viewModelFactory: ViewModelFactory
    ) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.controllerFactory = controllerFactory
        self.viewModelFactory = viewModelFactory
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

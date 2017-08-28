//
//  MainCoordinator.swift
//  MVVM_C
//
//  Created by developer on 28.08.17.
//  Copyright © 2017 burunduk. All rights reserved.
//

import Foundation
import UIKit


class MainCoordinator : BaseCoordinator<MainCoordinatorFactory, MainControllerFactory>
{
    override func start() {
        let mainController = controllerFactory.makeMainController()
        
        mainController.completionHandler = { [weak self] (result: MainResult) in
            switch result {
            case .Exit:
                self?.completionHandler?()
                
            default:
                break
            }
        }
    }
}



class MainCoordinatorFactory
{
    // Empty
}


class MainControllerFactory
{
    func makeMainController() -> MainViewController {
        return MainViewController.newInstance()
    }
}

enum MainResult {
    case Exit
}

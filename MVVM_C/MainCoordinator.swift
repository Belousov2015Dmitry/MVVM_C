//
//  MainCoordinator.swift
//  MVVM_C
//
//  Created by developer on 06.09.17.
//  Copyright © 2017 burunduk. All rights reserved.
//

import Foundation



class MainCoordinator : BaseCoordinator<MainCoordinatorsFactory, MainControllersFactory, MainViewModelFactory>
{
    override func start() {
        showRedController()
    }
    
    
    private func showRedController() {
        let redController = controllerFactory.makeRedController()
        
        redController.viewModel = viewModelFactory.makeRedViewModel()
        
        redController.completionHandler = { [weak self] (result) in
            
            if result == .Next {
                self?.showGreenController()
            }
        }
        
        router.push(controller: redController, animated: true)
    }
    
    private func showGreenController() {
        let greenController = controllerFactory.makeGreenController()
        
        greenController.viewModel = viewModelFactory.makeGreenViewModel()
        
        greenController.completionHandler = { [weak self] (result) in
            
            switch result {
                case .Back:
                    self?.router.pop(animated: true)
                    
                case .Done:
                    self?.showFinalFlow()
            }
        }

        self.router.push(controller: greenController, animated: true)
    }
    
    private func showFinalFlow() {
        let finalCoordinator = coordinatorFactory.makeFinalCooordinator(router: router)
        
        self.addChild(finalCoordinator)
        
        finalCoordinator.completionHandler = { [weak self] in
            self?.removeChild(finalCoordinator)
            
            if let first = self?.router.presenter?.viewControllers.first {
                self?.router.pop(to: first, animated: true)
            }
        }
        
        finalCoordinator.start()
    }
}



class MainCoordinatorsFactory
{
    func makeFinalCooordinator(router: Routable) -> FinalCoordinator {
        return FinalCoordinator(
            router: router,
            coordinatorFactory: FinalCoordinatorsFactory(),
            controllerFactory: FinalControllersFactory(),
            viewModelFactory: FinalViewModelsFactory()
        )
    }
}



class MainControllersFactory
{
    func makeRedController() -> RedViewController {
        return RedViewController.newInstance()
    }
    
    func makeGreenController() -> GreenViewController {
        return GreenViewController.newInstance()
    }
}



class MainViewModelFactory
{
    func makeRedViewModel() -> RedViewModel {
        return RedViewModel()
    }
    
    func makeGreenViewModel() -> GreenViewModel {
        return GreenViewModel()
    }
}



enum RedResult
{
    case Next
}


enum GreenResult
{
    case Back
    case Done
}




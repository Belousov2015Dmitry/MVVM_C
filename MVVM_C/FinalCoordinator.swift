//
//  FinalCoordinator.swift
//  MVVM_C
//
//  Created by developer on 06.09.17.
//  Copyright © 2017 burunduk. All rights reserved.
//

import Foundation



class FinalCoordinator : BaseCoordinator<FinalCoordinatorsFactory, FinalControllersFactory, FinalViewModelsFactory>
{
    override func start() {
        self.showFinalController()
    }
    
    
    private func showFinalController() {
        let finalController = controllerFactory.makeFinalController()
        
        finalController.viewModel = viewModelFactory.makeFinalViewModel()
        
        finalController.completionHandler = { [weak self] (result) in
            
            if result == .Exit {
                self?.completionHandler?()
            }
        }
        
        self.router.push(controller: finalController, animated: true)
    }
}



class FinalCoordinatorsFactory {}



class FinalControllersFactory
{
    func makeFinalController() -> FinalViewController {
        return FinalViewController.newInstance()
    }
}



class FinalViewModelsFactory
{
    func makeFinalViewModel() -> FinalViewModel {
        return FinalViewModel()
    }
}



enum FinalResult
{
    case Exit
}

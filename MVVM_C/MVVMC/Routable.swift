//
//  Routable.swift
//  MVVM_C
//
//  Created by developer on 28.08.17.
//  Copyright © 2017 burunduk. All rights reserved.
//

import Foundation
import UIKit



protocol Routable
{
    weak var presenter: UINavigationController? { get }
    
    func present(controller: UIViewController, animated: Bool)
    func dismiss(animated: Bool)
    
    func push(controller: UIViewController, animated: Bool)
    func pop(animated: Bool)
    func pop(to: UIViewController, animated: Bool)
}



extension Routable
{
    func present(controller: UIViewController, animated: Bool = true) {
        presenter?.present(controller, animated: animated, completion: nil)
    }
    
    func dismiss(animated: Bool = true) {
        presenter?.dismiss(animated: animated, completion: nil)
    }
    
    func push(controller: UIViewController, animated: Bool = true) {
        presenter?.pushViewController(controller, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        _ = presenter?.popViewController(animated: animated)
    }
    
    func pop(to controller: UIViewController, animated: Bool = true) {
        _ = presenter?.popToViewController(controller, animated: animated)
    }
}

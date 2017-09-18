//
//  Coordinatable.swift
//  MVVM_C
//
//  Created by Dmitry Belousov on 28.08.17.
//  Copyright © 2017 Dmitry Belousov. All rights reserved.
//

import Foundation
import UIKit


typealias CoordinatorHandler = () -> ()


protocol Coordinatable : class
{
    var completionHandler: CoordinatorHandler? { get set }
    
    var router: Routable { get set }
    
    func start()
}

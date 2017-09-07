//
//  Coordinatable.swift
//  MVVM_C
//
//  Created by developer on 28.08.17.
//  Copyright © 2017 burunduk. All rights reserved.
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

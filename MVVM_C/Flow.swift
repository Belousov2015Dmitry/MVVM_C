//
//  Coordinatable.swift
//  MVVM_C
//
//  Created by developer on 28.08.17.
//  Copyright © 2017 burunduk. All rights reserved.
//

import Foundation
import UIKit


typealias FlowHandler<R> = (R) -> ()


protocol FlowController
{
    associatedtype R
    
    var completionHandler: FlowHandler<R>? { get set }
}






















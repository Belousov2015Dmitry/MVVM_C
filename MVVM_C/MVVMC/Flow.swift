//
//  Coordinatable.swift
//  MVVM_C
//
//  Created by Dmitry Belousov on 28.08.17.
//  Copyright © 2017 Dmitry Belousov. All rights reserved.
//

import Foundation
import UIKit


typealias FlowHandler<R> = (R) -> ()


protocol FlowController
{
    associatedtype R
    associatedtype VM
    
    var completionHandler: FlowHandler<R>? { get set }
    
    var viewModel: VM? { get set }
}






















//
//  AppRouter.swift
//  MVVM_C
//
//  Created by developer on 06.09.17.
//  Copyright © 2017 burunduk. All rights reserved.
//

import Foundation
import UIKit



class AppRouter : Routable
{
    var presenter: UINavigationController?
    
    
    required init(presenter: UINavigationController) {
        self.presenter = presenter
    }
}

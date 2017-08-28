//
//  MainViewController.swift
//  MVVM_C
//
//  Created by developer on 28.08.17.
//  Copyright © 2017 burunduk. All rights reserved.
//

import Foundation
import UIKit


class MainViewController : UIViewController, FlowController
{
    static func newInstance() -> MainViewController {
        return UIStoryboard
            .init(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "MainID") as! MainViewController
    }
    
    
    typealias R = MainResult
    
    var completionHandler: FlowHandler<MainResult>? = nil
}

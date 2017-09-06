//
//  MainViewController.swift
//  MVVM_C
//
//  Created by developer on 06.09.17.
//  Copyright © 2017 burunduk. All rights reserved.
//

import Foundation
import UIKit


class RedViewController : UIViewController, FlowController
{
    typealias R = RedResult
    typealias VM = RedViewModel
    
    
    var completionHandler: ((RedResult) -> ())?
    var viewModel: RedViewModel?
    
    
    
    static func newInstance() -> RedViewController {
        return UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "RedID")
                        as! RedViewController
    }
    
    
    //actions:
    
    @IBAction func nextTapped(_ sender: UIButton) {
        self.completionHandler?(.Next)
    }
}


class RedViewModel
{
    
}

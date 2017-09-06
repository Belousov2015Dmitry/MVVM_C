//
//  GreenViewController.swift
//  MVVM_C
//
//  Created by developer on 06.09.17.
//  Copyright © 2017 burunduk. All rights reserved.
//

import Foundation
import UIKit


class GreenViewController : UIViewController, FlowController
{
    typealias R = GreenResult
    typealias VM = GreenViewModel
    
    
    var completionHandler: ((GreenResult) -> ())?
    var viewModel: GreenViewModel?
    
    
    static func newInstance() -> GreenViewController {
        return UIStoryboard(name: "Main", bundle: nil)
                    .instantiateViewController(withIdentifier: "GreenID")
                        as! GreenViewController
    }
    
    
    //actions:
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.completionHandler?(.Back)
    }
    
    @IBAction func doneTapped(_ sender: UIButton) {
        self.completionHandler?(.Done)
    }
}


class GreenViewModel
{
    
}

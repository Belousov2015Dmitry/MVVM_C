//
//  FinalViewController.swift
//  MVVM_C
//
//  Created by developer on 06.09.17.
//  Copyright © 2017 burunduk. All rights reserved.
//

import Foundation
import UIKit



class FinalViewController : UIViewController, FlowController
{
    typealias R = FinalResult
    typealias VM = FinalViewModel
    
    
    var completionHandler: ((FinalResult) -> ())?
    var viewModel: FinalViewModel?
    
    
    
    static func newInstance() -> FinalViewController {
        return UIStoryboard(name: "Final", bundle: nil)
                    .instantiateViewController(withIdentifier: "FinalID")
                        as! FinalViewController
    }
    
    
    //actions:
    
    @IBAction func exitTapped(_ sender: UIButton) {
        self.completionHandler?(.Exit)
    }
}



class FinalViewModel
{
    
}

//
//  SplitViewController.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController, SplitViewProtocol {

    var output:SplitPresenterProtocol?
    var viewController:UIViewController {
        
        get {
            
            return self
        }
    }
    
    func setSplittedControllers(viewControllers:[UIViewController]) {
        
        let count = viewControllers.count
        if count != 2 {
            
            return
        }
        self.viewControllers = viewControllers
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

//
//  DeepVIPERProtocols.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/21/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit


protocol ModuleProtocol {
    
    init(window:UIWindow)
    func makeRoot()->UIViewController
    func pushFrom(navigationController:UINavigationController)
    func popFrom(navigationController:UINavigationController)
    
    var view:UIViewController {get}
}

protocol ViewProtocol {

    var viewController:UIViewController {get}
}

protocol InteractorProtocol {
    
}

protocol PresenterProtocol {
    
    var viewController:UIViewController {get}
}



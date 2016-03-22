//
//  EmptyDetailModule.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class EmptyDetailModule: NSObject, EmptyDetailModuleProtocol {

    var rootWindow:UIWindow
    var presenter: EmptyDetailPresenterProtocol
    
    required init(window:UIWindow) {
        
        rootWindow = window
        
        let view = EmptyDetailViewController(nibName: "EmptyDetailViewController", bundle: NSBundle.mainBundle())
        let interactor = EmptyDetailInteractor()
        presenter = EmptyDetailPresenter(view: view, interactor: interactor)
        super.init()
        
    }
    func makeRoot()->UIViewController {
        
        let result = presenter.viewController
        rootWindow.rootViewController = result
        rootWindow.makeKeyAndVisible()
        return result
    }
    
    func pushFrom(navigationController:UINavigationController) {
        
        navigationController.pushViewController(presenter.viewController, animated: true)
    }
    
    func popFrom(navigationController:UINavigationController) {
        
        navigationController.popViewControllerAnimated(true)
    }

}

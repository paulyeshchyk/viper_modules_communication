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
    var emptyDetailView:EmptyDetailViewProtocol
    
    var view: UIViewController {
        
        get {
            
            return self.emptyDetailView.viewController
        }
    }
    
    required init(window:UIWindow) {
        
        rootWindow = window
        
        emptyDetailView = EmptyDetailViewController(nibName: "EmptyDetailViewController", bundle: NSBundle.mainBundle())
        let interactor = EmptyDetailInteractor()
        presenter = EmptyDetailPresenter(view: emptyDetailView, interactor: interactor)
        super.init()
        
    }
    func makeRoot()->UIViewController {
        
        rootWindow.rootViewController = self.view
        rootWindow.makeKeyAndVisible()
        return self.view
    }
    
    func pushFrom(navigationController:UINavigationController) {
        
        navigationController.pushViewController(self.view, animated: true)
    }
    
    func popFrom(navigationController:UINavigationController) {
        
        navigationController.popViewControllerAnimated(true)
    }

}

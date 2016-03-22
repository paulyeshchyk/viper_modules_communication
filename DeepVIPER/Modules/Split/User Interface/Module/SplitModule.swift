//
//  SplitModule.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class SplitModule: SplitModuleProtocol {

    var presenter:SplitPresenterProtocol
    var splitView:SplitViewProtocol
    var interactor:SplitInteractorProtocol
    var rootWindow:UIWindow

    var emptyDetailPresenter: PresenterProtocol? {
        
        didSet {
            
            self.presenter.emptyDetailPresenter = emptyDetailPresenter
        }
    }
    
    var masterPresenter: PresenterProtocol? {
        
        didSet {

            self.presenter.masterPresenter = masterPresenter
        }
    }
    
    var detailPresenter: PresenterProtocol? {
        
        didSet {
            
            self.presenter.detailPresenter = detailPresenter
        }
    }
    
    required init(window: UIWindow) {
        
        rootWindow = window
        
        splitView = SplitViewController()
        interactor = SplitInteractor()
        
        presenter = SplitPresenter(view: splitView, splitInteractor: interactor)

    }
    
    
    func pushFrom(navigationController:UINavigationController) {
        
        navigationController.pushViewController(presenter.viewController, animated: true)
    }
    
    func popFrom(navigationController: UINavigationController) {
        
        navigationController.popViewControllerAnimated(true)
    }
    
    func makeRoot() -> UIViewController{
        
        let result = presenter.viewController
        rootWindow.rootViewController = result
        rootWindow.makeKeyAndVisible()
        return result
    }
}

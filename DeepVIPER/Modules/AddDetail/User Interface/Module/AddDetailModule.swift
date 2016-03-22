//
//  AddDetailModule.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class AddDetailModule:NSObject, AddDetailModuleProtocol,AddDetailPresenterOutput {

    var presenter:AddDetailPresenterProtocol
    var addDetailView:AddDetailViewProtocol
    var addDetailInteractor:AddDetailInteractorProtocol
    var saveOutput:AddDetailModuleOutput?
    var cancelOutput:CancelAddDetailModuleOutput?
    
    var useCancelButton:Bool
    
    var routerWindow:UIWindow
    
    required init(window: UIWindow) {
        
        routerWindow = window
        useCancelButton = false
        
        addDetailInteractor = AddDetailInteractor()
        
        addDetailView = AddDetailViewController(nibName:"AddDetailViewController", bundle: NSBundle.mainBundle())
        presenter = AddDetailPresenter(view: addDetailView, interactor:addDetailInteractor)
        addDetailView.output = presenter
        
        super.init()
        presenter.output = self
    }
    
    func makeRoot()->UIViewController{
        
        let result = presenter.viewController
        routerWindow.rootViewController = result
        routerWindow.makeKeyAndVisible()
        return result
    }
    
    func pushFrom(navigationController:UINavigationController) {
        
        presenter.pushUsingNavigationController(navigationController)
    }
    
    func popFrom(navigationController: UINavigationController) {
        
        presenter.popFromNavigationController(navigationController)
    }
    
    
    func hasCancelButton() -> Bool {
        
        return self.useCancelButton
    }
    
    func cancelAddDetail() {
        
        guard let cancelOutput = self.cancelOutput else {
            
            return
        }
        
        cancelOutput()
    }
    
    func saveDetail() {
        
        guard let saveOutput = self.saveOutput else {
            
            return
        }
        
        saveOutput()
    }
}

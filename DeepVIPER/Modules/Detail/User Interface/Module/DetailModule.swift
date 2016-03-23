//
//  DetailModule.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class DetailModule:NSObject, DetailModuleProtocol,DetailPresenterOutput {

    var presenter:DetailPresenterProtocol
    var detailView:DetailViewProtocol
    var detailInteractor:DetailInteractorProtocol
    var saveOutput:DetailModuleOutput?
    var cancelOutput:CancelAddDetailModuleOutput?
    
    var useCancelButton:Bool
    
    var routerWindow:UIWindow
    
    var ponso: ListPONSO? {
        
        didSet {
            
            self.presenter.ponso = self.ponso
        }
    }

    required init(window: UIWindow) {
        
        routerWindow = window
        useCancelButton = false
        
        detailInteractor = DetailInteractor()
        
        detailView = DetailViewController(nibName:"DetailViewController", bundle: NSBundle.mainBundle())
        presenter = DetailPresenter(view: detailView, interactor:detailInteractor)
        detailView.output = presenter
        
        super.init()
        presenter.output = self
    }
    
    func makeRoot()->UIViewController{
        
        presenter.ponso = self.ponso

        let result = presenter.viewController
        routerWindow.rootViewController = result
        routerWindow.makeKeyAndVisible()
        return result
    }
    
    func pushFrom(navigationController:UINavigationController) {
        
        presenter.ponso = self.ponso
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
    
    func saveDetail(ponso:ListPONSO) {
        
        guard let saveOutput = self.saveOutput else {
            
            return
        }
        
        saveOutput(ponso:ponso)
    }
}

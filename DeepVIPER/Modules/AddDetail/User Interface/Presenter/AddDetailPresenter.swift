//
//  AddDetailPresenter.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class AddDetailPresenter: NSObject, AddDetailPresenterProtocol {

    var rootView:AddDetailViewProtocol
    var rootInteractor:AddDetailInteractorProtocol
    var output:AddDetailPresenterOutput?
    
    var viewController: UIViewController {
        
        get {
            let result = UINavigationController(rootViewController: rootView.viewController)
            return result
        }
    }
    
    required init(view: AddDetailViewProtocol, interactor: AddDetailInteractorProtocol) {

        rootView = view
        rootInteractor = interactor
        super.init()
    }
    
    
    func pushUsingNavigationController(nc:UINavigationController) {
        
        let hasCancelButton = self.output?.hasCancelButton()
        rootView.hasCancelButton = hasCancelButton!
        
        nc.pushViewController(rootView.viewController, animated: true)
    }
    
    func popFromNavigationController(nc:UINavigationController) {

        nc.popViewControllerAnimated(true)
    }
    
    
    func redrawData() {
        
        
        
    }

    
    func cancelAddItem() {
    
        
        guard let output = self.output else {
            
            return
        }
        
        output.cancelAddDetail()
    }
    
    func saveItem() {
        
        guard let output = self.output else {

            return
        }
        
        output.saveDetail()
        
    }
    
    func fetchData() {
         
        self.rootInteractor.refetchData()
    }
}

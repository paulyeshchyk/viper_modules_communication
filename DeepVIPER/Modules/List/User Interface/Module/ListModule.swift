//
//  ListModule.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/21/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListModule: ListModuleProtocol, ListPresenterOutput {

    var presenter:ListPresenterProtocol
    var listView:ListViewProtocol
    var listInteractor:ListInteractorProtocol
    var addOutput:ListModuleAddDetailOutput?
    var openOutput: ListModuleOpenDetailOutput?
    
    var routerWindow:UIWindow
    
    required init(window: UIWindow) {
        
        routerWindow = window

        let datamanager = ListDataManager()
        listInteractor = ListInteractor(datasource:datamanager)

        listView = ListViewController(nibName:"ListViewController", bundle: NSBundle.mainBundle())
        presenter = ListPresenter(view: listView, interactor:listInteractor)

        listInteractor.output = presenter
        
        listView.output = presenter
        listView.input = listInteractor
        
        presenter.output = self
    }
    
    func pushFrom(navigationController:UINavigationController) {
        
        navigationController.pushViewController(listView.viewController, animated: true)
    }

    func popFrom(navigationController: UINavigationController) {
        
        navigationController.popViewControllerAnimated(true)
    }
    
    func makeRoot() -> UIViewController{
        
        let result = presenter.viewController
        routerWindow.rootViewController = result
        routerWindow.makeKeyAndVisible()
        return result
    }
    
    func openItem(item: ListPONSO) {
        
        guard let openOutput = self.openOutput else {
            
            return
        }
        
        openOutput(item:item)
    }
    
    func openAddDetail() {
        
        guard let addOutput = self.addOutput else {

            return
        }
        
        addOutput()
        
    }
}


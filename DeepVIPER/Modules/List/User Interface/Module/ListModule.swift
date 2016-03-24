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
    let datamanager: ListDatasourceProtocol
    var listInteractor:ListInteractorProtocol
    var addOutput:ListModuleAddDetailOutput?
    var openOutput: ListModuleOpenDetailOutput?
    
    var routerWindow:UIWindow
    var view: UIViewController {
        
        get {
            
            return self.listView.viewController
        }
    }
    
    required init(window: UIWindow) {
        
        routerWindow = window

        datamanager = ListDataManager()
        listInteractor = ListInteractor(datasource:datamanager)

        listView = ListViewController(nibName:"ListViewController", bundle: NSBundle.mainBundle())
        presenter = ListPresenter(view: listView, interactor:listInteractor)

        listInteractor.output = presenter
        
        listView.output = presenter
        listView.input = listInteractor
        
        presenter.output = self
    }
    
    func pushFrom(navigationController:UINavigationController) {
        
        navigationController.pushViewController(self.view, animated: true)
    }

    func popFrom(navigationController: UINavigationController) {
        
        navigationController.popViewControllerAnimated(true)
    }
    
    func makeRoot() -> UIViewController{
        
        routerWindow.rootViewController = self.view
        routerWindow.makeKeyAndVisible()
        return self.view
    }
    
    func updatePonso(ponso: ListPONSO) {
     
        datamanager.updatePonso(ponso)
    }
    
    func refreshPonso(ponso: ListPONSO) {
        
        let index = datamanager.indexOfItem(ponso)
        self.presenter.redrawItemAtIndex(index)
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


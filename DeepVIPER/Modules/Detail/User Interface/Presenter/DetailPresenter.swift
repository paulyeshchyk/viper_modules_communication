//
//  DetailPresenter.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class DetailPresenter: NSObject, DetailPresenterProtocol {

    var rootView:DetailViewProtocol
    var rootInteractor:DetailInteractorProtocol
    var output:DetailPresenterOutput?
    
    var viewController: UIViewController {
        
        get {
            let result = UINavigationController(rootViewController: rootView.viewController)
            return result
        }
    }
    
    var ponso: ListPONSO? {
        
        didSet {
            
            rootView.nameValue = ponso?.text
            rootView.identValue = ponso?.ident
            rootView.redrawData()
        }
    }
    
    required init(view: DetailViewProtocol, interactor: DetailInteractorProtocol) {

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
        
        guard let ponso = self.ponso else {
            
            return
        }
        
        ponso.ident = rootView.identValue!
        ponso.text = rootView.nameValue!
        
        output.saveDetail(ponso)
        
    }
    
    func fetchData() {
         
        self.rootInteractor.refetchData()
    }
}

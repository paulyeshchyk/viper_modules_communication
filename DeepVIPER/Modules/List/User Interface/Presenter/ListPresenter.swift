//
//  ListPresenter.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/21/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListPresenter: ListPresenterProtocol {

    var listView:ListViewProtocol
    var listInteractor:ListInteractorProtocol
    var output:ListPresenterOutput?
    
    var viewController: UIViewController {
    
        get {
            
            let result = UINavigationController(rootViewController: listView.viewController)
            return result
        }
    }
    
    required init(view: ListViewProtocol, interactor: ListInteractorProtocol) {
        
        listView = view
        listInteractor = interactor
        
    }
    
    func fetchData() {
        
        self.listInteractor.refetchData()
    }
    
    func addItem() {
        
        guard let output = self.output else {
            
            return
        }
        
        output.openAddDetail()
    }

    func redrawData() {
        
        self.listView.reloadTableview()
    }
    
    func openDetailAtIndex(index: Int) {
        
        let item = self.listInteractor.listItemAtIndex(index)
        
        self.output?.openItem(item)
    }
}

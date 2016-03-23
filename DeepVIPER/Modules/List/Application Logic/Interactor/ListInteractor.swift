//
//  ListInteractor.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/21/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListInteractor: NSObject, ListInteractorProtocol, ListDataSourceListenerProtocol {
    
    var output:ListPresenterProtocol?
    var datasource:ListDatasourceProtocol
    var selectedItem:String?

    deinit {
        
        self.datasource.listener = nil
    }
    required init(datasource: ListDatasourceProtocol) {
        
        self.datasource = datasource
        super.init()
        self.datasource.listener = self
    }
    
    
    func refetchData() {
        
        //TODO: make service call
        
        
        output?.redrawData()
        
    }
    
    func listItemsCount()->Int {
        
        return self.datasource.numberOfItems()
    }
    
    func listItemAtIndex(index:Int)->ListPONSO {
        
        return self.datasource.itemAtIndex(index)
    }
    
    func hasUpdatedData() {
        
        self.refetchData()
    }

    
}

//
//  ListInteractor.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/21/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListInteractor: NSObject, ListInteractorProtocol {
    
    var output:ListPresenterProtocol?
    var datasource:ListDatasourceProtocol
    var selectedItem:String?

    required init(datasource: ListDatasourceProtocol) {
        
        self.datasource = datasource
        super.init()
    }
    
    
    func refetchData() {
        
        //TODO: make service call
        
        guard let output = self.output else {
            
            return
        }
        
        output.redrawData()
        
    }
    
    func listItemsCount()->Int {
        
        return self.datasource.numberOfItems()
    }
    
    func listItemAtIndex(index:Int)->ListPONSO {
        
        return self.datasource.itemAtIndex(index)
    }

    
}

//
//  ListDataManager.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/21/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListDataManager: NSObject, ListDatasourceProtocol {

    var items:[ListPONSO] = [ListPONSO(aIdent:"ABC",aText: "ABC"),
                             ListPONSO(aIdent:"BCD",aText: "BCD"),
                             ListPONSO(aIdent:"CDE",aText: "CDE"),
                             ListPONSO(aIdent:"DEF",aText: "DEF")]
    
    
    func numberOfItems()->Int {
        
        return items.count
    }
    
    func itemAtIndex(index:Int)->ListPONSO {
        
        return items[index]
    }

    
}

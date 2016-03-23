//
//  ListDataManager.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/21/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListDataManager: NSObject, ListDatasourceProtocol {

    var listener: ListDataSourceListenerProtocol?
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

    
    func updatePonso(ponso:ListPONSO) {
        
        
        let arr = items.filter({ (found) -> Bool in

            let compareResult = found.ident.compare(ponso.ident)
            return ( compareResult == .OrderedSame)
        })
        
        for obj in arr {

            obj.text = ponso.text
        }
        
        listener?.hasUpdatedData()
        
    }
    
    func indexOfItem(item: ListPONSO) -> Int {
        
        var result:Int = -1

        let index =  items.indexOf({ (found:ListPONSO) -> Bool in
            
            let compareResult = found.ident.compare(item.ident)
            
            return (compareResult == .OrderedSame)
        })
        result = index!

        return result
    }

    func addPonso(ponso:ListPONSO) {
        
        self.items.append(ponso)
    }
    
}

//
//  ListPONSO.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/21/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListPONSO: NSObject {

    var ident:String
    var text:String
    required init(aIdent:String, aText:String) {
        
        ident = aIdent
        text = aText
    }
    
}

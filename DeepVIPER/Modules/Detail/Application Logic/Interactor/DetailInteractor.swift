//
//  DetailInteractor.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class DetailInteractor: NSObject, DetailInteractorProtocol {

    var output:DetailPresenterProtocol?

    
    func refetchData() {
        
        //TODO: make service call
    
        guard let output = self.output else {
            
            return
        }
        
        output.redrawData()
    
    }
    
}

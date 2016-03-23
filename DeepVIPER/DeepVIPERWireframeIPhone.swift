//
//  DeepVIPERAssemblerIPhone.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/21/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class DeepVIPERWireframeIPhone: DeepVIPERWireframe {

    let listModule:ListModuleProtocol
    var detailModule:DetailModuleProtocol
    var root:UIViewController?
    
    required init(window:UIWindow) {

        listModule = ListModule(window: window)
        detailModule = DetailModule(window: window)

        super.init(window:window)

        listModule.openOutput = {(item) in
        
            //TODO: tempo
            
            guard let nc = self.root as? UINavigationController else {
                
                return
            }
            
            self.detailModule.ponso = item
            self.detailModule.pushFrom(nc)
        }
        
        listModule.addOutput = {() in
        
            guard let nc = self.root as? UINavigationController else {

                return
            }
            
            self.detailModule.pushFrom(nc)
        }

        detailModule.saveOutput = {(ponso) in
        
            self.listModule.updatePonso(ponso)
            
            guard let nc = self.root as? UINavigationController else {
                
                return
            }
            self.detailModule.popFrom(nc)
        }

        detailModule.cancelOutput = {() in
        
            guard let nc = self.root as? UINavigationController else {
                
                return
            }
            self.detailModule.popFrom(nc)

        }
        
    }
    
    func launchApplication() {
        
        root = self.listModule.makeRoot()
    }

}

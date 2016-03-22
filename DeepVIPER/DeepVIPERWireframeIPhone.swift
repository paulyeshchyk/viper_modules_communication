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
    let addDetailModule:AddDetailModuleProtocol
    var root:UIViewController?
    
    required init(window:UIWindow) {

        listModule = ListModule(window: window)
        addDetailModule = AddDetailModule(window: window)

        super.init(window:window)

        listModule.openOutput = {(item) in
        
            //TODO: tempo
            
            guard let nc = self.root as? UINavigationController else {
                
                return
            }
            
            self.addDetailModule.pushFrom(nc)
        }
        
        listModule.addOutput = {() in
        
            guard let nc = self.root as? UINavigationController else {

                return
            }
            
            self.addDetailModule.pushFrom(nc)
        }

        addDetailModule.saveOutput = {() in
        
            guard let nc = self.root as? UINavigationController else {
                
                return
            }
            self.addDetailModule.popFrom(nc)
        }

        addDetailModule.cancelOutput = {() in
        
            guard let nc = self.root as? UINavigationController else {
                
                return
            }
            self.addDetailModule.popFrom(nc)

        }
        
    }
    
    func launchApplication() {
        
        root = self.listModule.makeRoot()
    }

}

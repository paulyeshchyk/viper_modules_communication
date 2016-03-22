//
//  DeepVIPERAssemblerIPhone.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/21/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class DeepVIPERWireframeIPad: DeepVIPERWireframe {

    let splitModule:SplitModuleProtocol
    let listModule:ListModuleProtocol
    let addDetailModule:AddDetailModuleProtocol
    let emptyDetailModule:EmptyDetailModuleProtocol
    
    var root:UIViewController?
    
    required init(window:UIWindow) {
        
        splitModule = SplitModule(window: window)
        listModule = ListModule(window: window)
        addDetailModule = AddDetailModule(window: window)
        emptyDetailModule = EmptyDetailModule(window: window)

        super.init(window:window)
        
        addDetailModule.useCancelButton = true
        
        splitModule.masterPresenter = listModule.presenter
        splitModule.detailPresenter = addDetailModule.presenter
        splitModule.emptyDetailPresenter = emptyDetailModule.presenter
        
        listModule.openOutput = {(item) in

            self.splitModule.presenter.selectedItem = item
        }
        
        listModule.addOutput = {() in

            self.addDetailModule.useCancelButton = true
        }

        addDetailModule.saveOutput = {() in
            
        }

        addDetailModule.cancelOutput = {() in
            
        }

        
    }
    
    func launchApplication() {
        
        root = self.splitModule.makeRoot()
    }

}

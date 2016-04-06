//
//  DeepVIPERAssemblerIPhone.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/21/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class DeepVIPERWireframeIPad: DeepVIPERWireframe {

    var splitModule:SplitModuleProtocol
    let listModule:ListModuleProtocol
    var detailModule:DetailModuleProtocol
    let emptyDetailModule:EmptyDetailModuleProtocol
    
    var root:UIViewController?
    
    required init(window:UIWindow) {
        
        splitModule = SplitModule(window: window)
        listModule = ListModule(window: window)
        detailModule = DetailModule(window: window)
        emptyDetailModule = EmptyDetailModule(window: window)

        super.init(window:window)
        
        splitModule.masterPresenter = listModule.presenter
        splitModule.detailPresenter = detailModule.presenter
        splitModule.emptyDetailPresenter = emptyDetailModule.presenter
        
        listModule.openOutput = {(item) in

            
            self.detailModule.detail = item
            self.splitModule.presenter.selectedItem = item
        }
        
        listModule.addOutput = {() in

        }

        detailModule.saveOutput = {(ponso) in
            
            self.listModule.refreshPonso(ponso)
        }

        detailModule.cancelOutput = {() in
            
        }

        
    }
    
    func launchApplication() {
        
        root = self.splitModule.makeRoot()
    }

}

//
//  SplitPresenter.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class SplitPresenter: NSObject, SplitPresenterProtocol {

    var splitView:SplitViewProtocol
    var interactor:SplitInteractorProtocol?

    var masterPresenter:PresenterProtocol? {
        
        didSet {
            
            self.rebuildPresenters()
        }
    }
    var detailPresenter:PresenterProtocol? {
        
        didSet {
            
            self.rebuildPresenters()
        }
    }
    var emptyDetailPresenter:PresenterProtocol? {
        
        didSet {
            
            self.rebuildPresenters()
        }
    }
    
    var viewController: UIViewController {
        
        get {
            
            return splitView.viewController
        }
    }
    
    required init(view:SplitViewProtocol, splitInteractor:SplitInteractorProtocol) {
        
        splitView = view
        interactor = splitInteractor
    }
    
    var selectedItem: ListPONSO? {
        
        didSet {
            
            self.interactor?.selectedItem = self.selectedItem
            self.rebuildPresenters()
        }
    }

    func rebuildPresenters() {

        guard let interactor = self.interactor else {
            
            return
        }
        
        var vcs:[UIViewController] = []
        
        guard let master = self.masterPresenter else {
            
            return
        }
        vcs.append(master.viewController)

        
        let hasSelectedItem = interactor.selectedItem

        if ((hasSelectedItem != nil) && hasSelectedItem?.text.characters.count != 0) {
        
            guard let detail = self.detailPresenter else {
                
                return
            }
            
            vcs.append(detail.viewController)
        } else {
            
            guard let emptyDetail = self.emptyDetailPresenter else {
                
                return
            }
            vcs.append(emptyDetail.viewController)
        }
        
        splitView.setSplittedControllers(vcs)
        
    }
}

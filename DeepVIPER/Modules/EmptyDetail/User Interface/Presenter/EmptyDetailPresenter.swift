//
//  EmptyDetailPresenter.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class EmptyDetailPresenter: NSObject, EmptyDetailPresenterProtocol {

    var viewController:UIViewController {
        
        get {
         
            let result = UINavigationController(rootViewController: emptyDetailView.viewController)
            return result
        }
    }
    var emptyDetailView: EmptyDetailViewProtocol
    var emptyDetailInteractor: EmptyDetailInteractorProtocol

    
    required init(view: EmptyDetailViewProtocol, interactor: EmptyDetailInteractorProtocol) {
        
        emptyDetailView = view
        emptyDetailInteractor = interactor
        
        
    }
    
}

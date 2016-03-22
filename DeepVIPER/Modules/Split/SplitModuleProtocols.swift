//
//  SplitModuleProtocols.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

typealias SplitModuleAddDetailOutput = ()->()
protocol SplitModuleProtocol:ModuleProtocol {
    
    var interactor:SplitInteractorProtocol {get set}
    var presenter:SplitPresenterProtocol {get set}
    var splitView:SplitViewProtocol {get set}
    
    var masterPresenter:PresenterProtocol? {get set}
    var detailPresenter:PresenterProtocol? {get set}
    var emptyDetailPresenter:PresenterProtocol? {get set}
}

protocol SplitViewProtocol:ViewProtocol {
    
    var output:SplitPresenterProtocol? {get set}
    func setSplittedControllers(viewControllers:[UIViewController])
}

protocol SplitInteractorProtocol {
    
    var selectedItem:ListPONSO? { get set }
    
}

protocol SplitPresenterProtocol:PresenterProtocol {
    
    var interactor:SplitInteractorProtocol? {get set}
    var masterPresenter:PresenterProtocol? {get set}
    var detailPresenter:PresenterProtocol? {get set}
    var emptyDetailPresenter:PresenterProtocol? {get set}
    
    
    var selectedItem:ListPONSO? { get set }
    
    
    init(view:SplitViewProtocol, splitInteractor:SplitInteractorProtocol)
}

//protocol SplitPresenterOutputProtocol {
//    
//    var hasSelectedItem:Bool { get }
//    
//}


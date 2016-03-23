//
//  DetailProtocols.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

typealias DetailModuleOutput = (ponso:ListPONSO)->()
typealias CancelAddDetailModuleOutput = ()->()

protocol DetailModuleProtocol:ModuleProtocol {
    
    init(window:UIWindow)

    var ponso:ListPONSO? { get set }
    @available(*, deprecated=1.0, message="Because !") var useCancelButton:Bool { get set }
    var saveOutput:DetailModuleOutput? { get set}
    var cancelOutput:CancelAddDetailModuleOutput? {get set}
    var presenter:DetailPresenterProtocol { get set}
}

protocol DetailPresenterProtocol:PresenterProtocol {
    
    var output:DetailPresenterOutput? {get set}
    init(view:DetailViewProtocol, interactor:DetailInteractorProtocol)

    var ponso: ListPONSO? { get set }
    func redrawData()
    
    func fetchData()
    
    func pushUsingNavigationController(nc:UINavigationController)
    func popFromNavigationController(nc:UINavigationController)
    
    
    func cancelAddItem()
    func saveItem()
}

protocol DetailViewProtocol:ViewProtocol {
    
    var nameValue:String? { get set }
    var identValue:String? { get set }

    var hasCancelButton:Bool { get set }
    var output:DetailPresenterProtocol? { get set }
    
    func redrawData()
}

protocol DetailInteractorProtocol:InteractorProtocol {
    
    var output:DetailPresenterProtocol? { get set}
    func refetchData()
    
}

protocol DetailPresenterOutput {
    
    func hasCancelButton()->Bool
    func cancelAddDetail()
    func saveDetail(ponso:ListPONSO)
}
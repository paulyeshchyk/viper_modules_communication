//
//  AddDetailProtocols.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

typealias AddDetailModuleOutput = ()->()
typealias CancelAddDetailModuleOutput = ()->()

protocol AddDetailModuleProtocol:ModuleProtocol {
    
    init(window:UIWindow)

    @available(*, deprecated=1.0, message="Because !") var useCancelButton:Bool { get set }
    var saveOutput:AddDetailModuleOutput? { get set}
    var cancelOutput:CancelAddDetailModuleOutput? {get set}
    var presenter:AddDetailPresenterProtocol { get set}
}

protocol AddDetailPresenterProtocol:PresenterProtocol {
    
    var output:AddDetailPresenterOutput? {get set}
    init(view:AddDetailViewProtocol, interactor:AddDetailInteractorProtocol)

    
    func redrawData()
    
    func fetchData()
    
    func pushUsingNavigationController(nc:UINavigationController)
    func popFromNavigationController(nc:UINavigationController)
    
    
    func cancelAddItem()
    func saveItem()
}

protocol AddDetailViewProtocol:ViewProtocol {
    
    var nameValue:String? { get set }
    var identValue:String? { get set }

    var hasCancelButton:Bool { get set }
    var output:AddDetailPresenterProtocol? { get set }
}

protocol AddDetailInteractorProtocol:InteractorProtocol {
    
    var output:AddDetailPresenterProtocol? { get set}
    func refetchData()
    
}

protocol AddDetailPresenterOutput {
    
    func hasCancelButton()->Bool
    func cancelAddDetail()
    func saveDetail()
}
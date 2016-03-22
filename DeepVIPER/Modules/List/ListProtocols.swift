//
//  ListProtocols.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import Foundation


typealias ListModuleAddDetailOutput = ()->()
typealias ListModuleOpenDetailOutput = (item:ListPONSO)->()
protocol ListModuleProtocol:ModuleProtocol {
    
    var presenter:ListPresenterProtocol {get set}
    var listView:ListViewProtocol {get set}
    var addOutput:ListModuleAddDetailOutput? { get set}
    var openOutput:ListModuleOpenDetailOutput? { get set}
}

protocol ListViewProtocol:ViewProtocol {
    
    var input:ListInteractorProtocol? {get set}
    var output:ListPresenterProtocol? {get set}
    func reloadTableview()
}

protocol ListDatasourceProtocol {
    
    func numberOfItems()->Int
    func itemAtIndex(index:Int)->ListPONSO
}

protocol ListInteractorProtocol {
    
    init(datasource:ListDatasourceProtocol)

    func refetchData()
    
    var selectedItem:String? { get set }
    var output:ListPresenterProtocol? { get set}
    func listItemsCount()->Int
    func listItemAtIndex(index:Int)->ListPONSO
    
}

protocol ListPresenterProtocol:PresenterProtocol {
    
    var output:ListPresenterOutput? {get set}
    
    init(view:ListViewProtocol, interactor:ListInteractorProtocol)

    func openDetailAtIndex(index:Int)
    
    
    func redrawData()

    
    func fetchData()

    
    func addItem()
}

protocol ListPresenterOutput {
    
    func openAddDetail()
    func openItem(item:ListPONSO)
    
}


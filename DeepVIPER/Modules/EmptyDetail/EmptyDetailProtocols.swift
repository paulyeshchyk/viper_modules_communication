//
//  EmptyDetailProtocols.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import Foundation

protocol EmptyDetailModuleProtocol:ModuleProtocol {

    var presenter:EmptyDetailPresenterProtocol {get set}

}


protocol EmptyDetailPresenterProtocol:PresenterProtocol {
    
    init(view:EmptyDetailViewProtocol, interactor:EmptyDetailInteractorProtocol)
}

protocol EmptyDetailViewProtocol:ViewProtocol {
    
}

protocol EmptyDetailInteractorProtocol {
    
}
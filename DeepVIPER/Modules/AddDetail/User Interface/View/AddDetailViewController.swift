//
//  AddDetailViewController.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class AddDetailViewController: UIViewController, AddDetailViewProtocol {

    var hasCancelButton: Bool = false {
        
        didSet {
            
            self.rebuildNavigationItem()
        }
    }
    
    var output:AddDetailPresenterProtocol?
    var viewController:UIViewController {
        
        get {
            
            return self
        }
    }

    @IBOutlet var nameTextField:UITextField?
    @IBOutlet var identTextField:UITextField?
    
    
    var nameValue:String? {
        
        didSet {
            
            if (self.isViewLoaded()) {
                
                self.nameTextField?.text = self.nameValue
            }
        }
    }

    var identValue:String? {
        
        didSet {
            
            if (self.isViewLoaded()) {
                
                self.identTextField?.text = self.identValue
            }
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.identTextField?.text = self.identValue
        self.nameTextField?.text = self.nameValue
        
        self.rebuildNavigationItem()
        self.invalidate()
    }

    func rebuildNavigationItem () {
    
        if !self.isViewLoaded() {
            
            return
        }
        
        if self.hasCancelButton {
            
            let cancelItem = UIBarButtonItem(barButtonSystemItem:.Cancel, target: self, action: #selector(AddDetailViewController.cancelAddItem(_:)))
            self.navigationItem.leftBarButtonItems = [cancelItem]
            
        } else {

            self.navigationItem.leftBarButtonItems = []
        }
    
    
        let saveItem = UIBarButtonItem(barButtonSystemItem:.Save, target: self, action: #selector(AddDetailViewController.saveItem(_:)))
        self.navigationItem.rightBarButtonItems = [saveItem]
    }
    
    
    func cancelAddItem(sender:AnyObject?) {
        
        self.output?.cancelAddItem()
    }
    
    func saveItem(sender:AnyObject?) {
        
        self.output?.saveItem()
    }


    func invalidate() {
        
        guard let output = self.output else {
            
            return
        }
        
        if (!self.isViewLoaded()) {
            
            return
        }
        
        output.fetchData()
    }
    
}

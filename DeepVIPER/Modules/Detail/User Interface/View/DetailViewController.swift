//
//  DetailViewController.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/22/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, DetailViewProtocol, UITextFieldDelegate {

    var hasCancelButton: Bool = false {
        
        didSet {
            
            self.rebuildNavigationItem()
        }
    }
    
    var output:DetailPresenterProtocol?
    var viewController:UIViewController {
        
        get {
            
            return self
        }
    }

    @IBOutlet var nameTextField:UITextField?
    @IBOutlet var identTextField:UITextField?

    var nameValue:String?
    var identValue:String?

    func redrawData() {
        
        if (self.isViewLoaded()) {
            
            self.nameTextField?.text = self.nameValue
            self.identTextField?.text = self.identValue
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.identTextField?.addTarget(self, action: #selector(identChanged(_:)), forControlEvents: .EditingDidEndOnExit)
        self.nameTextField?.addTarget(self, action: #selector(nameChanged(_:)), forControlEvents: .EditingDidEndOnExit)
        
        self.rebuildNavigationItem()
        self.invalidate()

        self.redrawData()
        
    }

    func identChanged(sender:AnyObject?) {
    
        self.identValue = self.identTextField?.text
        self.identTextField?.resignFirstResponder()
    }
    
    func nameChanged(sender:AnyObject?) {
        
        self.nameValue = self.nameTextField?.text
        self.nameTextField?.resignFirstResponder()
    }
    
    func rebuildNavigationItem () {
    
        if !self.isViewLoaded() {
            
            return
        }
        
        if self.hasCancelButton {
            
            let cancelItem = UIBarButtonItem(barButtonSystemItem:.Cancel, target: self, action: #selector(DetailViewController.cancelAddItem(_:)))
            self.navigationItem.leftBarButtonItems = [cancelItem]
            
        } else {

            self.navigationItem.leftBarButtonItems = []
        }
    
    
        let saveItem = UIBarButtonItem(barButtonSystemItem:.Save, target: self, action: #selector(DetailViewController.saveItem(_:)))
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
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
//        textField.resignFirstResponder()
        return true
    }
}

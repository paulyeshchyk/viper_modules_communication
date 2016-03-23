//
//  ListViewController.swift
//  DeepVIPER
//
//  Created by Pavel Yeshchyk on 3/21/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, ListViewProtocol, UITableViewDataSource, UITableViewDelegate {

    var input: ListInteractorProtocol?
    var output:ListPresenterProtocol? {
        
        didSet {
            
            self.invalidate()
        }
    }
    @IBOutlet var tableView:UITableView?
    
    var viewController:UIViewController {
        
        get {
            
            return self
        }
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()

        let addItem = UIBarButtonItem(barButtonSystemItem:.Add, target: self, action: #selector(ListViewController.addItem(_:)))
        self.navigationItem.rightBarButtonItems = [addItem]
        
        self.tableView?.registerNib(UINib(nibName: "ListTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "ListTableViewCell")
        self.invalidate()
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
    
    func addItem(sender:AnyObject) {
        
        let indexPath = self.tableView?.indexPathForSelectedRow
        if (indexPath != nil) {
            
            self.tableView?.deselectRowAtIndexPath(indexPath!, animated: true)
        }
        
        self.output?.addItem()
    }
    
    func reloadTableview() {
        
        self.tableView?.reloadData()
    }
    
    
    //MARK: - UITableViewDatasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let input = self.input else {
            
            return 0
        }
        return input.listItemsCount()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let data = self.input?.listItemAtIndex(indexPath.row)

        let result = tableView.dequeueReusableCellWithIdentifier("ListTableViewCell")
        result?.textLabel!.text = data!.text
        
        return result!
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.output?.openDetailAtIndex(indexPath.row)
    }
    
    func reloadItemAtIndex(index:Int) {
        
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        self.tableView?.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
    }
}

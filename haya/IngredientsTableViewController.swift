//
//  IngredientsTableViewController.swift
//  haya
//
//  Created by 신지민 on 2016. 1. 9..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit

class IngredientsTableViewController: UITableViewController {

    // MARK: Properties
    
    var tools = [Tool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         loadSampleMeals()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func loadSampleMeals() {
        
        let tool1 = Tool(name: "식용유", rating: 5)!
        
        let tool2 = Tool(name: "소금", rating: 4)!
        
        let tool3 = Tool(name: "설탕",rating: 5)!
        
        let tool4 = Tool(name: "간장", rating: 4)!
        
        let tool5 = Tool(name: "된장", rating: 2)!
        
        let tool6 = Tool(name: "고추장", rating: 3)!
        
        let tool7 = Tool(name: "고춧가루", rating: 3)!
        
        let tool8 = Tool(name: "후추", rating: 2)!
        
        let tool9 = Tool(name: "참기름", rating: 3)!
        
        let tool10 = Tool(name: "들기름", rating: 2)!
        
        
        tools += [tool1, tool2, tool3, tool4, tool5, tool6, tool7, tool8, tool9, tool10]
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tools.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "IngredientsTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! IngredientsTableViewCell
        
        let tool = tools[indexPath.row]
        
        cell.name.text = tool.name
        cell.ratings.rating = tool.rating
        
        
        // Configure the cell...
        
        return cell
    }



}

//
//  ToolTableViewController.swift
//  haya
//
//  Created by 신지민 on 2016. 1. 7..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit

class ToolTableViewController: UITableViewController {

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
    
        let tool1 = Tool(name: "가스레인지", rating: 5)!
        
        let tool2 = Tool(name: "인덕션", rating: 4)!
        
        let tool3 = Tool(name: "전자레인지",rating: 5)!
        
        let tool4 = Tool(name: "오븐", rating: 4)!
        
        let tool5 = Tool(name: "믹서기", rating: 2)!
        
        let tool6 = Tool(name: "토스터", rating: 3)!
        
        let tool7 = Tool(name: "후라이팬", rating: 5)!
        
        
        tools += [tool1, tool2, tool3, tool4, tool5, tool6, tool7]
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tools.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ToolTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ToolTableViewCell
        
        let tool = tools[indexPath.row]
        
        cell.nameLabel.text = tool.name
        cell.ratingControl.rating = tool.rating

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

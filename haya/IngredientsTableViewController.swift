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
    
    var selected = [String]()
    //////////////////////////// 서버로 넘겨줄 것 ! segue 일어날 때 한 번에 넘겨주기
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         loadSampleMeals()
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! IngredientsTableViewCell
        
        
        if(cell.checked == false){
            self.selected.append(cell.name.text!)
            
            cell.checked = true
            cell.checkBox.image = UIImage(named: "Checkmark-18")
            
            //print(self.selected)
        }
        else {
            cell.checked = false
            cell.checkBox.image = nil
            
            
            let itemToRemove = cell.name.text
            
            while self.selected.contains(itemToRemove!) {
                if let itemToRemoveIndex = self.selected.indexOf(itemToRemove!) {
                    self.selected.removeAtIndex(itemToRemoveIndex)
                }
            }
            
            //print(self.selected)
        }
        
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int)
        -> String {
            
                return "      조미료                                                           활용도"
    }

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let sectionTitle: String = self.tableView(tableView, titleForHeaderInSection: section)
        if sectionTitle == "" {
            return nil
        }
        
        let title: UILabel = UILabel()
        
        title.text = sectionTitle
        title.textColor = UIColor.blackColor()
        
        title.backgroundColor = UIColor( red:247.0/255.0 , green: 247.0/255.0 ,  blue: 247.0/255.0 , alpha:1 )
        title.font = UIFont.boldSystemFontOfSize(13)
        
        return title
    }





}

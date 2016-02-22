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
    
    var tools = [Tool]()  //가전제품
    var tools2 = [Tool]()   //조리기구
    
    var selected = [String]()
    //////////////////////////// 서버로 넘겨줄 것 ! segue 일어날 때 한 번에 넘겨주기
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        loadSampleMeals()
    }
    
    func loadSampleMeals() {
    
        let tool1 = Tool(name: "냄비", rating : 5)!
        
        let tool2 = Tool(name: "가스레인지", rating: 5)!
        
        let tool3 = Tool(name: "인덕션", rating: 4)!
        
        let tool4 = Tool(name: "전자레인지",rating: 5)!
        
        let tool5 = Tool(name: "오븐", rating: 4)!
        
        let tool6 = Tool(name: "믹서기", rating: 2)!
        
        let tool7 = Tool(name: "도마", rating : 3)!
        
        let tool8 = Tool(name: "토스터", rating: 3)!
        
        let tool9 = Tool(name: "후라이팬", rating: 5)!
        
        
        tools += [tool2, tool3, tool4, tool5, tool6, tool8]
        tools2 += [tool1, tool9, tool7]
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var temp = 1
        
        if(section==0){
            temp = tools.count
        }
        if(section==1) {
            temp = tools2.count
        }
        return temp
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ToolTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ToolTableViewCell
        
        var tool = tools[indexPath.row]
        
        if(indexPath.section == 0){
            
        }
        
        if(indexPath.section == 1){
            tool = tools2[indexPath.row]
        }
        
        cell.nameLabel.text = tool.name
        cell.ratingControl.rating = tool.rating

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! ToolTableViewCell
        
        
        if(cell.checked == false){
            self.selected.append(cell.nameLabel.text!)
            
            cell.checked = true
            cell.checkBox.image = UIImage(named: "Checkmark-18")
            
            //print(self.selected)
        }
        else {
            cell.checked = false
            cell.checkBox.image = nil
            
            let itemToRemove = cell.nameLabel.text
            
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
            
            if(section==0){
                return "      가전제품                                                        활용도"
            }
            
            if(section==1){
                return "      조리기구                                                        활용도"
            }
            
            return ""
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

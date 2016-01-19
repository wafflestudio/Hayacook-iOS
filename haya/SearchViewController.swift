//
//  SearchViewController.swift
//  haya
//
//  Created by 신지민 on 2016. 1. 10..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit


class SearchViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate {

   
    
    @IBOutlet weak var table: UITableView!
    //@IBOutlet weak var searchBar: UISearchBar!
    
    let tableData = ["양파", "당근", "무", "계란", "닭고기", "쇠고기", "돼지고기", "참치", "호박", "배추", "감자", "양송이", "팽이버섯", "치즈", "단무지"]

    var filteredTableData = [String]()
    //var filteredTableData = ["나", "마"]
    var searchController : UISearchController!
    var shouldShowSearchResults = false
    
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        searchController.searchBar.delegate = self
        table.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = false

    }
    
    /*func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        shouldShowSearchResults = true
        table.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        shouldShowSearchResults = false
        table.reloadData()
    }
    

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            table.reloadData()
        }
        
        searchController.searchBar.resignFirstResponder()
    }*/

    //let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
        
        //searchBar.delegate = self
    
       // searchController.searchResultsUpdater = self
        //searchController.dimsBackgroundDuringPresentation = false
        //definesPresentationContext = true
        //self.searchController.hidesNavigationBarDuringPresentation = false
        
        table.tableFooterView = UIView(frame: CGRectZero)  //searching 안하는 동안 table view cell 감추기

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if searchController.active && searchController.searchBar.text != "" {
                return filteredTableData.count
            }
           return 0
            //tableData.count  //원래는 tableData.count
            }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCellWithIdentifier("mycell", forIndexPath: indexPath)
            if searchController.active && searchController.searchBar.text != "" {
               cell.textLabel?.text = filteredTableData[indexPath.row]
            } else {
                cell.textLabel?.text = tableData[indexPath.row]
            }
            return cell
            }
  
    func updateSearchResultsForSearchController(searchController : UISearchController)
    {
            filteredTableData.removeAll(keepCapacity: false)
            
            let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
            let array = (tableData as NSArray).filteredArrayUsingPredicate(searchPredicate)
            filteredTableData = array as! [String]
            
            self.table.reloadData()
    }
    

    /*

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }*/
    
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

//
//  SearchViewController.swift
//  haya
//
//  Created by 신지민 on 2016. 1. 10..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit


class SearchViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate{

    var flag = false
   
    @IBOutlet weak var heightMargin: NSLayoutConstraint!
    
    @IBOutlet weak var table: UITableView!


    let tableData = ["양파", "당근", "무", "계란", "닭고기", "쇠고기", "돼지고기", "참치", "호박", "배추", "감자", "양송이", "팽이버섯", "치즈", "단무지", "가지"]

    var filteredTableData = [String]()
    
    var havingIngredients = [String]()
    
    var searchController : UISearchController!
    
    @IBOutlet weak var collection: UICollectionView!
    
    var color = UIColor()
    
    
    var IngredientsImages = [UIImage]()
    //var IngredientsImages = [UIImage(named: "carrot")!, UIImage(named: "egg")!, UIImage(named: "eggplant")]

    var shouldShowSearchResults = false
    
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        searchController.searchBar.delegate = self
        table.tableHeaderView = searchController.searchBar
    
        searchController.searchBar.barTintColor = UIColor (red:0.75, green:0.75, blue:0.75, alpha:1)
        searchController.searchBar.layer.borderWidth = 1
        searchController.searchBar.layer.borderColor = UIColor (red:0.75, green:0.75, blue:0.75, alpha:1).CGColor
        
        self.definesPresentationContext = false
        searchController.hidesNavigationBarDuringPresentation = false
        table.tableFooterView = UIView(frame: CGRectZero)

    }



////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
        table.tableFooterView = UIView(frame: CGRectZero)  //searching 안하는 동안 table view cell 감추기
       // collection.backgroundColor = UIColor.redColor()
        
        //let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 50, left: 10, bottom: 10, right: 10)
        //layout.itemSize = CGSize(width: 10, height: 10)
    
        //let collectionController = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
      //  collectionController.dataSource = self
      //  collectionController.delegate = self
       // collectionController.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "collectioncell")
        collection.backgroundColor = UIColor (red:0.75, green:0.75, blue:0.75, alpha:1)
        collection.layer.borderWidth = 1
        collection.layer.borderColor = UIColor (red:0.75, green:0.75, blue:0.75, alpha:1).CGColor
        // self.view.addSubview(collectionController)
        //Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
 /////////////////////////////////////////////////////////////////////////////////////////////////////
   func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return 1
        }
        
   func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return IngredientsImages.count
        }

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectioncell", forIndexPath: indexPath) as! IngredientsCollectionViewCell
        //cell.backgroundColor = UIColor (red:0.9, green:0.6, blue:0.4, alpha:1)
       // cell.backgroundColor = self.searchController.searchBar.barTintColor
        //cell.textLabel?.text = "\(indexPath.section):\(indexPath.row)"
        cell.image.image = IngredientsImages[indexPath.row]
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
        //cell.imageView?.image = UIImage(named: "circle")
        return cell
    }
    
    func buttonClicked(sender : UIButton){
        havingIngredients.removeAtIndex(sender.tag)
        IngredientsImages.removeAtIndex(sender.tag)
        collection.reloadData()
        
        if(havingIngredients.count == 0){
            self.heightMargin.constant = 0
        
        }

    }
    
    /*
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        havingIngredients.removeAtIndex(indexPath.row)
        IngredientsImages.removeAtIndex(indexPath.row)
        collection.reloadData()
        
        if(havingIngredients.count == 0){
            heightMargin.constant = 0
        }
        
    }

    */
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       // heightMargin.constant = 60
        
        let text = filteredTableData[indexPath.row]
        havingIngredients.insert(text, atIndex: 0)
        var result = "willbechanged"
       // print(text)
        
        switch text
        {
                case "양파":
                result = "carrot"
                case "당근":
                result = "carrot"
                case "계란":
                result = "egg"
                default:
                result = "eggplant"
        }
        
        IngredientsImages.insert(UIImage(named: result)!, atIndex: 0)
        collection.reloadData()
        
        if(heightMargin.constant == 60){
            self.searchController.active = false;
        }
        else {
            /*
            UIView.animateWithDuration(100, animations: {
                self.heightMargin.constant = 60
            })*/
            //table.tableHeaderView = searchController.searchBar
            heightMargin.constant = 60
            self.searchController.active = false;
        }
        
    }
    
    func updateSearchResultsForSearchController(searchController : UISearchController)
    {
            filteredTableData.removeAll(keepCapacity: false)
            
            let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
            let array = (tableData as NSArray).filteredArrayUsingPredicate(searchPredicate)
            filteredTableData = array as! [String]
            
            self.table.reloadData()
    }
    
}


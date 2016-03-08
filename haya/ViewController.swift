//
//  ViewController.swift
//  haya
//
//  Created by 신지민 on 2016. 1. 7..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cacao: UIButton!
    @IBOutlet weak var skip: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        
        cacao.layer.borderWidth = 0.8
        cacao.layer.borderColor = UIColor.blackColor().CGColor
        
        
        skip.layer.borderWidth = 0.8
        skip.layer.borderColor = UIColor.blackColor().CGColor
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // get a reference to the second view controller
        //let secondViewController = segue.destinationViewController as! ToolTableViewController
        self.navigationController?.navigationBarHidden = false
      
        // set a variable in the second view controller with the data to pass
        
    }

    
    @IBAction func login(sender: AnyObject) {
        let session: KOSession = KOSession.sharedSession();
        
        if session.isOpen() {
            session.close()
        }
        
        session.presentingViewController = self.navigationController
        session.openWithCompletionHandler({ (error) -> Void in
            session.presentingViewController = nil
            
            if !session.isOpen() {
                UIAlertView(title: "로그인 실패", message: error.localizedDescription, delegate: nil, cancelButtonTitle: "확인").show()
            }
            }, authParams: nil, authTypes: [KOAuthType.Talk.rawValue, KOAuthType.Account.rawValue])
    }



}


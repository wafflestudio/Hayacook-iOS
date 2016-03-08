//
//  AppDelegate.swift
//  haya
//
//  Created by 신지민 on 2016. 1. 7..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var loginViewController: UIViewController?
    var mainViewController: UIViewController?
    
    var deviceToken: NSData? = nil
    
    private func setupEntryController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateViewControllerWithIdentifier("navigator") as! UINavigationController
        let navigationController2 = storyboard.instantiateViewControllerWithIdentifier("navigator") as! UINavigationController
        
        let viewController = storyboard.instantiateViewControllerWithIdentifier("login") as UIViewController
        navigationController.pushViewController(viewController, animated: true)
        self.loginViewController = navigationController
        
        let viewController2 = storyboard.instantiateViewControllerWithIdentifier("main") as UIViewController
        navigationController2.pushViewController(viewController2, animated: true)
        self.mainViewController = navigationController2
    }
    
    private func reloadRootViewController() {
        let isOpened = KOSession.sharedSession().isOpen()
        
        if(isOpened){
            print("isOpened")
        }
        else {print("notOpened")}
        
        if !isOpened {
            print("not open")
            let mainViewController = self.mainViewController as! UINavigationController
            
            let stack = mainViewController.viewControllers
            for i in 0 ..< stack.count {
                print(NSString(format: "[%d]: %@", i, stack[i] as UIViewController))
            }
            mainViewController.popToRootViewControllerAnimated(true)
        }
        
        self.window?.rootViewController = isOpened ? self.mainViewController : self.loginViewController
        //self.window?.rootViewController = isOpened ? self.loginViewController : self.mainViewController
        
        
        self.window?.makeKeyAndVisible()
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // 최초 실행시 2 종류의 rootViewController 를 준비한다.
        setupEntryController()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "kakaoSessionDidChangeWithNotification", name: KOSessionDidChangeNotification, object: nil)
        
        KOSession.sharedSession().close()   //////////////// 나중에 지우기 ! ////////////////////////////
        
        reloadRootViewController()
        
        // notification
            let types: UIUserNotificationType = [UIUserNotificationType.Badge, UIUserNotificationType.Alert, UIUserNotificationType.Sound]
            let settings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: nil)
        
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()

        

        
        return true
    }
    
    func kakaoSessionDidChangeWithNotification() {
        reloadRootViewController()
    }
    
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return KOSession.handleOpenURL(url)
    }
    
    func applicatioan(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return KOSession.handleOpenURL(url)
    }

    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        KOSession.handleDidEnterBackground()
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        KOSession.handleDidBecomeActive()
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        if let dic = userInfo["aps"] as? NSDictionary {
            let message: String = dic["alert"] as! String
            print("message=\(message)")
        }
    }

    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        self.deviceToken = deviceToken
        print("didRegisterForRemoteNotificationsWithDeviceToken=\(deviceToken)")
    }

    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("didFailToRegisterForRemoteNotificationsWithError=\(error.localizedDescription)")
    }
    
}

/*
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var loginViewController: UIViewController?
    var mainViewController: UIViewController?

    private func setupEntryController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateViewControllerWithIdentifier("navigator") as! UINavigationController
        let navigationController2 = storyboard.instantiateViewControllerWithIdentifier("navigator") as! UINavigationController
        
        let viewController = storyboard.instantiateViewControllerWithIdentifier("login") as! ViewController
        navigationController.pushViewController(viewController, animated: true)
        self.loginViewController = navigationController
        
        let viewController2 = storyboard.instantiateViewControllerWithIdentifier("main") as! ToolTableViewController
        navigationController2.pushViewController(viewController2, animated: true)
        self.mainViewController = navigationController2
    }

    

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        /*if(KOSession.isKakaoAccountLoginCallback(url)){
            return KOSession.handleOpenURL(url)
        }
        */
        return KOSession.handleOpenURL(url)
    }

    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        setupEntryController()
        
        // notification
        let types: UIUserNotificationType = [UIUserNotificationType.Badge, UIUserNotificationType.Alert, UIUserNotificationType.Sound]
            let settings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: nil)
            
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        KOSession.handleDidBecomeActive()
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}*/


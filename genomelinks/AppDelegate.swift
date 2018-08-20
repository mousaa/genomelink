//
//  AppDelegate.swift
//  genomelinks
//
//  Created by Ahmed Mousa on 2018-08-03.
//  Copyright © 2018 Ahmed Mousa. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        if url.host == nil
        {
            return true;
        }
        let urlString = url.absoluteString
        let queryArray = urlString.split(separator:"/")
        print(queryArray)
        
//        let query = ["eye-color", "beard-thickness", "morning-person"]
//
//        for key in query {
//            let url: String = "https://genomelink.io/v1/enterprise/reports/" + key + "/?population=european"
//            var request = URLRequest(url:  NSURL(string: url)! as URL)
//            request.httpMethod = "POST"
//            request.setValue("Bearer \(queryArray[1])", forHTTPHeaderField: "Authorization")
//
//            Alamofire.request(request).responseJSON { (responseObject) -> Void in
//                print(responseObject)
//            }
//        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainNC = storyboard.instantiateViewController(withIdentifier: "mainNavController")
        window?.rootViewController = mainNC
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


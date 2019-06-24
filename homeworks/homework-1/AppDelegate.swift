//
//  AppDelegate.swift
//  homework-1
//
//  Created by michael on 02/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //1.1
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("\(#function)")
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("\(#function)")
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("\(#function)")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("\(#function)")
    }
    
    //1.2
    func applicationWillResignActive(_ application: UIApplication) {
        print("\(#function)")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
         print("\(#function)")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("\(#function)")
    }
}


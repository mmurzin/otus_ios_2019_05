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
        initServices()
        return true
    }
    
    private func openSharedViewController(text: String) {
        guard let rootController = self.window?.rootViewController else {
            print("rootViewController is nil")
            return
        }
        let storyboard = UIStoryboard(name: "Shared", bundle: nil)
        let sharedViewController = storyboard.instantiateViewController(withIdentifier: "SharedViewController")
        if let controller = sharedViewController as? SharedViewController {
            _ = "23/12/2001, 12/12/2012, 1000 м, 2345 м, 8918 метр, 5000 метров, 1000.5 м, 2500,5 м"
            //controller.sharedViewModel = SharedViewModel(text: sharedText)
            controller.sharedViewModel = SharedViewModel(text: text)
        }
        rootController.present(sharedViewController, animated: false, completion: nil)
    }
    
    private func initServices() {
        let algorithmsProvider: AlgorithmsProvider = AlgorithmsService()
        let timersProvider: TimerItemsProvider = TimerItemsService()
        
        ServiceLocator.shared.addService(service: algorithmsProvider)
        ServiceLocator.shared.addService(service: timersProvider)
        
    }
}

extension AppDelegate {
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if let ud = UserDefaults(suiteName: "group.otus.share") {
            if let shareText = ud.object(forKey: "shareText") as? String {
                openSharedViewController(text: shareText)
            }
        }
        
        return true
        
    }
    
}


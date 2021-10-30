//
//  AppDelegate.swift
//  FinalProject
//
//  Created by Tuba Nur on 25.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if #available(iOS 13.0, *) {

            //UISegmentedControl.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.7843137255, blue: 0.3137254902, alpha: 1)
            UISegmentedControl.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .white
            UISegmentedControl.appearance(whenContainedInInstancesOf: [UISearchBar.self]).selectedSegmentTintColor = #colorLiteral(red: 0.9767697453, green: 0.5664579868, blue: 0.1543098092, alpha: 1)

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

}

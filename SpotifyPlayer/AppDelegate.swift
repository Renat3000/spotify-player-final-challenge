//
//  AppDelegate.swift
//  SpotifyPlayer
//
//  Created by Renat Nazyrov


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()

        let navigatorController = UINavigationController(rootViewController: Solution())
        window?.rootViewController = navigatorController

        return true
    }

}

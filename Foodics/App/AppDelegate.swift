//
//  AppDelegate.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit
import UIKit
import CoreData
import IQKeyboardManagerSwift
import AuthenticationServices

let APP = UIApplication.shared.delegate! as! AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let isLaunched = LaunchKeyChain.shared
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //deleteUser()
        setupThirdPartServices()
        checkLocaleLanguage()
        presentRootScreen()
        print("Documents Directory: ", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Not Found!")
        return true
    }
    
    fileprivate func setupThirdPartServices() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
    
    func deleteUser() {
        if isLaunched.get()! {
            isLaunched.save(isLaunched: true)
        } else {
            isLaunched.save(isLaunched: true)
        }
    }
    
    func setHasAlreadyLaunched(){
        isLaunched.save(isLaunched: true)
    }
    
    fileprivate func checkLocaleLanguage() {
        if (!LocaleManager.shared.isExist()) {
            LOCAL.setDefaultAppLocale()
        }
    }
    
    fileprivate func presentRootScreen() {
        window = UIWindow(frame: UIScreen.main.bounds)
        RootRouter().presentRootScreen(in: window!)
    }
    
    fileprivate func settingsVersion() {
        let version = Bundle.main.infoDictionary!["CFBundleVersion"]!
        let shortVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"]!
        _ = "v\(shortVersion) (\(version))"
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Foodics")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

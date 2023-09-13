//
//  AppDelegate.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 7.09.2023.
//

import UIKit
import CoreData
import NeonSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let trump = VoicesModal(name: "Trump", image: "trump")
        
        let obama = VoicesModal(name: "Obama", image: "obama")
        
        let taylor = VoicesModal(name: "Taylor", image: "taylor")
        
        let elon = VoicesModal(name: "Elon", image: "elon")
        
        let johnny = VoicesModal(name: "Johnny", image: "johnny")
        
        let brad = VoicesModal(name: "Brad", image: "brad")
        
        let celebrity = VoicesModal(name: "Celebrity", image: "celebrity")
       
        let dualipa = VoicesModal(name: "Dua Lipa", image: "dualipa")
        
        let celebrity2 = VoicesModal(name: "Celebrity", image: "celebrity2")
        
        let celebrity3 = VoicesModal(name: "Celebrity", image: "celebrity3")
        
            Globals.arrVoices.append(trump)
            Globals.arrVoices.append(obama)
            Globals.arrVoices.append(taylor)
            Globals.arrVoices.append(elon)
            Globals.arrVoices.append(johnny)
            Globals.arrVoices.append(brad)
            Globals.arrVoices.append(celebrity)
            Globals.arrVoices.append(dualipa)
            Globals.arrVoices.append(celebrity2)
            Globals.arrVoices.append(celebrity3)
        

        Font.configureFonts(font: .Poppins)
    
        RevenueCatManager.configure(withAPIKey: "appl_HytrZibHrgnxLjZtMDjEVrVKjCi", products : [
            "com.neonapps.education.SwiftyStoreKitDemo.Montly"

        ])
        
        
        
        Neon.configure(window: &window, onboardingVC: Onboarding(), paywallVC: PaywallVC(), homeVC: FirstHomeVC())
        return true
    }

    

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "AIVoiceChanger")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}


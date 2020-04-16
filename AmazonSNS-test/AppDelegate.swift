//
//  AppDelegate.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 03/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit
import AWSSNS
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    // **************************
    // MARK: SNS Platform config
    // **************************
    
    /// The SNS Platform application ARN
    let SNSPlatformApplicationArn = "arn:aws:sns:us-east-1:963459549399:app/APNS_SANDBOX/Amazon_SNS_Test_App"

    var globalToken = ""
    
    var endpointARN = ""

     var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
           // Override point for customization after application launch.
           
        // **************************
        // MARK: Cognito
        // **************************
        
           /// Setup AWS Cognito credentials
           let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.USEast1,
              identityPoolId:"us-east-1:f9952b17-dcc2-428a-82be-f65ae234e0fd")

           let configuration = AWSServiceConfiguration(region:.USEast1, credentialsProvider:credentialsProvider)

            AWSServiceManager.default().defaultServiceConfiguration = configuration

           registerForPushNotifications(application: application)
//
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

       func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
           /// Attach the device token to the user defaults
           var token = ""
           for i in 0..<deviceToken.count {
               token = token + String(format: "%02.2hhx", arguments: [deviceToken[i]])
           }

            self.globalToken = token
           print(token)

           UserDefaults.standard.set(token, forKey: "deviceTokenForSNS")

           /// Create a platform endpoint. In this case,  the endpoint is a
           /// device endpoint ARN
           let sns = AWSSNS.default()
           let request = AWSSNSCreatePlatformEndpointInput()
           request?.token = token
           request?.platformApplicationArn = SNSPlatformApplicationArn
        sns.createPlatformEndpoint(request!).continueWith(executor: AWSExecutor.mainThread(), block: { (task: AWSTask!) -> AnyObject? in
               if task.error != nil {
                   print("Error: \(String(describing: task.error))")
               } else {
                   let createEndpointResponse = task.result! as AWSSNSCreateEndpointResponse

                   if let endpointArnForSNS = createEndpointResponse.endpointArn {
                       print("endpointArn: \(endpointArnForSNS)")
                    self.endpointARN = endpointArnForSNS
                       UserDefaults.standard.set(endpointArnForSNS, forKey: "endpointArnForSNS")
                   }
               }

               return nil
           })
       }

       func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
           print(error.localizedDescription)
       }

       func registerForPushNotifications(application: UIApplication) {
           /// The notifications settings
           if #available(iOS 10.0, *) {
               UNUserNotificationCenter.current().delegate = self
               UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert], completionHandler: {(granted, error) in
                   if (granted)
                   {
                       UIApplication.shared.registerForRemoteNotifications()
                   }
                   else{
                       //Do stuff if unsuccessful...
                   }
               })
           } else {
               let settings = UIUserNotificationSettings(types: [UIUserNotificationType.alert, UIUserNotificationType.badge, UIUserNotificationType.sound], categories: nil)
               application.registerUserNotificationSettings(settings)
               application.registerForRemoteNotifications()
           }
       }

       // Called when a notification is delivered to a foreground app.
       @available(iOS 10.0, *)
       func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
           print("User Info = ",notification.request.content.userInfo)
           completionHandler([.alert, .badge, .sound])
       }

       // Called to let your app know which action was selected by the user for a given notification.
       @available(iOS 10.0, *)
       func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
           print("User Info = ",response.notification.request.content.userInfo)

           completionHandler()
       }
    


}


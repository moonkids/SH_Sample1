//
//  ViewController.swift
//  SH_Sample1
//
//  Created by MurataKazuki on 2015/09/27.
//  Copyright © 2015年 mk. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DVSAccountRetrieverViewControllerDelegate {
    
    
    func accountRetrieverViewController(controller: DVSAccountRetrieverViewController!, didSuccessForAction action: DVSRetrieverAction, user: DVSUser!) {
        print("ok\(user) \(action.rawValue)")
    }
    func accountRetrieverViewController(controller: DVSAccountRetrieverViewController!, didFailWithError error: NSError!, forAction action: DVSRetrieverAction) {
        print("error=\(error)")
    }
    func accountRetrieverViewControllerDidTapDismiss(controller: DVSAccountRetrieverViewController!) {
        print("dismiss")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let config = DVSConfiguration.sharedConfiguration()
        config.serverURL = NSURL(string: "http://localhost:3000/")
        config.apiVersion = 0
        
//        config.loggingMode = DVSLoggingMode.Warning
        config.facebookAppID = "826609840784950"
        
        
//        DVSUserManager.defaultManager().registerWithSuccess({ () -> Void in
//            print("ok")
//            }) { (error:NSError!) -> Void in
//                print("error=\(error)")
//        }
        
        let logInController = DVSAccountRetrieverViewController(type: DVSRetrieverType.LogIn, fields: [DVSAccountRetrieverFields.EmailAndPassword, DVSAccountRetrieverFields.ProceedButton])
        
        
        logInController.delegate = self
        self.showViewController(logInController, sender: self)
        
        let client = DVSHTTPClient(configuration: config)
        
        
        
//        client.GET("/index.html", parameters: nil) { (object, error) -> Void in
//            print("aa")
//        }
        
//        DVSUserManager.defaultManager().signInUsingFacebookWithSuccess({ () -> Void in
//                print("ok")
//            }) { (error:NSError!) -> Void in
//                print("error:\(error)")
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


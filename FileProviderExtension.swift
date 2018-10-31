//
//  FileProviderExtension.swift
//  prospectorProject
//
//  Created by period3 on 10/31/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit
import PushKit

class FileProviderExtension: NSFileProviderExtension, PKPushRegistryDelegate {
    var pushRegistry: PKPushRegistry!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        pushRegistry = PKPushRegistry(queue: nil)
        pushRegistry.delegate = self
        pushRegistry.desiredPushTypes = [.fileProvider]
        
        return true
    }
}

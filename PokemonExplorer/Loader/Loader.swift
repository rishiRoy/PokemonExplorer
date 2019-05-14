//
//  Loader.swift
//  PokemonExplorer
//
//  Created by Rishi Ghosh Roy on 5/13/19.
//  Copyright © 2019 Ivy-Mobility. All rights reserved.
//

import UIKit

class Loader: NSObject {

    class var sharedInstance: Loader {
        struct Singleton {
            static let instance: Loader = Loader()
        }
        
        return Singleton.instance
    }
    
    lazy var alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
    
    override init() {
        
        super.init()
    }
    
    func showLoader(title:String,message:String) {
        
        alertController.title = title
        alertController.message = message
        self.topViewController()?.present(alertController, animated: true, completion: nil)
    }
    
    func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let presented = controller?.presentedViewController {
            
            return topViewController(controller: presented)
        }
        return controller
    }
    
    func removeLoader() {
        
        DispatchQueue.main.async {
            
            self.alertController.dismiss(animated: true, completion: nil)
        }
    }
}

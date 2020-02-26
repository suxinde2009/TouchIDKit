//
//  ViewController.swift
//  TouchIDKitDemo
//
//  Created by SuXinDe on 2020/2/26.
//  Copyright © 2020 su xinde. All rights reserved.
//

import UIKit
import TouchIDKit

class ViewController: UIViewController {

    @IBOutlet var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let handle: (_ result: TouchID.Authorized.Result) -> Void = {[weak self](result) in
            guard let `self` = self else {
                return
            }
        
            switch result {
                case .success:
                    self.textLabel.text = "Authorize Success"
                case .fail:
                    self.textLabel.text = "Authorize Failure"
                case .userCancel:
                    self.textLabel.text = "Authorize Error User Cancel"
                
                case .userFallback:
                    self.textLabel.text = "Authorize Error User Fallback"
                case .systemCancel:
                    self.textLabel.text = "Authorize Error System Cancel"
                case .passcodeNotSet:
                    self.textLabel.text = "Authorize Error Passcode Not Set"
                case .touchIDNotEnrolled:
                    self.textLabel.text = "Authorize Error TouchID Not Enrolled"
                case .touchIDUnavailable:
                    self.textLabel.text = "Authorize Error TouchID Not Available"
                case .touchIDLockout:
                    self.textLabel.text = "Authorize LAError TouchID Lockout"
                case .appCancel:
                    self.textLabel.text = "Authorize LAError AppCancel"
                case .invalidContext:
                    self.textLabel.text = "Authorize LAError Invalid Context"
                case .touchIDIsUnsupported:
                    self.textLabel.text = "Authorize The Current Device Does Not Support"
            }
        }
        
        TouchID.show(with: "The Custom Message",
                     fallbackTitle: "Fallback Title") { (result) in
                        handle(result)
        }
    }
}


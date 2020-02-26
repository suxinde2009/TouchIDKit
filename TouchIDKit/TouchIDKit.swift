//
//  TouchIDKit.swift
//  TouchIDKit
//
//  Created by SuXinDe on 2020/2/26.
//  Copyright © 2020 su xinde. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

open class TouchID: NSObject {
    
    @objc public static func show(with message: String,
                                  fallbackTitle: String,
                                  handle: @escaping(_ result: TouchID.Authorized.Result) -> Void) {
        let context = LAContext()
        context.localizedFallbackTitle = fallbackTitle
        var error: NSError? = nil
        let evaluteResult = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                                      error: &error)
        guard evaluteResult else {
            DispatchQueue.main.async {
                handle(.touchIDIsUnsupported)
            }
            return
        }
        
        let replyHandle: (Bool, Error?) -> Void = {(success, error) in
            guard let error = error as? LAError else {
                DispatchQueue.main.async {
                    handle(.success)
                }
                return
            }
            if success == true {
                DispatchQueue.main.async {
                    handle(.success)
                }
            } else {
                DispatchQueue.main.async {
                    switch error.code {
                        case .authenticationFailed:
                            handle(.fail)
                        case .userCancel:
                            handle(.userCancel)
                        case .userFallback:
                            handle(.userFallback)
                        case .systemCancel:
                            handle(.systemCancel)
                        case .passcodeNotSet:
                            handle(.passcodeNotSet)
                        case .invalidContext:
                            handle(.invalidContext)
                        case .touchIDLockout:
                            handle(.touchIDLockout)
                        case .touchIDNotEnrolled:
                            handle(.touchIDNotEnrolled)
                        case .touchIDNotAvailable:
                            handle(.touchIDUnavailable)
                        default:
                            handle(.fail)
                    }
                }
            }
        }
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: message,
                               reply: replyHandle)
    }
}

public extension TouchID {
    class Authorized: NSObject {
        @objc public enum Result: Int {
            case success
            case fail
            case userCancel
            case userFallback
            case systemCancel
            case passcodeNotSet
            case touchIDNotEnrolled
            case touchIDUnavailable
            case touchIDLockout
            case appCancel
            case invalidContext
            case touchIDIsUnsupported
        }
    }
}

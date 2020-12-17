# TouchIDKit
A wrapper of TouchID for iOS. This framework is very easy to get started



# How to use

For example:

```Objctive-C
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

```

# License

Copyright (c) 2011-2020 __承_影__

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

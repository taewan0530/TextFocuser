//
//  KeyboardInfo.swift
//  TextFocuser
//
//  Created by taewan on 2017. 4. 30..
//  Copyright © 2017년 taewan. All rights reserved.
//

import UIKit

struct KeyboardInfo {
    
    let beginFrame: CGRect
    let endFrame: CGRect
    let duration: Double
    let animationOptions: UIViewAnimationOptions
    
    init?(_ userInfo: [AnyHashable : Any]?) {
        guard let userInfo = userInfo ,
            let beginFrameValue = userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue,
            let endFrameValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue,
            let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber,
            let animationOptionsValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber else {
                return nil
        }
        
        self.beginFrame = beginFrameValue.cgRectValue
        self.endFrame = endFrameValue.cgRectValue
        self.duration = durationValue.doubleValue
        self.animationOptions = UIViewAnimationOptions(rawValue: animationOptionsValue.uintValue << 16)
        
    }
}

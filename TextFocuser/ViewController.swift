//
//  ViewController.swift
//  TextFocuser
//
//  Created by taewan on 2017. 4. 30..
//  Copyright © 2017년 taewan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var textFocuser: TextFocuser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textFocuser = TextFocuser(scrollView: self.scrollView)
    }
    
}


extension ViewController: UITextFieldDelegate, UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textInputShouldReturn(textField)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let font = textView.font else { return true }
        let lineCount = textView.contentSize.height/font.lineHeight
        if 8 < lineCount && text == "\n" {
            textInputShouldReturn(textView)
            return false
        }
        return true
    }
    
    @discardableResult
    func textInputShouldReturn(_ textField: UITextInput) -> Bool {
        guard let textInputView = textField as? UIView else { return false }
        
        if let nextField = scrollView?.viewWithTag(textInputView.tag + 1) , nextField is UITextInput {
            nextField.becomeFirstResponder()
        } else {
            textInputView.resignFirstResponder()
            return true
        }
        return false
    }
}

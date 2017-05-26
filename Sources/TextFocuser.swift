//
// Created by kimtaewan on 2016. 4. 29..
// Copyright (c) 2016 taewan. All rights reserved.
//
import UIKit

final public class TextFocuser: NSObject {
    
    private var kyboardStatus: KeyboardStatus = .hide {
        didSet {
            self.keyboardDismissGesture.isEnabled = kyboardStatus == .show
        }
    }
    
    private(set) var keyboardDismissGesture: UITapGestureRecognizer!
    
    fileprivate weak var scrollView: UIScrollView?
    
    public weak var delegate: UIScrollViewDelegate?
    
    public init(scrollView: UIScrollView) {
        super.init()
        self.scrollView = scrollView
        setup()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setup() {
        self.keyboardDismissGesture = UITapGestureRecognizer(target: self,
                                                             action: #selector(onLooseKeyboardFocus))
        self.keyboardDismissGesture.isEnabled = self.scrollView?.keyboardDismissMode == .none
        self.scrollView?.addGestureRecognizer(self.keyboardDismissGesture)
        
        
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(keyboardWillChange),
                         name: .UIKeyboardWillChangeFrame,
                         object: nil)
    }
    
    func onLooseKeyboardFocus(sender: UITapGestureRecognizer) {
        self.scrollView?.endEditing(true)
    }
    
    
    func keyboardWillChange(_ notification: Notification) {
        guard let scrollView = self.scrollView,
            let userInfo = notification.userInfo,
            let keyboardInfo = KeyboardInfo(userInfo) else {
                return
        }
        
        let isHidden = keyboardInfo.endFrame.origin.y >= UIScreen.main.bounds.size.height
        
        self.kyboardStatus = isHidden ? .hide : .show
        
        if isHidden {
            scrollView.contentInset.bottom = 0
            scrollView.scrollIndicatorInsets.bottom = 0
        } else {
            let bottomSpacing = UIScreen.main.bounds.maxY - scrollView.frame.maxY
            let keyboardEndHeight = keyboardInfo.endFrame.height - bottomSpacing
            
            scrollView.contentInset.bottom = keyboardEndHeight
            scrollView.scrollIndicatorInsets.bottom = keyboardEndHeight
        }
    }
}



extension TextFocuser {
    enum KeyboardStatus {
        case show, hide
    }
}

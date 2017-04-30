# TextFocuser

![Swift](https://img.shields.io/badge/Swift-3.1-orange.svg)

<img src="images/example.gif"/>


Easily and automatically focuses on the textField in the scrollView.
Also available in collectionView and tableView.

Installation
------------

- **For iOS 8+ projects with [CocoaPods](https://cocoapods.org):**

    ```ruby
    pod 'TextFocuser'
    ```

    

Getting Started
---------------


```swift
class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var textFocuser: TextFocuser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textFocuser = TextFocuser(scrollView: scrollView)
    }
}
```
# TextFocuser

![Swift](https://img.shields.io/badge/Swift-3.1-orange.svg)

<img src="images/example.gif"/>


Easily and automatically focuses on the textField in the scrollView.
Also available in collectionView and tableView.

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
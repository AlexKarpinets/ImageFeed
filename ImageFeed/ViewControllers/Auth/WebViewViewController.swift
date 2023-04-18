import UIKit
import WebKit

final class WebViewViewController: UIViewController {
 
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    @IBAction func didTapBackButton(_ sender: UIButton) {
    }
}

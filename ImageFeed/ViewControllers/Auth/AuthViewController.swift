import UIKit

final class AuthViewController: UIViewController, WebViewViewControllerDelegate {
    
   private let identifierToWebVC = "ShowWebView"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifierToWebVC {
            guard let webViewViewController = segue.destination as? WebViewViewController else {
                fatalError("Failed to prepare for \(identifierToWebVC)") }
            webViewViewController.delegate = self
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }

    func webViewViewController(_vc: WebViewViewController, didAuthenticateWithCode code: String) {
    }
    
    func webViewViewControllerDidCancel(_vc: WebViewViewController) {
            dismiss(animated: true)
        }
    }


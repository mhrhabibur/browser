
import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://www.google.com")!
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
        webView.allowsBackForwardNavigationGestures = true
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openTapped))
     
        let back = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
        
        let forward = UIBarButtonItem(title: "Forward", style: .plain, target: self, action: #selector(goForward))
        navigationItem.leftBarButtonItems = [back, forward]
    }
    
    @objc func openTapped() {
        let ac = UIAlertController(title: "Enter Website Name", message: nil, preferredStyle: .alert)
        ac.addTextField()
    
        let submitAction = UIAlertAction(title: "Open", style: .default) {
            [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else {return}
            self?.openPage(action: answer)
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        ac.addAction(submitAction)
        present(ac, animated: true, completion: nil)
    }
    
    func openPage(action: String) {
        let myURL = URL(string: "https://\(action)")!
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }
    
    @objc func goBack() {
        
        webView.goBack()
    }
    
    
    @objc func goForward() {
        
        webView.goForward()
    }
    
}


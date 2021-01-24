import UIKit

class LoginViewController: UIViewController {
    @IBAction func loginButton(_ sender: Any) {
        
        let myURL = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myURL, success: {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not login")
        })
    }
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 10
    }


}

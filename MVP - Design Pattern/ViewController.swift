
import UIKit

class ViewController: UIViewController, VCDelegate {
    
    @IBOutlet weak var lblErrorMsg: UILabel!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassWord: UITextField!
    
    var presenter: VCPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = VCPresenter()
        self.presenter.delegate = self
        lblErrorMsg.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSubmitAction(_ sender: Any){
        self.presenter.validateData(username: txtUserName.text!, password: txtPassWord.text!)
    }
    
    func showMessage(message: String) {
        lblErrorMsg.isHidden = false
        lblErrorMsg.text = message
    }
    
    func userLoggedIn() {
        print("User data is \(self.presenter.name) \(self.presenter.email)  \(self.presenter.gender)")
        lblErrorMsg.isHidden = false
        lblErrorMsg.text = "User Login Successfully."
    }

}


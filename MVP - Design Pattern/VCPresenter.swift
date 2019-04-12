
import Foundation

protocol VCDelegate {
    func showMessage(message: String)
    func userLoggedIn()
}

class VCPresenter: NSObject {
    var delegate: VCDelegate!
    var user: User!
    
    var name: String{ return user.name }
    var email: String{ return user.email }
    var gender: String{ return user.gender }
    
    func validateData(username: String, password: String) {
        if username.count != 0{
            if password.count != 0{
                self.validUser(username: username, password: password)
            }
            else{
                self.delegate.showMessage(message: "Password is blank.")
            }
        }
        else{
            self.delegate.showMessage(message: "Username is blank.")
        }
    }

    fileprivate func validUser(username: String, password: String){
        if username == "test" && password == "123456" {
            let testUser = User(name: username, email: "test@gmail.com", gender: "Male")
            user = testUser
            self.delegate.userLoggedIn()
        }
        else{
            self.delegate.showMessage(message: "User is not valid")
        }
    }
    
}

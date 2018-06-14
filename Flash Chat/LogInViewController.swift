//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    //Log in an existing user
    
    @IBAction func logInPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            if error != nil {
                
                SVProgressHUD.showInfo(withStatus: "\(error?.localizedDescription)")
                SVProgressHUD.dismiss(withDelay: 2)
                
            } else {
                print("Log in successful!")
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
                SVProgressHUD.dismiss()
            }
            
            
        }
        
    }
    


    
}  

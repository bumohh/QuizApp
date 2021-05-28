//
//  ForgotPasswordViewController.swift
//  Project
//
//  Created by admin on 4/22/21.
//

import UIKit
import CoreData


class ForgotPasswordViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var passwordSuccess = false
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func doesExist() -> Bool{
        var exist = false
        do {
            let request = User.fetchRequest() as NSFetchRequest<User>
            let result = try context.fetch(request)
            
            for data in result as! [NSManagedObject] {
                let user = data.value(forKey: "userID") as! String
                if user == username.text {
                    print("exist = true")
                    exist = true
                    return exist
                } else {
                    print("exist = false")
                    exist = false
                }
            }
        }
        catch {
            print("Failed")
        }
        return exist
    }
        
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "ForgotSuccess" {
            if passwordSuccess {
                return true
            } else {
                return false
            }
        }
        return true
    }

    @IBAction func ForgotPasswordSubmit(_ sender: Any) {
        //check if user exists in table
        if self.doesExist() {
            //check if password is < 7
            if password.text!.count < 7 {
                let passwordAlert4 = UIAlertController(title: "Password Too Short!", message: "Please make sure password is 8 characters long!", preferredStyle: .alert)
                passwordAlert4.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

                self.present(passwordAlert4, animated: true)
                
                print("password length < 7")
            } else {
                do {
                    //fetch data
                    let request = User.fetchRequest() as NSFetchRequest<User>
                    //modify fetch data to fetch specific data
                    let pred = NSPredicate(format: "userID CONTAINS %@", username.text as! CVarArg)
                    request.predicate = pred
                    let result = try context.fetch(request)
                    //go through data
                    if password.text == repassword.text {
                        print("password and repassword match!")
                        result[0].password = password.text!
                        
                        let passwordAlert4 = UIAlertController(title: "Password Reset!", message: "Moving to login screen.", preferredStyle: .alert)
                        passwordAlert4.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
                            action in (self.performSegue(withIdentifier: "ForgotSuccess", sender: nil))
                        }))

                        self.present(passwordAlert4, animated: true)
     
                        
                        //save data
                        do {
                            try self.context.save()
                            print("saved data")
                        } catch let err{
                            print("error saving the data", err)
                        }
                    } else {
                        let passwordAlert1 = UIAlertController(title: "Passwords Dont Match!", message: "Everything is case sensitive! Make sure passwords match.", preferredStyle: .alert)

                        passwordAlert1.addAction(UIAlertAction(title: "Ok", style: .default, handler:
                            nil))
                        self.present(passwordAlert1, animated: true)
                        print("password and repassword doesnt match!")
                        
                    }
                    
                } catch {
                    print("Failed")
                }
            }
        } else {
            let passwordAlert2 = UIAlertController(title: "Wrong User!", message: "Make sure user is already registered.", preferredStyle: .alert)

            passwordAlert2.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(passwordAlert2, animated: true)
            print("user does not exist in table")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

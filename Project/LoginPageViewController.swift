//
//  LoginPageViewController.swift
//  Project
//
//  Created by admin on 4/22/21.
//

import UIKit
import CoreData
class LoginPageViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var rememberSwitch: UISwitch!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        super.viewDidLoad()
        rememberSwitch.addTarget(self, action: #selector(self.stateChanged), for: .valueChanged)
        let defaults: UserDefaults? = UserDefaults.standard

        // check if defaults already saved the details
        let b = defaults?.bool(forKey: "remember")

        if b! {
            username.text = defaults?.value(forKey: "savedusername") as! String
            password.text = defaults?.value(forKey: "savedpassword") as! String
            rememberSwitch.setOn(true, animated: false)
            
        } else {
            rememberSwitch.setOn(false, animated: false)
        }
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func stateChanged(_ switchState: UISwitch) {
        let defaults: UserDefaults? = UserDefaults.standard
        if switchState.isOn {
            print("saving for next time")
            defaults?.set(true, forKey: "remember")
            defaults?.set(username.text, forKey: "savedusername")
            defaults?.set(password.text, forKey: "savedpassword")

        } else {
            print("not saving for next time")
            defaults?.set(false, forKey: "remember")
            
        }
    }
    
    //create an object that holds username so that we can access it from any other view controller
    struct passLogin {
        static var login = passLogin()
        var passUser : String = ""
    }
    /*
    @IBAction func checkTable(_ sender: Any) {
            do {
                let request = User.fetchRequest() as NSFetchRequest<User>
                let result = try context.fetch(request)
                print("table :")
                for data in result as! [NSManagedObject] {
                    //print user and password
                    print("\nuser : ",data.value(forKey: "userID") as! String,"| password : ", data.value(forKey: "password") as! String)
                    //user survey1
                    print("survey1 :")//, (data.value(forKey: "survey1")!))
                    
                    print("q1 :", (data.value(forKey: "survey1") as! NSManagedObject).value(forKey: "question1") as! String, " r1 :", (data.value(forKey: "survey1") as! NSManagedObject).value(forKey: "rating1") as! Double)
                    print("q2 :", (data.value(forKey: "survey1") as! NSManagedObject).value(forKey: "question2") as! String, " r2 :", (data.value(forKey: "survey1") as! NSManagedObject).value(forKey: "rating2") as! Double)
                    print("q3 :", (data.value(forKey: "survey1") as! NSManagedObject).value(forKey: "question3") as! String, " r3 :", (data.value(forKey: "survey1") as! NSManagedObject).value(forKey: "rating3") as! Double)
                    print("q4 :", (data.value(forKey: "survey1") as! NSManagedObject).value(forKey: "question4") as! String, " r4 :", (data.value(forKey: "survey1") as! NSManagedObject).value(forKey: "rating4") as! Double)
                    print("q5 :", (data.value(forKey: "survey1") as! NSManagedObject).value(forKey: "question5") as! String, " r5 :", (data.value(forKey: "survey1") as! NSManagedObject).value(forKey: "rating5") as! Double)
 
                    //user survey2
                    print("survey2 :")//, (data.value(forKey: "survey2")!))
                    
                    print("q1 :", (data.value(forKey: "survey2") as! NSManagedObject).value(forKey: "question1") as! String, " r1 :", (data.value(forKey: "survey2") as! NSManagedObject).value(forKey: "rating1") as! Double)
                    print("q2 :", (data.value(forKey: "survey2") as! NSManagedObject).value(forKey: "question2") as! String, " r2 :", (data.value(forKey: "survey2") as! NSManagedObject).value(forKey: "rating2") as! Double)
                    print("q3 :", (data.value(forKey: "survey2") as! NSManagedObject).value(forKey: "question3") as! String, " r3 :", (data.value(forKey: "survey2") as! NSManagedObject).value(forKey: "rating3") as! Double)
                    print("q4 :", (data.value(forKey: "survey2") as! NSManagedObject).value(forKey: "question4") as! String, " r4 :", (data.value(forKey: "survey2") as! NSManagedObject).value(forKey: "rating4") as! Double)
                    print("q5 :", (data.value(forKey: "survey2") as! NSManagedObject).value(forKey: "question5") as! String, " r5 :", (data.value(forKey: "survey2") as! NSManagedObject).value(forKey: "rating5") as! Double)
 
                    //user survey3
                    print("survey3 :")//, (data.value(forKey: "survey3")!))
                    
                    print("q1 :", (data.value(forKey: "survey3") as! NSManagedObject).value(forKey: "question1") as! String, " r1 :", (data.value(forKey: "survey3") as! NSManagedObject).value(forKey: "rating1") as! Double)
                    print("q2 :", (data.value(forKey: "survey3") as! NSManagedObject).value(forKey: "question2") as! String, " r2 :", (data.value(forKey: "survey3") as! NSManagedObject).value(forKey: "rating2") as! Double)
                    print("q3 :", (data.value(forKey: "survey3") as! NSManagedObject).value(forKey: "question3") as! String, " r3 :", (data.value(forKey: "survey3") as! NSManagedObject).value(forKey: "rating3") as! Double)
                    print("q4 :", (data.value(forKey: "survey3") as! NSManagedObject).value(forKey: "question4") as! String, " r4 :", (data.value(forKey: "survey3") as! NSManagedObject).value(forKey: "rating4") as! Double)
                    print("q5 :", (data.value(forKey: "survey3") as! NSManagedObject).value(forKey: "question5") as! String, " r5 :", (data.value(forKey: "survey3") as! NSManagedObject).value(forKey: "rating5") as! Double)
 
                    //user survey4
                    print("survey4 :")//, (data.value(forKey: "survey4")!))
                    
                    print("q1 :", (data.value(forKey: "survey4") as! NSManagedObject).value(forKey: "question1") as! String, " r1 :", (data.value(forKey: "survey4") as! NSManagedObject).value(forKey: "rating1") as! Double)
                    print("q2 :", (data.value(forKey: "survey4") as! NSManagedObject).value(forKey: "question2") as! String, " r2 :", (data.value(forKey: "survey4") as! NSManagedObject).value(forKey: "rating2") as! Double)
                    print("q3 :", (data.value(forKey: "survey4") as! NSManagedObject).value(forKey: "question3") as! String, " r3 :", (data.value(forKey: "survey4") as! NSManagedObject).value(forKey: "rating3") as! Double)
                    print("q4 :", (data.value(forKey: "survey4") as! NSManagedObject).value(forKey: "question4") as! String, " r4 :", (data.value(forKey: "survey4") as! NSManagedObject).value(forKey: "rating4") as! Double)
                    print("q5 :", (data.value(forKey: "survey4") as! NSManagedObject).value(forKey: "question5") as! String, " r5 :", (data.value(forKey: "survey4") as! NSManagedObject).value(forKey: "rating5") as! Double)
 
                    //user survey5
                    print("survey5 :")//, (data.value(forKey: "survey5")!))
                    
                    print("q1 :", (data.value(forKey: "survey5") as! NSManagedObject).value(forKey: "question1") as! String, " r1 :", (data.value(forKey: "survey5") as! NSManagedObject).value(forKey: "rating1") as! Double)
                    print("q2 :", (data.value(forKey: "survey5") as! NSManagedObject).value(forKey: "question2") as! String, " r2 :", (data.value(forKey: "survey5") as! NSManagedObject).value(forKey: "rating2") as! Double)
                    print("q3 :", (data.value(forKey: "survey5") as! NSManagedObject).value(forKey: "question3") as! String, " r3 :", (data.value(forKey: "survey5") as! NSManagedObject).value(forKey: "rating3") as! Double)
                    print("q4 :", (data.value(forKey: "survey5") as! NSManagedObject).value(forKey: "question4") as! String, " r4 :", (data.value(forKey: "survey5") as! NSManagedObject).value(forKey: "rating4") as! Double)
                    print("q5 :", (data.value(forKey: "survey5") as! NSManagedObject).value(forKey: "question5") as! String, " r5 :", (data.value(forKey: "survey5") as! NSManagedObject).value(forKey: "rating5") as! Double)
 
                    
                }
            } catch {
                print("Failed")
            }
    }
     */
    
    func doesExist() -> Bool{
        var exist = false
        do {
            let request = User.fetchRequest() as NSFetchRequest<User>
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                var user = data.value(forKey: "userID") as! String
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // sends username.text to WelcomeViewController as username.text
        if segue.identifier == "LoginSuccess" {
            let destinationController = segue.destination as! WelcomeViewController
            destinationController.labelText = username.text!
            
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //when button pressed, segue identifier is LoginSuccess, so checks login information
        if identifier == "LoginSuccess" {
            //checks if username exists
            if self.doesExist(){
                do {
                    //fetch data
                    let request = User.fetchRequest() as NSFetchRequest<User>
                    //modify fetch data to fetch specific data
                    let pred = NSPredicate(format: "userID CONTAINS %@", username.text as! CVarArg)
                    request.predicate = pred
                    let result = try context.fetch(request)
                    if result[0].password == password.text! {
                        print("login successful")
                        //assign username value to created object for other view controllers
                        passLogin.login.passUser = username.text!
                        return true
                    } else {
                        let registerAlert2 = UIAlertController(title: "Invalid Password", message: "Make sure your password is correct!", preferredStyle: .alert)

                        registerAlert2.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

                        self.present(registerAlert2, animated: true)
                        print("incorrect password")
                        return false
                    }
                } catch {
                    print("Failed")
                }
            } else {
                let loginAlert1 = UIAlertController(title: "Invalid Username.", message: "Make sure your username is registered!", preferredStyle: .alert)
                
                loginAlert1.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                
                self.present(loginAlert1, animated: true)
                print("username doesn't exist")
                return false
            }
        }
        return true
    }
  /*
    @IBAction func deleteTable(_ sender: Any) {
        do {
            //delete user data
            let request = User.fetchRequest() as NSFetchRequest<User>
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                try context.delete(data)
            }
            //delete survey1 data
            let request1 = Survey1.fetchRequest() as NSFetchRequest<Survey1>
            let result1 = try context.fetch(request)
            for data in result1 as! [NSManagedObject] {
                try context.delete(data)
            }
            //delete survey2 data
            let request2 = Survey2.fetchRequest() as NSFetchRequest<Survey2>
            let result2 = try context.fetch(request)
            for data in result2 as! [NSManagedObject] {
                try context.delete(data)
            }
            //delete survey3 data
            let request3 = Survey3.fetchRequest() as NSFetchRequest<Survey3>
            let result3 = try context.fetch(request)
            for data in result3 as! [NSManagedObject] {
                try context.delete(data)
            }
            //delete survey4 data
            let request4 = Survey4.fetchRequest() as NSFetchRequest<Survey4>
            let result4 = try context.fetch(request)
            for data in result4 as! [NSManagedObject] {
                try context.delete(data)
            }
            //delete survey5 data
            let request5 = Survey5.fetchRequest() as NSFetchRequest<Survey5>
            let result5 = try context.fetch(request)
            for data in result5 as! [NSManagedObject] {
                try context.delete(data)
            }
            //save data
            do {
                try self.context.save()
                print("saved data")
            }
            catch let err {
                print("error saving the data", err)
            }
        } catch {
            print("Failed")
            
        }
        
    }
    */
    
    @IBAction func Login(_ sender: Any) {
        print("Checking login")
    }
    
    @IBAction func Register(_ sender: Any) {
        print("Moving to register screen")
    }
    
    @IBAction func ForgotPassword(_ sender: Any) {
        print("Moving to forgot password screen")
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

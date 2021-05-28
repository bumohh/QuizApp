//
//  RegisterViewController.swift
//  Project
//
//  Created by admin on 4/22/21.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {

    var registerSuccess = false
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let noRating : Double = -1.0
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
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "RegisterSuccess" {
            if registerSuccess {
                return true
            } else {
                return false
            }
        }
        return true
    }
    
    @IBAction func RegisterSubmit(_ sender: Any) {
        print("Checking if credentials are valid, if so, create new user, else deny")
        
        //check if user length is greater than 2
        if username.text!.count <= 2 {
            print("username too short, must be great than 2 characters")
            let registerAlert1 = UIAlertController(title: "Invalid Username.", message: "Make sure your username is longer than 2 characters!", preferredStyle: .alert)

            registerAlert1.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(registerAlert1, animated: true)

            
        } else {
            //check if user already exists
            if self.doesExist() {
                let registerAlert2 = UIAlertController(title: "Username Exists.", message: "Please try again with another username.", preferredStyle: .alert)

                registerAlert2.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

                self.present(registerAlert2, animated: true)
                
                print("data exists try again")
            } else {
                //checks password length
                if password.text!.count < 7 {
                    let registerAlert4 = UIAlertController(title: "Invalid Password.", message: "Make sure your password is longer than 7 characters!", preferredStyle: .alert)

                    registerAlert4.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

                    self.present(registerAlert4, animated: true)
                    print("password must be 7 characters long!")
                } else {
                    registerSuccess = true
                    let registerAlert3 = UIAlertController(title: "Register Success!", message: "Moving to login screen.", preferredStyle: .alert)

                    registerAlert3.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
                        action in (self.performSegue(withIdentifier: "RegisterSuccess", sender: nil))
                    }))

                    self.present(registerAlert3, animated: true)
                    
                    //tells segue to go back to login screen when button pressed
                    
                    //create user object
                    let newUser = User(context: self.context)
                    newUser.userID = username.text
                    newUser.password = password.text
                    
                    //create survey1 object
                    let newSurvey1 = Survey1(context: self.context)
                    newSurvey1.question1 = "Staff Met Your Needs?"
                    newSurvey1.question2 = "Would You Recommend Us?"
                    newSurvey1.question3 = "Would You Return?"
                    newSurvey1.question4 = "Overall Experience"
                    newSurvey1.question5 = "Rate Us"
                    newSurvey1.rating1 = noRating
                    newSurvey1.rating2 = noRating
                    newSurvey1.rating3 = noRating
                    newSurvey1.rating4 = noRating
                    newSurvey1.rating5 = noRating
                    newSurvey1.username = newUser.userID
                    //create survey2 object
                    let newSurvey2 = Survey2(context: self.context)
                    newSurvey2.question1 = "Food Quality"
                    newSurvey2.question2 = "Food Cost"
                    newSurvey2.question3 = "Menu Selection"
                    newSurvey2.question4 = "Staff"
                    newSurvey2.question5 = "Rate Your Experience"
                    newSurvey2.rating1 = noRating
                    newSurvey2.rating2 = noRating
                    newSurvey2.rating3 = noRating
                    newSurvey2.rating4 = noRating
                    newSurvey2.rating5 = noRating
                    newSurvey2.username = newUser.userID
                    //create survey3 object
                    let newSurvey3 = Survey3(context: self.context)
                    newSurvey3.question1 = "Rooms Were Clean"
                    newSurvey3.question2 = "Staff Was Respectful"
                    newSurvey3.question3 = "Room Had All Necessities"
                    newSurvey3.question4 = "Room Cost"
                    newSurvey3.question5 = "Rate Your Experience"
                    newSurvey3.rating1 = noRating
                    newSurvey3.rating2 = noRating
                    newSurvey3.rating3 = noRating
                    newSurvey3.rating4 = noRating
                    newSurvey3.rating5 = noRating
                    newSurvey3.username = newUser.userID
                    //create survey4 object
                    let newSurvey4 = Survey4(context: self.context)
                    newSurvey4.question1 = "Beach Was Clean"
                    newSurvey4.question2 = "Beach Wasnt Crowded"
                    newSurvey4.question3 = "Staff Hospitality"
                    newSurvey4.question4 = "I Felt Safe"
                    newSurvey4.question5 = "Rate Your Experience"
                    newSurvey4.rating1 = noRating
                    newSurvey4.rating2 = noRating
                    newSurvey4.rating3 = noRating
                    newSurvey4.rating4 = noRating
                    newSurvey4.rating5 = noRating
                    newSurvey4.username = newUser.userID
                    //create survey5 object
                    let newSurvey5 = Survey5(context: self.context)
                    newSurvey5.question1 = "Setting Up Was Quick/Easy"
                    newSurvey5.question2 = "Staff Was Respectful"
                    newSurvey5.question3 = "Staff Hospitality"
                    newSurvey5.question4 = "Staff Was Hard Working"
                    newSurvey5.question5 = "Rate Your Experience"
                    newSurvey5.rating1 = noRating
                    newSurvey5.rating2 = noRating
                    newSurvey5.rating3 = noRating
                    newSurvey5.rating4 = noRating
                    newSurvey5.rating5 = noRating
                    newSurvey5.username = newUser.userID
                    
                    
                    //create relationship between user and feedback, feedback and user, survey and feedback, feedback and survey
                    newUser.survey1 = newSurvey1
                    newUser.survey2 = newSurvey2
                    newUser.survey3 = newSurvey3
                    newUser.survey4 = newSurvey4
                    newUser.survey5 = newSurvey5
                    //save the data
                    do {
                        try self.context.save()
                        print("saved data")
                    }
                    catch let err {
                        print("error saving the data", err)
                    }
                }
            }
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

//
//  Survey4ViewController.swift
//  Project
//
//  Created by admin on 4/26/21.
//

import UIKit
import CoreData

class Survey4ViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var labelText : String = "Beach \nSurvey"
    var rating1 : Double = -1
    var rating2 : Double = -1
    var rating3 : Double = -1
    var rating4 : Double = -1
    var rating5 : Double = -1


    var username = LoginPageViewController.passLogin.login.passUser
    var rating : Double = -1
    
    @IBOutlet weak var label1: PrettyLabel!
    @IBOutlet weak var label2: PrettyLabel!
    @IBOutlet weak var label3: PrettyLabel!
    @IBOutlet weak var label4: PrettyLabel!
    @IBOutlet weak var label5: PrettyLabel!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var survey4Rate1: CosmosView!
    @IBOutlet weak var survey4Rate2: CosmosView!
    @IBOutlet weak var survey4Rate3: CosmosView!
    @IBOutlet weak var survey4Rate4: CosmosView!
    @IBOutlet weak var survey4Rate5: CosmosView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //fetch questions
        do {
            //fetch data
            let request = Survey4.fetchRequest() as NSFetchRequest<Survey4>
            //modify fetch data to fetch specific data
            let pred = NSPredicate(format: "username CONTAINS %@", username as CVarArg)
            request.predicate = pred
            let result = try context.fetch(request)
            for data in result {
                label1.text = data.question1!
                label2.text = data.question2!
                label3.text = data.question3!
                label4.text = data.question4!
                label5.text = data.question5!
            }
            } catch {
                print("couldn't fetch questions")
            }
        
        survey4Rate1.settings.fillMode = .half
        survey4Rate2.settings.fillMode = .half
        survey4Rate3.settings.fillMode = .half
        survey4Rate4.settings.fillMode = .half
        survey4Rate5.settings.fillMode = .half
        
        
        survey4Rate1.didFinishTouchingCosmos = {
            rate in
            self.rating1 = rate
            
            if rate <= 2.5 {
                self.img1.image = UIImage(systemName: "hand.thumbsdown")
            } else if(rate <= 4 && rate >= 3) {
                self.img1.image = UIImage(systemName: "hand.thumbsup")
            } else {
                self.img1.image = UIImage(systemName: "heart")
                }
            }
        survey4Rate2.didFinishTouchingCosmos = {
            rate2 in
            self.rating2 = rate2
            if rate2 <= 2.5 {
                self.img2.image = UIImage(systemName: "hand.thumbsdown")
            } else if (rate2 <= 4 && rate2 >= 3) {
                self.img2.image = UIImage(systemName: "hand.thumbsup")
            } else {
                self.img2.image = UIImage(systemName: "heart")
                }
            }
        survey4Rate3.didFinishTouchingCosmos = {
            rate3 in
            self.rating3 = rate3
            if rate3 <= 2.5 {
                self.img3.image = UIImage(systemName: "hand.thumbsdown")
            } else if (rate3 <= 4 && rate3 >= 3) {
                self.img3.image = UIImage(systemName: "hand.thumbsup")
            } else {
                self.img3.image = UIImage(systemName: "heart")
                }
        }
        survey4Rate4.didFinishTouchingCosmos = {
            rate4 in
            self.rating4 = rate4
            if rate4 <= 2.5 {
                self.img4.image = UIImage(systemName: "hand.thumbsdown")
            } else if (rate4 <= 4 && rate4 >= 3) {
                self.img4.image = UIImage(systemName: "hand.thumbsup")
            } else {
                self.img4.image = UIImage(systemName: "heart")
                }
        }
        survey4Rate5.didFinishTouchingCosmos = {
            rate5 in
            self.rating5 = rate5
            if rate5 <= 2.5 {
                self.img5.image = UIImage(systemName: "hand.thumbsdown")
            } else if (rate5 <= 4 && rate5 >= 3) {
                self.img5.image = UIImage(systemName: "hand.thumbsup")
            } else {
                self.img5.image = UIImage(systemName: "heart")
                }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // sends username.text to ThankYouViewController as username.text
        if segue.identifier == "Survey4" {
            let destinationController = segue.destination as! ThankYouViewController
            destinationController.labelText = labelText
            
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "Survey4" {
            if (rating1 > 0.0) && (rating2 > 0.0) && (rating3 > 0.0) && (rating4 > 0.0) && (rating5 > 0.0) {
                return true
                
            } else {
                return false
            }
        }
        return true
        
    }
    @IBAction func Survey4Submit(_ sender: Any) {
        print(rating1," ", rating2, " ", rating3," ", rating4, " " ,rating5)
        if (rating1 > 0.0) && (rating2 > 0.0) && (rating3 > 0.0) && (rating4 > 0.0) && (rating5 > 0.0){
            do {
                //fetch data
                let request = Survey4.fetchRequest() as NSFetchRequest<Survey4>
                //modify fetch data to fetch specific data
                let pred = NSPredicate(format: "username CONTAINS %@", username as CVarArg)
                request.predicate = pred
                let result = try context.fetch(request)
                for data in result {
                    data.rating1 = rating1
                    data.rating2 = rating2
                    data.rating3 = rating3
                    data.rating4 = rating4
                    data.rating5 = rating5
                }
                print("rating submitted succesfully")
                do {
                    try self.context.save()
                    print("saved data")
                } catch let err{
                    print("error saving the data", err)
                }
                
            } catch {
                print("cannot submit survey")
            }
        } else {
            let cantSurvey = UIAlertController(title: "Not Done.", message: "Please fill out every question before submitting!!", preferredStyle: .alert)

            cantSurvey.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(cantSurvey, animated: true)
            print("Please fill out every survey before submitting!!")
        }
    }
}

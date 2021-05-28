//
//  Survey1+CoreDataProperties.swift
//  Project
//
//  Created by admin on 5/5/21.
//
//

import Foundation
import CoreData


extension Survey1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Survey1> {
        return NSFetchRequest<Survey1>(entityName: "Survey1")
    }

    @NSManaged public var question1: String?
    @NSManaged public var question2: String?
    @NSManaged public var question3: String?
    @NSManaged public var question4: String?
    @NSManaged public var question5: String?
    @NSManaged public var rating1: Double
    @NSManaged public var rating2: Double
    @NSManaged public var rating3: Double
    @NSManaged public var rating4: Double
    @NSManaged public var rating5: Double
    @NSManaged public var username: String?

}

extension Survey1 : Identifiable {

}

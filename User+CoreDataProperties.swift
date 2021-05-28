//
//  User+CoreDataProperties.swift
//  Project
//
//  Created by admin on 5/5/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var password: String?
    @NSManaged public var userID: String?
    @NSManaged public var survey1: Survey1?
    @NSManaged public var survey2: Survey2?
    @NSManaged public var survey3: Survey3?
    @NSManaged public var survey4: Survey4?
    @NSManaged public var survey5: Survey5?

}

extension User : Identifiable {

}

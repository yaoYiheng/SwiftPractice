//
//  Employee+CoreDataProperties.swift
//  17_10_05_CoreData
//
//  Created by 姚懿恒 on 2017/10/5.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?
    @NSManaged public var height: Float
    @NSManaged public var birthday: NSDate?

}

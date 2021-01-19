//
//  CoreDataProject+CoreDataProperties.swift
//  Thummit
//
//  Created by 이성준 on 2020/12/20.
//
//

import Foundation
import CoreData


extension CoreDataProject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataProject> {
        return NSFetchRequest<CoreDataProject>(entityName: "CoreDataProject")
    }
    
    @nonobjc public class func fetchRequest(projectId: String) -> NSFetchRequest<CoreDataProject> {
        let request = NSFetchRequest<CoreDataProject>(entityName: "CoreDataProject")
        request.predicate = NSPredicate(format: "projectID == %@", projectId)
        return request
    }

    @NSManaged public var projectData: Data?
    @NSManaged public var projectID: String?
    @NSManaged public var projectFilePath: String?

}

extension CoreDataProject : Identifiable {

}

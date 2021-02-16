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
    
    @nonobjc public class func fetchRequest(fetchOffset: NSInteger) -> NSFetchRequest<CoreDataProject> {
        let request = NSFetchRequest<CoreDataProject>(entityName: "CoreDataProject")
        
        var fetchLimit = 10
        let remainder = Int(ProjectManager.sharedInstance().fetchProjectsCount()) % fetchLimit
        if fetchOffset == 0 && remainder > 0 {
            fetchLimit = remainder
        }
        request.fetchLimit = fetchLimit
        request.fetchOffset = fetchOffset
        
        return request
    }

    @NSManaged public var projectData: Data?
    @NSManaged public var projectID: String?
    @NSManaged public var lastEditedDate: String?
    @NSManaged public var projectFilePath: String?
    
    
}

extension CoreDataProject : Identifiable {
    @objc public func updateProperties(from project:Project) {
        
        self.projectID = project.projectID
        self.lastEditedDate = project.lastEditedDate
        self.projectFilePath = project.projectFilePath
        
    }

}

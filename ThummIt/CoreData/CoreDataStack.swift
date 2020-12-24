//
//  CoreDataStack.swift
//  Thummit
//
//  Created by 이성준 on 2020/12/20.
//

import UIKit
import CoreData

class CoreDataStack: NSObject {

    private static var sharedInstance: CoreDataStack = {
        return CoreDataStack()
    }()
    
    @objc public class func shared() -> CoreDataStack {
        return sharedInstance
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer? = {
        return loadCoreDataContainer()
    }()
    
    var mainContext: NSManagedObjectContext? {
        
        let context = persistentContainer?.viewContext
        context?.mergePolicy = NSMergePolicy.init(merge: .overwriteMergePolicyType)
        
        return context
    }
    
        
    private func loadCoreDataContainer() -> NSPersistentContainer? {
        
        var container: NSPersistentContainer?
        let containerName = "ThummIt"
        
        container = NSPersistentContainer(name: containerName)
        
        if let persistentDescriptions = container?.persistentStoreDescriptions.first {
            persistentDescriptions.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
        }
        
        container?.loadPersistentStores(completionHandler: { (storeDescription, error) in

        })
        
        return container
    }
    
    
    // MARK: - Core Data Saving support
    @objc public class func saveContext() throws {
        
        guard let context = sharedInstance.mainContext else {
            return
        }
        
        var saveError: Error?
        context.performAndWait {
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    saveError = nserror
                }
            }
        }
        
        if (saveError != nil) {
            throw saveError! as NSError
        }
        
    }
    
    @objc public class func newProject() -> Project? {
        guard let context = sharedInstance.mainContext else {
            return nil
        }
        
        var ret = ""
//        while (true) {
//                        
//            ret = ProjectManager.sharedInstance().generateProjectID()
//            
//            if CoreDataStack.isCoreDataProjectExist(projectId: ret) == false {
//                break
//            }
//        }
        ret = ProjectManager.sharedInstance().generateProjectID()
        let newProject = Project.init(projectID: ret)
        
        context.performAndWait {
            
            let newCoreDataProject = CoreDataProject.init(context: context)
            newCoreDataProject.projectID = ret;
            newProject.coreDataStorage = newCoreDataProject
        }
        
        return newProject
    }
    
    @objc public class func fetchAllProjects() -> [CoreDataProject] {
        
        guard let context = sharedInstance.mainContext else {
            return [CoreDataProject]()
        }
        
        let fetchRequest: NSFetchRequest<CoreDataProject> = CoreDataProject.fetchRequest()
        
        var projects = [CoreDataProject]()
        
        context.performAndWait {
            do {
                projects = try context.fetch(fetchRequest)
            } catch {
                // 에러
                NSLog("에러");
            }
        }
        
        return projects
    }

    @objc public class func fetchProject(projectId: String) -> CoreDataProject? {
        guard let context = sharedInstance.mainContext else {
            return nil
        }
        
        let fetchRequest = CoreDataProject.fetchRequest(projectId: projectId)
        
        var projects = [CoreDataProject]()
        
        context.performAndWait {
            do {
                projects = try context.fetch(fetchRequest)
            } catch {
                // 에러
            }
            
            if projects.count > 1 {
                // TODO: something wrong with id
            }
        }
        return projects.first
    }
    
    @objc public class func deleteProject(project: Project) {
        guard let context = sharedInstance.mainContext else {
            return
        }
        
        context.performAndWait {
            let coreDataProject = project.coreDataStorage
            
            if coreDataProject != nil {
                context.delete(coreDataProject)
            }
            
        }
    }


}



// MARK: - For Projects
extension CoreDataStack {
    
    @objc public class func isCoreDataProjectExist(projectId: String) -> Bool {
        guard let context = sharedInstance.mainContext else {
            return false
        }
        
        let fetchRequest = CoreDataProject.fetchRequest(projectId: projectId)
        
        var isExist = false
        
        context.performAndWait {
            if let cnt = try? context.count(for: fetchRequest),
                cnt > 0 {
                isExist = true
            }
        }
        
        return isExist
    }

}

// MARK: - For Template
extension CoreDataStack {
    
    
}


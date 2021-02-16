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

    // MARK: - 생성

    @objc public class func newProject() -> Project? {
        guard let context = sharedInstance.mainContext else {
            return nil
        }
        
        var ret = ""
        ret = ProjectManager.sharedInstance().generateProjectID()
        let newProject = Project.init(projectID: ret)
        
        context.performAndWait {
            
            let newCoreDataProject = CoreDataProject.init(context: context)
            newCoreDataProject.projectID = ret;
            newProject.coreDataStorage = newCoreDataProject
        }
        
        return newProject
    }

    
    
    // MARK: - 저장
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
    
    // MARK: - 페치

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
    
    @objc public class func fetchProjectsCount() -> NSInteger {
        
        guard let context = sharedInstance.mainContext else {
            return 0
        }
        
        let fetchRequest: NSFetchRequest<CoreDataProject> = CoreDataProject.fetchRequest()
        
        var count = 0
        
        context.performAndWait {
            do {
                count = try context.count(for: fetchRequest)
            } catch {
                // 에러
                NSLog("에러");
            }
        }
        
        return count
    }

    @objc public class func fetch(fetchOffSet: NSInteger) -> [CoreDataProject] {
        
        guard let context = sharedInstance.mainContext else {
            return [CoreDataProject]()
        }
        
        let fetchRequest: NSFetchRequest<CoreDataProject> = CoreDataProject.fetchRequest(fetchOffset: fetchOffSet)
        
        var fetchObjects = [CoreDataProject]()
        
        context.performAndWait {
            do {
                fetchObjects = try context.fetch(fetchRequest)
            } catch {
                // 에러
                NSLog("에러");
            }
        }
        var projects = [CoreDataProject]()
        projects.reserveCapacity(0)
        for i in 0..<fetchObjects.count{
            let project = fetchObjects[i]
            projects.append(project)
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
    
    // MARK: - 삭제
    
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


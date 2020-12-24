//
//  MigratorJul.swift
//  Vlogr
//
//  Created by vlogrFullName on 2020/07/21.
//  Copyright © 2020 TaejunLee. All rights reserved.
//

import UIKit

class MigratorJul: NSObject {

    private let migrationKey = "200721MigratorJul"
    private let numOfTrialKey = "200721MigratorJulNumOfTrial"
    private let maxNumOfTrial = 3
    
    private static var migrator: MigratorJul = {
        return MigratorJul()
    }()
    
    @objc public class func shared() -> MigratorJul {
        return migrator
    }
    
    @objc public func migrateIfNeeded() {
        
        if isMigrated() == false {
            
            let isSucceeded = migrateFileDataIntoCoreData()
            
            if isSucceeded {
                // set migration complete flag
                UserDefaults.standard.set(true, forKey: migrationKey)
            } else {
                
                var numOfTrial = UserDefaults.standard.integer(forKey: numOfTrialKey)
                
                // check if numOftrial Exceeds
                // if it is, quit
                if numOfTrial >= maxNumOfTrial {
                    // set migration complete flag
                    UserDefaults.standard.set(true, forKey: migrationKey)
                    return
                }
                
                // otherwise, try migration next time again
                numOfTrial += 1
                UserDefaults.standard.set(numOfTrial, forKey: numOfTrialKey)
            }
            
        }
        
    }
    
    @objc public func isMigrated() -> Bool {
        
        if UserDefaults.standard.bool(forKey: migrationKey) {
            return true
        } else {
            return false
        }
    }
    
}

extension MigratorJul {
    
    fileprivate func migrateFileDataIntoCoreData() -> Bool {
        
        var isMigratedCompleted = true
        let coreDataProjects = CoreDataStack.fetchAllProjects()
        
        for coreDataProject in coreDataProjects {
            
            // read project data from file
            guard let projectFilePath = coreDataProject.projectFilePath,
                let projectData = try? ProjectFileManager.sharedInstance.read(filePath: projectFilePath) else {
                continue
            }
            
            // set project data as coredata property
            coreDataProject.projectData = projectData

            // empty projectFilePath property
            coreDataProject.projectFilePath = ""
            
            // try save
            var isSaveSucceeded = true
            do {
                try CoreDataStack.saveContext()
            } catch {
                isSaveSucceeded = false
                isMigratedCompleted = false
            }
            
            if isSaveSucceeded {
                // delete file
                try? ProjectFileManager.sharedInstance.delete(filePath: projectFilePath)
            }
            
        }
        
        return isMigratedCompleted
    }
}

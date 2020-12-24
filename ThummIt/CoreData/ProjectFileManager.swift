//
//  ProjectFileManager.swift
//  Thummit
//
//  Created by 이성준 on 2020/12/20.
//

import Foundation

class ProjectFileManager: NSObject {
    
    @objc public static let sharedInstance = ProjectFileManager()
    @objc public static let projectFolderName = "project"
    
    @objc public func write(data: Data) throws -> String {
        
        // create project folder
        do {
            try createProjectFolderIfNeeded()
        } catch(let error) {
            throw error
        }
        
        let filePath = randomFilePath()
        
        let url = URL.init(fileURLWithPath: filePath)
        do {
            try data.write(to: url)
            return filePath
        } catch(let error){
            throw error
        }
    }

    @objc public func read(filePath: String) throws -> Data {
        
        // find last path component
        let url = URL(fileURLWithPath: filePath)
        let lastComponent = url.lastPathComponent
        
        // get project folder
        let projectFolderURL = URL(fileURLWithPath: getProjectFolder())
        
        // combine components
        let finalPath = projectFolderURL.appendingPathComponent(lastComponent)
        
        do {
            let data = try Data.init(contentsOf: finalPath)
            return data
        } catch(let error) {
            throw error
        }
    }
    
    @objc public func delete(filePath: String) throws {
        
        do {
            try FileManager.default.removeItem(at: URL(fileURLWithPath: filePath))
        } catch(let error) {
            throw error
        }
        
    }
    
    private func randomFilePath() -> String {
        
        guard let folderPath = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else {
            
            return ""
        }
            
        
        let fileName = ProjectManager.sharedInstance().generateProjectID
        let finalPath = folderPath.appendingPathComponent(ProjectFileManager.projectFolderName).appendingPathComponent(fileName())
        
        return finalPath.path
        
    }
    
    private func createProjectFolderIfNeeded() throws {
        
        guard let folderPath = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else {
            
            return
        }
        
        let finalFolderPath = folderPath.appendingPathComponent(ProjectFileManager.projectFolderName)
        
        if FileManager.default.fileExists(atPath: finalFolderPath.path) {
            return
        }
        
        do {
            try FileManager.default.createDirectory(at: finalFolderPath, withIntermediateDirectories: false, attributes: nil)
        } catch(let error) {
            throw error
        }
        
    }
    
    private func getProjectFolder() -> String {
        if let folderPath = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            let finalFolderPath = folderPath.appendingPathComponent(ProjectFileManager.projectFolderName)
            
            return finalFolderPath.path
        }
        
        return ""
    }
}

//
//  Migrator200406.swift
//  Vlogr
//
//  Created by vlogrFullName on 2020/04/06.
//  Copyright © 2020 TaejunLee. All rights reserved.
//

import UIKit

class Migrator200406: NSObject {

    private let migrationUserDefaultKey = "200406CoreDataMigration"
    
    private static var migrator: Migrator200406 = {
        return Migrator200406()
    }()
    
    @objc public class func shared() -> Migrator200406 {
        return migrator
    }
        
    @objc public func isMigrated() -> Bool {
        
        if UserDefaults.standard.bool(forKey: migrationUserDefaultKey) {
            return true
        } else {
            return false
        }
    }
    
}

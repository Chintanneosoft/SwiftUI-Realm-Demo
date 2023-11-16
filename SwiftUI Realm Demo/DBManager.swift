//
//  DataBase Manager.swift
//  SwiftUI Realm Demo
//
//  Created by Neosoft on 15/11/23.
//

import Foundation
import RealmSwift

class DBManager{
    let realm = try? Realm()
    
    func saveData(developers: Developers) -> String?{
        do {
            try realm?.write({
                realm?.add(developers)
            })
        } catch {
            print("Cant write:", error)
            return error.localizedDescription
        }
        return nil
    }
    
    func getData() -> Results<Developers>?{
        return realm?.objects(Developers.self)
    }
    
    func updateDeveloper(_ developer: Developers, withName name: String, exp: String) -> String?{
        do {
            try realm?.write{
                developer.name = name
                developer.exp = exp
            }
        } catch {
            print("Cant write:", error)
            return error.localizedDescription
        }
        return nil
    }
    
    func deleteDeveloper(_ developer: Developers) -> String? {
        do {
            try realm?.write{
                realm?.delete(developer)
            }
        } catch {
            print("Cant write:", error)
            return error.localizedDescription
        }
        return nil
    }
    
}

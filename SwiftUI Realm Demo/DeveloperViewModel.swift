//
//  DeveloperViewModel.swift
//  SwiftUI Realm Demo
//
//  Created by Neosoft on 15/11/23.
//

import Foundation
import RealmSwift


class DeveloperViewModel:ObservableObject{
    
    let dbManager = DBManager()
    @Published var resultDevelopers: Results<Developers>?

    func getData(){
        resultDevelopers = dbManager.getData()
    }
    
    func saveData(name: String, exp: String) -> String?{
        let dev = Developers()
        dev.id = UUID().uuidString 
        dev.name = name
        dev.exp = exp
        if let error = dbManager.saveData(developers: dev){
            return error
        }
        
        getData()
        return nil
    }
    func deleteData(index: Int) -> String? {
      if index < resultDevelopers?.count ?? 0 {
        if let error = dbManager.deleteDeveloper(resultDevelopers?[index] ?? Developers()) {
          return error
        }
      } else {
        print("Index \(index) is out of bounds")
      }

      return nil
    }

//    func deleteData(index: Int) -> String?{
//        if let error = dbManager.deleteDeveloper(resultDevelopers?[index] ?? Developers()){
//            return error
//        }
//
//        return nil
//    }
//    func deleteData(index: Int) -> String? {
//        guard let developers = resultDevelopers else {
//            return "No developers found"
//        }
//
//        guard index < developers.count else {
//            return "Invalid index"
//        }
//
//        let developerToDelete = developers[index]
//
//        if let error = dbManager.deleteDeveloper(developerToDelete) {
//            return error
//        }
//
//        // Update the resultDevelopers after deleting the developer
////        resultDevelopers = dbManager.getData()
//
//        return nil
//    }


    
}

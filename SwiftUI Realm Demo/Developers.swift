//
//  Developers.swift
//  SwiftUI Realm Demo
//
//  Created by Neosoft on 15/11/23.
//

import Foundation
import RealmSwift

class Developers: Object, Identifiable {
    @Persisted var name: String?
    @Persisted var exp: String?
    @Persisted(primaryKey: true) var id = UUID().uuidString
    
    @Persisted var status: DataStatus = .pending
}

enum DataStatus: String,PersistableEnum{
    case missed = "Missed"
    case completed = "completed"
    case pending = "pending"
}

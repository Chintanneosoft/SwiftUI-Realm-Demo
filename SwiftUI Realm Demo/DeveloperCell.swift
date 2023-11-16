//
//  DeveloperCell.swift
//  SwiftUI Realm Demo
//
//  Created by Neosoft on 15/11/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct DeveloperCell: View {
    @ObservedRealmObject var dev: Developers
    
    var body: some View {
        HStack{
            Text("Name: \(dev.name ?? "")")
            Text("Experience: \(dev.exp ?? "")")
        }
    }
}

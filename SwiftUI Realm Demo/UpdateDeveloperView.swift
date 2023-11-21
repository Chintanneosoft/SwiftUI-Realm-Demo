//
//  UpdateDeveloperView.swift
//  SwiftUI Realm Demo
//
//  Created by Neosoft on 16/11/23.
//

import SwiftUI
import RealmSwift

struct UpdateDeveloperView: View {
    @ObservedResults(Developers.self) var developers
    @Binding var developer: Developers
    @State var name: String?
    @State var exp: String?
    @Binding var index: Int
    @Binding var isPresenting:Bool
    
    var body: some View {
        VStack{
            
            Text("Edit Details")
                .padding()
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .background(.blue)
                .border(.brown)
                .cornerRadius(15)
                .clipped()
                .padding()
                .onAppear{
                    name = developer.name ?? ""
                    exp = developer.exp ?? ""
                }
            
            TextField("Developer's Name", text: $name.toUnwrapped(defaultValue: ""))
                .multilineTextAlignment(.center)
                .padding()
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.red)
                .background(.yellow)
                .cornerRadius(15)
                .clipped()
                .padding()
            
            TextField("Developer's Experience", text: $exp.toUnwrapped(defaultValue: ""))
                .multilineTextAlignment(.center)
                .padding()
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.red)
                .background(.yellow)
                .cornerRadius(15)
                .clipped()
                .padding()
            
            Button("Submit") {
                isPresenting.toggle()
                updateItem(id: developer.id , name: name ?? "", exp: exp ?? "")
            }
            .padding()
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.purple)
            .background(.black)
            .cornerRadius(15)
            .clipped()
        }
    }
    private func updateItem(id: String, name: String, exp: String) {
            let realm = try! Realm()
            let developers = realm.objects(Developers.self)
        let developer = developers[index]
            try! realm.write {
                developer.name = name
                developer.exp = exp
            }
        }
}

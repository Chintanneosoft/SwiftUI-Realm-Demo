//
//  UpdateDeveloperView.swift
//  SwiftUI Realm Demo
//
//  Created by Neosoft on 16/11/23.
//

import SwiftUI
import RealmSwift

struct UpdateDeveloperView: View {
    
    @ObservedRealmObject var developer: Developers
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
            
            TextField("Developer's Name", text: $developer.name.toUnwrapped(defaultValue: ""))
                .multilineTextAlignment(.center)
                .padding()
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.red)
                .background(.yellow)
                .cornerRadius(15)
                .clipped()
                .padding()
            
            TextField("Developer's Experience", text: $developer.exp.toUnwrapped(defaultValue: ""))
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
}

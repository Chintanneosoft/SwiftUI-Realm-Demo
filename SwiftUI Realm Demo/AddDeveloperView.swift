//
//  AddDeveloperView.swift
//  SwiftUI Realm Demo
//
//  Created by Neosoft on 15/11/23.
//

import SwiftUI
import RealmSwift

struct AddDeveloperView: View {
    
    @State var name: String
    @State var exp: String
    @Binding var isPresenting:Bool
    @ObservedResults(Developers.self) var developers
    
    var body: some View {
        VStack{
            
            Text("Fill Details")
                .padding()
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .background(.blue)
                .border(.brown)
                .cornerRadius(15)
                .clipped()
                .padding()
            
            TextField("Developer's Name", text: $name)
                .multilineTextAlignment(.center)
                .padding()
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.red)
                .background(.yellow)
                .cornerRadius(15)
                .clipped()
                .padding()
            
            TextField("Developer's Experience", text: $exp)
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
                let dev = Developers()
                dev.name = name
                dev.exp = exp
                $developers.append(dev)
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


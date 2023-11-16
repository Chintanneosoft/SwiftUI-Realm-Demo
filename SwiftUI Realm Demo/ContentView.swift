//
//  ContentView.swift
//  SwiftUI Realm Demo
//
//  Created by Neosoft on 15/11/23.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @ObservedResults(Developers.self) var developers
    @ObservedRealmObject var developer: Developers
    
    @State var isPresentingAdd = false
    @State var isPresentingUpdate = false

    var body: some View {
        VStack{
            Text("iOS Developers")
                .padding()
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .background(.red)
                .border(.brown)
                .cornerRadius(15)
                .clipped()
                .padding()
            
            List{
                if !developers.isEmpty{
                    ForEach(developers,id: \.id) { developer in
                        DeveloperCell(dev: developer)
                            .frame(maxWidth: .infinity)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.yellow)
                            .listRowBackground(Color.black.opacity(1))
                            .swipeActions {
                                Button {
                                    $developers.remove(developer)
                                } label: {
                                    Image(systemName: "trash")
                                }
                                
                                Button {
                                    self.developer = developer
                                } label: {
                                    Image(systemName: "trash")
                                }
                            }
                    }
                } else {
                    Text("Add Some Data")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                        .background(.black)
                        .cornerRadius(15)
                    
                }
            }
            .scrollContentBackground(.hidden)
            
            Button {
                isPresentingAdd.toggle()
            } label: {
                Text("Add Data")
                    .padding()
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .background(.purple)
                    .border(.blue)
                    .cornerRadius(15)
                    .clipped()
            }
            .sheet(isPresented: $isPresentingAdd) {
                AddDeveloperView(name: "", exp: "", isPresenting: $isPresentingAdd)
            }
            .sheet(isPresented: $isPresentingUpdate) {
                UpdateDeveloperView(developer: developer, isPresenting: $isPresentingUpdate)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



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
    
    @StateObject var vm = DeveloperViewModel()
    
    @State var isPresenting = false
    
    var body: some View {
        VStack{
            List{
                
                if !developers.isEmpty{
                    ForEach(developers,id: \.id) { developer in
                        Text("Name: \(developer.name ?? ""), Exp: \(developer.exp ?? "")")
                    }
                    .onDelete { indexOffset in
                        for index in indexOffset {
                            print(index,indexOffset)
                            if index < developers.count {
                                if let error = vm.deleteData(index: index){
                                    print(error)
                                }
                            }
                        }
                    }
                } else {
                    Text("Add Some Data")
                }
            }
            
            Button {
                isPresenting.toggle()
            } label: {
                Text("Add Data")
                    .padding()
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                    .background(.black)
                    .cornerRadius(15)
                    .clipped()
            }
            .sheet(isPresented: $isPresenting) {
                AddDeveloperView(name: "", exp: "", isPresenting: $isPresenting)
            }
            
        }
        .onChange(of: isPresenting) { newValue in
            if !newValue {
                DispatchQueue.main.async {
                    vm.getData()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



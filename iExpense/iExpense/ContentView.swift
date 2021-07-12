//
//  ContentView.swift
//  iExpense
//
//  Created by paul taylor on 7/9/21.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Peter"
    @Published var lastName = "Rabbit"
}

//======================

struct ThirdView: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String
    @ObservedObject private var user = User()
    @State private var showingSheet1 = false

    
    var body: some View {
            Button("Click here to dismiss the page") {
                self.presentationMode.wrappedValue.dismiss()
                }
            }
}



// =======================

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String
    @ObservedObject private var user = User()
    @State private var showingSheet = false
    @State private var showingSheet1 = false
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
            Button("Click here to dismiss the page") {
                self.presentationMode.wrappedValue.dismiss()
            }
            Button("Show Sheet") {
                    self.showingSheet1.toggle()
                }
                .sheet(isPresented: $showingSheet1) {
                    ThirdView(name: "dad")
                
                }
    
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }
            
                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }
            .navigationBarItems(leading: EditButton())
        }
    }
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}


struct ContentView: View {
    @ObservedObject private var user = User()
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "mum")
        }
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
            .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



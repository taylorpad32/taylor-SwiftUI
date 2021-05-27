//
//  ContentView.swift
//  WeSplit
//
//  Created by paul taylor on 5/24/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""  //empty string
    @State private var numberOfPeople = 2 //default value
    @State private var tipPercentage = 2 // default value
    
    let tipPercentages = [10, 15, 20, 25, 0] // this is an array
    // tipPercent 2 is position 2 which is 20%
    
    var grandTotal: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        //let amountPerPerson = grandTotal / peopleCount
        
        return grandTotal
     //   return amountPerPerson
        
    }

    var amountPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    
    var body: some View {
        NavigationView {
        Form {
            Section {
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
            
                
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2..<100) {
                        Text("\($0) people")
                    
                    }
                }
            }
            
            Section(header: Text("How much tip do you want to leave?")) {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(0 ..< tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Grand Total including tip")){
                Text("$\(grandTotal, specifier: "%.2f")")
            }
            Section(header: Text("Amount Per Person")){
                Text("$\(amountPerPerson, specifier: "%.2f")")
            }
        }
    
                .navigationBarTitle("WeSplit")
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


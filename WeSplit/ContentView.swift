//
//  ContentView.swift
//  WeSplit
//
//  Created by Matthew Richardson on 8/8/20.
//  Copyright © 2020 Matthew Richardson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    //@State private var tipPercentage = 2
    @State private var tipAmount = "20"
    //let tipPercentages = [10, 15, 20, 25, 0]
    
    var tipPercentage: Int {
        return Int(tipAmount) ?? 0
    }
    
    //computed propert
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        //nil coalescing operator
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        //nil coalescing operator
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                    Section {
                        TextField("Amount", text: $checkAmount)
                            .keyboardType(.decimalPad)
                        
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2 ..< 100) {
                                Text("\($0) people")
                            }
                        }
                    }
                
                    //segmented picker
//                    Section(header: Text("How much tip do you want to leave?")) {
//                        Picker("Tip percentage", selection: $tipPercentage) {
//                            ForEach(0 ..< tipPercentages.count) {
//                                Text("\(self.tipPercentages[$0])%")
//                            }
//                        }
//                        .pickerStyle(SegmentedPickerStyle())
//                    }
                
                    Section(header: Text("How much tip do you want to leave?")) {
                        TextField("Tip", text: $tipAmount)
                            .keyboardType(.numberPad)
                        
                    }
                    
                    Section(header: Text("Amount per person")) {
                        // c style operator https://en.wikipedia.org/wiki/Printf_format_string
                        Text("$\(totalPerPerson, specifier: "%.2f")")
                        
                    }
                
                    Section(header: Text("Grand total")) {
                        // c style operator https://en.wikipedia.org/wiki/Printf_format_string
                        Text("$\(grandTotal, specifier: "%.2f")")
                        
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

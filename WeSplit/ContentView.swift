//
//  ContentView.swift
//  WeSplit
//
//  Created by Matthew Richardson on 8/8/20.
//  Copyright © 2020 Matthew Richardson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0

    var body: some View {
        VStack {
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            Text("You chose: Student # \(students[selectedStudent])")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

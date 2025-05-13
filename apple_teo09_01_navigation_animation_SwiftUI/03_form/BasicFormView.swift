//
//  BasicFormView.swift
//  apple_teo09_01_navigation_animation_SwiftUI
//
//  Created by developer on 5/12/25.
//

import SwiftUI

struct BasicFormView: View {
    @State private var name = ""
    @State private var age = 18
    @State private var notifications = true

    @State private var birthDate = Date()

    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                TextField("Name", text: $name)
                Stepper("Age: \(age)", value: $age, in: 18...100)
            }
            
            Section(header: Text("Preferences")) {
                Toggle("Receive notifications", isOn: $notifications)
            }
 
            Section("Date") {
                DatePicker("Birth date",
                           selection: $birthDate,
                           displayedComponents: .date)
            }
            
        }
    }
}

#Preview {
    BasicFormView()
}

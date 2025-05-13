//
//  ParentView.swift
//  apple_teo09_01_navigation_animation_SwiftUI
//
//  Created by developer on 5/12/25.
//

import SwiftUI

struct ParentView: View {
    
    @State private var funcionHabilitada  = false
    
    var body: some View {
        VStack {
            Text("La función está \(funcionHabilitada ? "habilitada" : "deshabilitada")")
            TaggleView(isOn: $funcionHabilitada)

        }
    }
}

#Preview {
    ParentView()
}

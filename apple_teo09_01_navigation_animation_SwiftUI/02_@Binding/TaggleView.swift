//
//  TaggleView.swift
//  apple_teo09_01_navigation_animation_SwiftUI
//
//  Created by developer on 5/12/25.
//

import SwiftUI

struct TaggleView: View {
    
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle("Funcion hablitada", isOn: $isOn)
    }
}

/*
#Preview {
    TaggleView()
}
*/

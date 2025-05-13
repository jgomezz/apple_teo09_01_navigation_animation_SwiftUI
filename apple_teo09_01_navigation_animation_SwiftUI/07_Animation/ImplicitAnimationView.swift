//
//  ContentView.swift
//  apple_teo09_02_animation_SwiftUI
//
//  Created by Jaime Gomez on 12/5/25.
//

import SwiftUI

struct ImplicitAnimationView: View {
    
    @State private var scale: CGFloat = 4.0
    
    var body: some View {
        Button("Animar") {
            scale = scale == 4.0 ? 8.0 : 4.0
        }
        .scaleEffect(scale)
        .animation(.spring(), value: scale)
    }
}

#Preview {
    ImplicitAnimationView()
}

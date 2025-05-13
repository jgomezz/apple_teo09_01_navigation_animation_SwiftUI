//
//  TransitionAnimationView.swift
//  apple_teo09_02_animation_SwiftUI
//
//  Created by Jaime Gomez on 12/5/25.
//

import SwiftUI

struct TransitionAnimationView: View {
    @State private var mostrar = false

    var body: some View {
        VStack {
            Button("Alternar") {
                withAnimation {
                    mostrar.toggle()
                }
            } .scaleEffect(2.0)

            
            if mostrar {
                Text("¡Aparezco con animación!")
                    .transition(.scale.combined(with: .opacity))
            }
        }
    }
}

#Preview {
    TransitionAnimationView()
}

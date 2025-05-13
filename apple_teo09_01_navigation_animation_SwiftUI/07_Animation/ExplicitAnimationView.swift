//
//  ExplicitAnimationView.swift
//  apple_teo09_02_animation_SwiftUI
//
//  Created by Jaime Gomez on 12/5/25.
//

import SwiftUI

struct ExplicitAnimationView: View {
    @State private var offset: CGFloat = 0

    var body: some View {
        Button("Mover") {
            withAnimation(.easeInOut(duration: 1)) {
                offset = offset == 0 ? 100 : 0
            }
        }
        .offset(x: offset)
    }
}

#Preview {
    ExplicitAnimationView()
}

//
//  CounterView.swift
//  apple_teo09_01_navigation_animation_SwiftUI
//
//  Created by developer on 5/12/25.
//

import SwiftUI

struct CounterView: View {
    
    @State var contador = 0
    
    var body: some View { 
        VStack{
            Text("Contador : \(contador)")
            Button("Incrementar") {
                contador += 1
            }
            Button("Resetear") {
                contador = 0
            }
        }
    }
    
}

#Preview {
    CounterView()
}

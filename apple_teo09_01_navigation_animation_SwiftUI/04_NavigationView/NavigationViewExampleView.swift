//
//  NavigationView.swift
//  apple_teo09_01_navigation_animation_SwiftUI
//
//  Created by developer on 5/12/25.
//

import SwiftUI

// NavigationView (iOS 13-15)
struct NavigationViewExampleView: View {
    var body: some View {
        NavigationView {
           List {
               Text("Go to Detail")
               Text("Settings")
           }
           .navigationTitle("Home")
           .navigationBarTitleDisplayMode(.large)
       }
    }
}

#Preview {
    NavigationViewExampleView()
}

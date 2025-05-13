//
//  NavigationLinkExampleView.swift
//  apple_teo09_01_navigation_animation_SwiftUI
//
//  Created by Jaime Gomez on 12/5/25.
//

import SwiftUI

struct NavigationLinkExampleView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: DetailView()) {
                    Text("View Detail")
                }
                NavigationLink("Settings", destination: SettingsView())
            }
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail View")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings View")
    }
}

#Preview {
    NavigationLinkExampleView()
}

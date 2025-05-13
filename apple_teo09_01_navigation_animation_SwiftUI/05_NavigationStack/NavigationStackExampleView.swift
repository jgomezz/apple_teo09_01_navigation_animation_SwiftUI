//
//  NavigationStackExampleView.swift
//  apple_teo09_01_navigation_animation_SwiftUI
//
//  Created by developer on 5/12/25.
//

import SwiftUI

// NavigationStack (iOS 16+)
struct NavigationStackExampleView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Button("Go to Detail") {
                    path.append("detail")
                }
                Button("Settings") {
                    path.append("settings")
                }
            }
            .navigationDestination(for: String.self) { destination in
                switch destination {
                case "detail" :
                    Text("Detail Screen")  
                        .font(.title)
                case "settings":
                    Text("Settings Screen")
                        .font(.title)
                default:
                    Text("Unknown destination: \(destination)")
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    NavigationStackExampleView()
}

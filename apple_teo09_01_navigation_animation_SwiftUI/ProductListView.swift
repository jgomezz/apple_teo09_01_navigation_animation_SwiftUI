//
//  ProductListView.swift
//  apple_teo09_01_navigation_animation_SwiftUI
//
//  Created by Jaime Gomez on 12/5/25.
//

import SwiftUI

struct ProductListView: View {
    
    let products = [
        Product(name: "iPhone", price: 6000),
        Product(name: "iPad", price: 4000)
    ]
    
    var body: some View {
        
        NavigationView{
            List(products) { product in
                NavigationLink(destination: ProductDetailView(product:product)){
                    HStack{
                        Text(product.name)
                        Spacer()
                        Text("S\(product.price, specifier: "%.2f")")
                    }
                }
            }.navigationTitle("Products")
        }
    }
}

struct ProductDetailView: View {
    
    let product:Product
    
    var body: some View {
        Text(product.name)
    }
}

#Preview {
    ProductListView()
}

//
//  CustomNavigationBarTitle.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 31/5/23.
//

import SwiftUI

struct CustomNavigationBarTitle: View {
    var body: some View {
        NavigationView { // <1>
            Text("Hello, SwiftUI!")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar { // <2>
                    ToolbarItem(placement: .principal) { // <3>
                        VStack {
                            Text("Title").font(.headline)
                            Text("Subtitle").font(.subheadline)
                        }
                    }
                }
        }

    }
}

struct CustomNavigationBarTitle_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBarTitle()
    }
}

//
//  SortView.swift
//  pokedex
//
//  Created by yves on 21/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct SortView: View {
    var body: some View {
        VStack(spacing: 35) {
            ViewHeader(
                title: "Sort",
                subtitle: "Sort Pokémons alphabetically or by National Pokédex number!"
            )
            
            VStack(spacing: buttonSpacing) {
                Button(
                    action: {},
                    label: { Text("Smallest number first") }
                ).buttonStyle(PrimaryButtonStyle())
                
                Button(
                    action: {},
                    label: { Text("Highest number first") }
                ).buttonStyle(PrimaryButtonStyle())
                
                Button(
                    action: {},
                    label: { Text("A-Z") }
                ).buttonStyle(PrimaryButtonStyle())
                
                Button(
                    action: {},
                    label: { Text("Z-A") }
                ).buttonStyle(PrimaryButtonStyle())
            }
            .frame(maxHeight: 3 * buttonSpacing + 4 * buttonHeight)
        }
        .padding(.top, 30)
        .padding(.bottom, 50)
        .padding(.horizontal, 40)
    }
}

private let buttonSpacing: CGFloat = 20
private let buttonHeight: CGFloat = 60

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView()
    }
}

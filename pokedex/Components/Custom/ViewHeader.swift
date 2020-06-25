//
//  ViewHeader.swift
//  pokedex
//
//  Created by yves on 18/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct ViewHeader: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(self.title)
                .pokemonNameTextStyle()
            
            Text(self.subtitle)
                .lineLimit(2)
                .descriptionTextStyle()
                .foregroundColor(Color.Text.grey)
        }
    }
}

struct ViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ViewHeader(
            title: "Filters",
            subtitle: "Use advanced search to explore Pokémon by type, weakness, height and more"
        )
    }
}

//
//  Badge.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 25/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct Badge: View {
    let type: PokemonType
    let showLabel: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 5.0) {
            Image("\(type.rawValue)-icon")
                .frame(width: 15.0, height: 15.0)
                .foregroundColor(Color.Text.white)
            
            if showLabel {
                Text(type.rawValue.capitalized)
                    .font(.pokemonType)
                    .foregroundColor(Color.Text.white)
            }
        }
        .padding(.all, 5)
        .background(Color.from(type: type))
        .cornerRadius(3)
    }
}

#if DEBUG
struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Spacer()
            VStack {
                ForEach(PokemonType.allCases) { type in
                    Badge(type: type, showLabel: false)
                }
            }
            Spacer()
            VStack {
                ForEach(PokemonType.allCases) { type in
                    Badge(type: type, showLabel: true)
                }
            }
            Spacer()
        }
    }
}
#endif

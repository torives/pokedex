//
//  PokemonListItem.swift
//  pokedex
//
//  Created by yves on 25/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct PokemonListItem: View {
    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.Pokemon.grassBackground)
                    .frame(height: 115)
                
                Color.Gradients.dotPattern
                    .mask(Image("6x3").resizable().scaledToFit())
                    .frame(width: 74, height: 32)
                    .offset(x: -40, y: -35)
                
                Color.Gradients.dotPattern
                    .mask(Image("pokeball").resizable().scaledToFit())
                    .frame(width: 145, height: 145)
                    .offset(x: 110, y: 0)
                
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("#001")
                                .pokemonNumberTextStyle()
                            Text(verbatim: "Bulbasaur")
                                .foregroundColor(Color.Text.white)
                                .pokemonNameTextStyle()
                        }
                        HStack(spacing: 5) {
                            Badge(type: .grass, showLabel: true)
                            Badge(type: .poison, showLabel: true)
                        }
                    }
                    
                    Spacer()
                    
                    Image("gen-I-grass-starter")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 130, height: 130)
                        .offset(x: 0, y: -20)
                }
                .padding(.leading, 20)
                .padding(.trailing, 10)
            }
            .offset(x: 0, y: 12)
        }
        .frame(width: 334, height: 140)
    }
}

struct PokemonListItem_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListItem()
    }
}

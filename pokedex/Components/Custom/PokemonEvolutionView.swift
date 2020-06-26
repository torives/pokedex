//
//  PokemonEvolutionView.swift
//  pokedex
//
//  Created by yves on 25/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct PokemonEvolutionView: View {
    let evolutionLevel: String
    
    var body: some View {
        HStack(spacing: 30) {
            PokemonEvolutionStageView(
                pokemonName: "Bulbassaur",
                pokemonNumber: "001",
                pokemonImage: Image("gen-I-grass-starter")
            )
            
            VStack(spacing: 5) {
                Image(systemName: "arrow.right")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .opacity(0.1)
                Text("(\(self.evolutionLevel))")
                    .pokemonNumberTextStyle()
            }
            .padding(.horizontal)
            
            PokemonEvolutionStageView(
                pokemonName: "Bulbassaur",
                pokemonNumber: "001",
                pokemonImage: Image("gen-I-grass-starter")
            )
        }
    }
}

struct PokemonEvolutionView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonEvolutionView(evolutionLevel: "Level 16")
    }
}

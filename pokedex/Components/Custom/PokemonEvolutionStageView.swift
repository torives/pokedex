//
//  PokemonEvolutionStageView.swift
//  pokedex
//
//  Created by yves on 25/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct PokemonEvolutionStageView: View {
    let pokemonName: String
    let pokemonNumber: String
    let pokemonImage: Image
    
    var body: some View {
        VStack {
            ZStack {
                Color.Gradients.pokeball
                    .mask(
                        Image("pokeball")
                            .resizable()
                            .scaledToFit()
                    )
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                
                self.pokemonImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
            }
            VStack {
                Text("#\(self.pokemonNumber)")
                    .pokemonTypeTextStyle()
                Text(self.pokemonName)
                    .filterTitleTextStyle()
            }
        }
    }
}

struct PokemonEvolutionStage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonEvolutionStageView(pokemonName: "Bulbassaur", pokemonNumber: "001", pokemonImage: Image("gen-I-grass-starter"))
    }
}

//
//  GenerationFilterView.swift
//  pokedex
//
//  Created by yves on 19/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct GenerationFilterView: View {
    @State private var isOn = false

    var body: some View {
        ScrollView {
            VStack {
                ViewHeader(title: "Generations", subtitle: "Use search for generations to explore your Pokémon!")
                HStack {
                    VStack {
                        PokemonGenerationToggle(generation: .I, isOn: self.$isOn)
                        PokemonGenerationToggle(generation: .III, isOn: self.$isOn)
                        PokemonGenerationToggle(generation: .V, isOn: self.$isOn)
                        PokemonGenerationToggle(generation: .VII, isOn: self.$isOn)
                    }
                    VStack {
                        PokemonGenerationToggle(generation: .II, isOn: self.$isOn)
                        PokemonGenerationToggle(generation: .IV, isOn: self.$isOn)
                        PokemonGenerationToggle(generation: .VI, isOn: self.$isOn)
                        PokemonGenerationToggle(generation: .VIII, isOn: self.$isOn)
                    }
                }
            }
        }
    }
}

struct GenerationFilterView_Previews: PreviewProvider {
    static var previews: some View {
        GenerationFilterView()
    }
}

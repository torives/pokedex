//
//  GenerationView.swift
//  pokedex
//
//  Created by yves on 19/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct GenerationView: View {
    @State private var isOn = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 35) {
                ViewHeader(
                    title: Strings.GenerationViewTitle,
                    subtitle: Strings.GenerationViewSubtitle
                )
                
                HStack(spacing: 14) {
                    VStack(spacing: 14) {
                        PokemonGenerationToggle(generation: .I, isOn: self.$isOn)
                        PokemonGenerationToggle(generation: .III, isOn: self.$isOn)
                        PokemonGenerationToggle(generation: .V, isOn: self.$isOn)
                        PokemonGenerationToggle(generation: .VII, isOn: self.$isOn)
                    }
                    VStack(spacing: 14) {
                        PokemonGenerationToggle(generation: .II, isOn: self.$isOn)
                        PokemonGenerationToggle(generation: .IV, isOn: self.$isOn)
                        PokemonGenerationToggle(generation: .VI, isOn: self.$isOn)
                        PokemonGenerationToggle(generation: .VIII, isOn: self.$isOn)
                    }
                }
                Spacer(minLength: 50)
            }
            .padding(.top, 30)
            .padding(.horizontal, 40)
        }
    }
}

struct GenerationFilterView_Previews: PreviewProvider {
    static var previews: some View {
        GenerationView()
    }
}

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
            VStack(alignment: .leading, spacing: bottomSheetItensVerticalSpacing) {
                ViewHeader(
                    title: Strings.generationViewTitle,
                    subtitle: Strings.generationViewSubtitle
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
            }
            .padding(.top, bottomSheetTopPadding)
            .padding(.bottom, bottomSheetBottomPadding)
            .padding(.horizontal, bottomSheetHorizontalPadding)
        }
    }
}

// MARK: -

struct GenerationFilterView_Previews: PreviewProvider {
    static var previews: some View {
        GenerationView()
    }
}

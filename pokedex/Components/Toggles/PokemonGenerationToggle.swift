//
//  PokemonGenerationToggle.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 25/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct PokemonGenerationToggleStyle: ToggleStyle {
    let generation: PokemonGeneration
    
    func makeBody(configuration: ToggleStyleConfiguration) -> some View {
        ZStack {
            DotPattern(isOn: configuration.isOn)
                .offset(x: -25, y: -35)
            Pokeball(isOn: configuration.isOn)
                .offset(x: 35, y: 62)
            VStack {
                StarterPokemons(generation: generation)
                    .padding([.leading, .trailing], 18)
                    .padding(.top, 16)
                Text("Generation \(generation.rawValue)")
                    .descriptionTextStyle()
                    .foregroundColor(configuration.isOn ? Color.Text.white : Color.Text.grey)
                    .padding(.top, 4)
            }
        }
        .frame(width: 160, height: 129)
        .background(configuration.isOn ? Color.Background.selectedInput : Color.Background.defaultInput)
        .clipped()
    }
    
    private struct DotPattern: View {
        let isOn: Bool
        private let dotPatternSize = CGSize(width: 80, height: 35)
        
        var body: some View {
            if isOn {
                return Color.Gradients.dotPatternWhite
                    .mask(Image("6x3").resizable().scaledToFit())
                    .frame(width: self.dotPatternSize.width, height: self.dotPatternSize.height)
            } else {
                return Color.Gradients.dotPatternGray
                    .mask(Image("6x3").resizable().scaledToFit())
                    .frame(width: self.dotPatternSize.width, height: self.dotPatternSize.height)
            }
        }
    }
    
    private struct Pokeball: View {
        let isOn: Bool
        private let pokeballSize = CGSize(width: 110, height: 110)
        
        var body: some View {
            if isOn {
                return Color.Gradients.pokeballWhite
                    .mask(Image("pokeball").resizable().scaledToFit())
                    .frame(width: self.pokeballSize.width, height: self.pokeballSize.height)
            } else {
                return Color.Gradients.pokeballGray
                    .mask(Image("pokeball").resizable().scaledToFit())
                    .frame(width: self.pokeballSize.width, height: self.pokeballSize.height)
            }
        }
    }
    
    private struct StarterPokemons: View {
        let generation: PokemonGeneration
        
        var body: some View {
            HStack(spacing: -5.0) {
                Image("gen-\(generation.rawValue)-grass-starter")
                    .resizable()
                    .frame(width: 45, height: 45)
                Image("gen-\(generation.rawValue)-fire-starter")
                    .resizable()
                    .frame(width: 45, height: 45)
                Image("gen-\(generation.rawValue)-water-starter")
                    .resizable()
                    .frame(width: 45, height: 45)
            }
        }
    }
}

struct PokemonGenerationToggle: View {
    let generation: PokemonGeneration
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text("Toggle")
        }
        .labelsHidden()
        .toggleStyle(PokemonGenerationToggleStyle(generation: generation))
    }
}

#if DEBUG
struct GenerationButton_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(PokemonGeneration.allCases) { generation in
                    HStack {
                        StatefulPreviewWrapper(false) {
                            PokemonGenerationToggle(generation: generation, isOn: $0)
                                .previewLayout(.fixed(width: 160, height: 129))
                        }
                        StatefulPreviewWrapper(true) {
                            PokemonGenerationToggle(generation: generation, isOn: $0)
                                .previewLayout(.fixed(width: 160, height: 129))
                        }
                    }
                }
            }
        }
    }
}
#endif

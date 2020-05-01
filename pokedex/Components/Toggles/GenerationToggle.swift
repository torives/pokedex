//
//  GenerationButton.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 25/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct GenerationToggleStyle: ToggleStyle {
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
                    .font(Font.custom("SFProDisplay-Regular", size: 16))
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
                return Gradients.dotPatternWhite
                    .mask(Image("6x3").resizable().scaledToFit())
                    .frame(width: self.dotPatternSize.width, height: self.dotPatternSize.height)
            } else {
                return Gradients.dotPatternGray
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
                return Gradients.pokeballWhite
                    .mask(Image("pokeball").resizable().scaledToFit())
                    .frame(width: self.pokeballSize.width, height: self.pokeballSize.height)
            } else {
                return Gradients.pokeballGray
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

struct GenerationToggle: View {
    let generation: PokemonGeneration
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text("Toggle")
        }
        .labelsHidden()
        .toggleStyle(GenerationToggleStyle(generation: generation))
    }
}

struct Gradients {
    static let dotPatternGray = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 0.899, green: 0.899, blue: 0.899, opacity: 1),
            Color(red: 0.961, green: 0.961, blue: 0.961, opacity: 0)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let dotPatternWhite = LinearGradient(gradient:
        Gradient(colors: [
            Color(red: 1, green: 1, blue: 1, opacity: 0.3),
            Color(red: 1, green: 1, blue: 1, opacity: 0)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let pokeballWhite = LinearGradient(gradient:
        Gradient(colors: [
            Color(red: 1, green: 1, blue: 1, opacity: 0.1),
            Color(red: 1, green: 1, blue: 1, opacity: 0)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let pokeballGray = LinearGradient(gradient:
        Gradient(colors: [
            Color(red: 0.925, green: 0.925, blue: 0.925, opacity: 1),
            Color(red: 0.961, green: 0.961, blue: 0.961, opacity: 1)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

#if DEBUG
struct GenerationButton_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(PokemonGeneration.allCases) { generation in
                    HStack {
                        StatefulPreviewWrapper(false) {
                            GenerationToggle(generation: generation, isOn: $0)
                                .previewLayout(.fixed(width: 160, height: 129))
                        }
                        StatefulPreviewWrapper(true) {
                            GenerationToggle(generation: generation, isOn: $0)
                                .previewLayout(.fixed(width: 160, height: 129))
                        }
                    }
                }
            }
        }
    }
}
#endif

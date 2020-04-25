//
//  GenerationButton.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 25/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct GenerationButton: View {
    var body: some View {
        ZStack {
            DotPattern()
            Pokeball()
        }
        .frame(width: 160, height: 129)
        .background(Theme.PokemonType.fighting)
    }
    
   private struct DotPattern: View {
        private let dotPatternSize = CGSize(width: 80, height: 35)
        
        var body: some View {
            GeometryReader { geometry in
                Gradients.vector_gray
                    .mask(
                        Image("6x3")
                            .resizable()
                            .frame(width: self.dotPatternSize.width, height: self.dotPatternSize.height)
                            .scaledToFit())
                    .offset(x: -(geometry.size.width/2 - 15) + self.dotPatternSize.width/2,
                            y: -(geometry.size.height/2 - 10) + self.dotPatternSize.height/2)
            }
        }
    }
    
    private struct Pokeball: View {
        private let pokeballSize = CGSize(width: 110, height: 110)
        
        var body: some View {
            GeometryReader { geometry in
                Gradients.vector_gray
                    .mask(
                        Image("pokeball")
                            .resizable()
                            .frame(width: self.pokeballSize.width, height: self.pokeballSize.height)
                            .scaledToFit())
                    .offset(x: -(geometry.size.width/2 - 60) + self.pokeballSize.width/2,
                            y: -(geometry.size.height/2 - 70) + self.pokeballSize.height/2)
            }
        }
    }
}

struct Gradients {
    static let vector_gray = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 255, green: 255, blue: 255, opacity: 0.3),
            Color(red: 255, green: 255, blue: 255, opacity: 0)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
}


#if DEBUG
struct GenerationButton_Previews: PreviewProvider {
    static var previews: some View {
        GenerationButton()
    }
}
#endif

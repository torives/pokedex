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
        .background(Color.from(type: .fighting))
    }
    
    private struct DotPattern: View {
        private let dotPatternSize = CGSize(width: 80, height: 35)
        
        var body: some View {
            Gradients.vectorGray
                .mask(
                    Image("6x3")
                        .resizable()
                        .frame(width: self.dotPatternSize.width, height: self.dotPatternSize.height)
                        .scaledToFit())
        }
    }
    
    private struct Pokeball: View {
        private let pokeballSize = CGSize(width: 110, height: 110)
        
        var body: some View {
            Gradients.vectorGray
                .mask(
                    Image("pokeball")
                        .resizable()
                        .frame(width: self.pokeballSize.width, height: self.pokeballSize.height)
                        .scaledToFit())
        }
    }
}

struct Gradients {
    static let vectorGray = LinearGradient(
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

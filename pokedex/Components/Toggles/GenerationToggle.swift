//
//  GenerationButton.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 25/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct GenerationToggle: View {
    var body: some View {
        ZStack {
            DotPattern()
                .offset(x: -25, y: -35)
            Pokeball()
                .offset(x: 35, y: 62)
            VStack {
                HStack(spacing: -5.0) {
                    Image("001")
                        .resizable()
                        .frame(width: 45, height: 45)
                    Image("004")
                        .resizable()
                        .frame(width: 45, height: 45)
                    Image("007")
                        .resizable()
                        .frame(width: 45, height: 45)
                }
                .padding([.leading, .trailing], 18)
                .padding(.top, 16)
                Text("Generation I")
                    .font(Font.custom("SFProDisplay-Regular", size: 16))
                    .foregroundColor(Color.Text.white)
                    .padding(.top, 4)
            }
        }
        .frame(width: 160, height: 129)
        .background(Color.Background.selectedInput)
    }
    
    private struct DotPattern: View {
        private let dotPatternSize = CGSize(width: 80, height: 35)
        
        var body: some View {
            Gradients.vectorGray
                .mask(Image("6x3").resizable().scaledToFit())
                .frame(width: self.dotPatternSize.width, height: self.dotPatternSize.height)
        }
    }
    
    private struct Pokeball: View {
        private let pokeballSize = CGSize(width: 110, height: 110)
        
        var body: some View {
            Gradients.vectorGray
                .mask(Image("pokeball").resizable().scaledToFit())
                .frame(width: self.pokeballSize.width, height: self.pokeballSize.height)
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
        GenerationToggle()
            .previewLayout(.fixed(width: 160, height: 129))
    }
}
#endif

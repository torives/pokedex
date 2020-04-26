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
            GeometryReader { parent in
                Image("6x3")
                    .resizable()
                    .aspectRatio(2.28, contentMode: .fit)
                    .frame(maxWidth: parent.size.width * 0.6)
                    .padding([.leading, .trailing], 15)
                    .padding(.top, 10)
                    .border(Color.yellow)
                
                Pokeball().border(Color.blue)
            }
        }.background(Color.yellow)
    }
}

private struct DotPattern: View {
    private let dotPatternSize = CGSize(width: 80, height: 35)
    
    var body: some View {
        Gradients.vector_gray
            .mask(
                Image("6x3").border(Color.pink)
                //                            .resizable()
                //                            .aspectRatio(2.28, contentMode: .fit)
        )
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
                        .aspectRatio(1, contentMode: .fit)
            )
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
        Group {
            GenerationButton().previewLayout(.fixed(width: 160, height: 129))
            GenerationButton()
            GenerationButton().previewLayout(.fixed(width: 568, height: 320))
        }
    }
}
#endif

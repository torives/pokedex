//
//  GenerationButton.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 25/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct GenerationButton: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        ZStack {
            GeometryReader { parent in
                VStack(spacing: parent.size.height * 0.1937) {
                    HStack {
                        DotPattern()
                            .frame(maxHeight: parent.size.height * 0.2913)
                            .border(Color.yellow)
                        Spacer()
                            .frame(minWidth: parent.size.width * 0.406)
                    }
                    .padding([.leading, .trailing], parent.size.width * 0.0937)
                    .padding(.top, parent.size.height * 0.0775)
                    HStack {
                        Spacer()
                            .frame(minWidth: parent.size.width * 0.375)
                        Pokeball()
                            .border(Color.blue)
                    }
                }
            }
        }.background(Color.black)
    }
}

//15*100/160 =
//10*100/160 = 6.25
//10*100/129 = 7.75%
//25*100/129 = 19.37%
//60*100/160 = 37,5%
//65*100/160 = 37,5%
//110*100/160 = 68,75%
private struct DotPattern: View {
    var body: some View {
        Gradients.vector_gray
            .mask(
                Image("6x3")
                    .resizable()
                    .aspectRatio(2.28, contentMode: .fit))
    }
}

private struct Pokeball: View {
    var body: some View {
        Gradients.vector_gray
            .mask(
                Image("pokeball")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit))
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
            GenerationButton().previewLayout(.fixed(width: 750, height: 1334))
            GenerationButton().previewLayout(.fixed(width: 1366, height: 1024))
        }
    }
}
#endif

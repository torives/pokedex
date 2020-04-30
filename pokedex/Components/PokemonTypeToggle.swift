//
//  ToggleButton.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 26/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

protocol CircleImageToggleStyle: ToggleStyle {
    var imageName: String { get }
    var imageColor: Color { get }
}

extension CircleImageToggleStyle {
    func makeBody(configuration: ToggleStyleConfiguration) -> some View {
        ZStack {
            if configuration.isOn {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(imageColor)
                    .shadow(color: imageColor.opacity(0.3), radius: 10, x: 0, y: 20)
            }
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(configuration.isOn ? Color.white : imageColor)
                .frame(width: 25, height: 25)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}


struct PokemonTypeToggleStyle: CircleImageToggleStyle {
    let type: PokemonType
    
    var imageName: String {
        "\(type.rawValue)-colored-icon"
    }
    
    var imageColor: Color {
        Color.from(type: type)
    }
}


struct PokemonTypeToggle: View {
    let type: PokemonType
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text("Toggle")
        }
        .labelsHidden()
        .toggleStyle(PokemonTypeToggleStyle(type: type))
    }
}


#if DEBUG
struct PokemonTypeToggle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatefulPreviewWrapper(false) {
                PokemonTypeToggle(type: .bug, isOn: $0)
                    .previewLayout(.fixed(width: 100, height: 100))
            }
            StatefulPreviewWrapper(true) {
                PokemonTypeToggle(type: .bug, isOn: $0)
                    .previewLayout(.fixed(width: 100, height: 100))
            }
        }
    }
}
#endif

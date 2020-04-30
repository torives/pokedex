//
//  ToggleButton.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 26/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI


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

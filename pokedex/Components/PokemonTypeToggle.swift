//
//  ToggleButton.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 26/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct PokemonTypeToggleStyle: ToggleStyle {
    var type: PokemonType
    
    func makeBody(configuration: ToggleStyleConfiguration) -> some View {
        Image(configuration.isOn ? "\(type.rawValue)-button-selected" : "\(type.rawValue)-button-unselected")
            .onTapGesture { configuration.isOn.toggle() }
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
        StatefulPreviewWrapper(false) {
            PokemonTypeToggle(type: .fighting, isOn: $0)
                .previewLayout(.fixed(width: 100, height: 100))
        }
    }
}
#endif

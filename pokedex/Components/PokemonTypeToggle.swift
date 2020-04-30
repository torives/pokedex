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
    @State var isOn = false
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text("Toggle")
        }
        .labelsHidden()
        .toggleStyle(PokemonTypeToggleStyle(type: .fighting))
    }
}


#if DEBUG
struct PokemonTypeToggle_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeToggle().previewLayout(.fixed(width: 100, height: 100))
    }
}
#endif


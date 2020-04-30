//
//  ToggleButton.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 26/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct PokemonTypeToggleStyle: ButtonStyle {
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        Circle()
    }
}


struct PokemonTypeToggle: View {
    @State var isOn = false
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text("Toggle")
        }
        .buttonStyle(PokemonTypeToggleStyle())
    }
}


#if DEBUG
struct PokemonTypeToggle_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeToggle().previewLayout(.fixed(width: 100, height: 100))
    }
}
#endif


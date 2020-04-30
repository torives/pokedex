//
//  ToggleButton.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 26/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct PokemonTypeToggleStyle: ToggleStyle {
    let type: PokemonType
    
    func makeBody(configuration: ToggleStyleConfiguration) -> some View {
        ZStack {
            if configuration.isOn {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.from(type: type))
                    .shadow(color: Color.from(type: type).opacity(0.3), radius: 10, x: 0, y: 20)
            }
            Image("\(type.rawValue)-colored-icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(configuration.isOn ? Color.white : Color.from(type: type))
                .frame(width: 25, height: 25)
                .onTapGesture { configuration.isOn.toggle() }
        }
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

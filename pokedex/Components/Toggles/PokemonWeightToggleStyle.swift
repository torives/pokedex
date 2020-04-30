//
//  PokemonWeightToggleStyle.swift
//  pokedex
//
//  Created by yves on 30/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct PokemonWeightToggleStyle: CircleImageToggleStyle {
    let weight: PokemonWeight
    
    var imageName: String {
        "weight-\(weight.rawValue)"
    }
    
    var imageColor: Color {
        Color.from(weight: weight)
    }
}

struct PokemonWeightToggle: View {
    let weight: PokemonWeight
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text("Toggle")
        }
        .labelsHidden()
        .toggleStyle(PokemonWeightToggleStyle(weight: weight))
    }
}

#if DEBUG
struct PokemonWeightToggle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatefulPreviewWrapper(false) {
                PokemonWeightToggle(weight: .light, isOn: $0)
                    .previewLayout(.fixed(width: 100, height: 100))
            }
            StatefulPreviewWrapper(true) {
                PokemonWeightToggle(weight: .normal, isOn: $0)
                    .previewLayout(.fixed(width: 100, height: 100))
            }
            StatefulPreviewWrapper(true) {
                PokemonWeightToggle(weight: .heavy, isOn: $0)
                    .previewLayout(.fixed(width: 100, height: 100))
            }
        }
    }
}
#endif

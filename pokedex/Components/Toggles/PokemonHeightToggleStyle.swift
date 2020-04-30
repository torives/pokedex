//
//  PokemonHeightToggleStyle.swift
//  pokedex
//
//  Created by yves on 30/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct PokemonHeightToggleStyle: CircleImageToggleStyle {
    let height: PokemonHeight
    
    var imageName: String {
        "height-\(height.rawValue)"
    }
    
    var imageColor: Color {
        Color.from(height: height)
    }
}

struct PokemonHeightToggle: View {
    let height: PokemonHeight
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text("Toggle")
        }
        .labelsHidden()
        .toggleStyle(PokemonHeightToggleStyle(height: height))
    }
}

#if DEBUG
struct PokemonHeightToggle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatefulPreviewWrapper(false) {
                PokemonHeightToggle(height: .short, isOn: $0)
                    .previewLayout(.fixed(width: 100, height: 100))
            }
            StatefulPreviewWrapper(true) {
                PokemonHeightToggle(height: .tall, isOn: $0)
                    .previewLayout(.fixed(width: 100, height: 100))
            }
        }
    }
}
#endif

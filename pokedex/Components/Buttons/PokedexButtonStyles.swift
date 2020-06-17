//
//  PokedexButtonStyles.swift
//  pokedex
//
//  Created by yves on 17/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

class PrimaryButtonStyle: ColoredBackgroundButtonStyle {
    let backgroundColor = Color.Background.selectedInput
    let labelColor = Color.Text.white
}

class SecondaryButtonStyle: ColoredBackgroundButtonStyle {
    let backgroundColor = Color.Background.defaultInput
    let labelColor = Color.Text.grey
}

struct PokedexButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8.0) {
            Button("Hello World") {}
                .buttonStyle(PrimaryButtonStyle())
            Button("Hello World") {}
                .buttonStyle(SecondaryButtonStyle())
        }
    }
}

//
//  ColoredBackgroundButtonStyle.swift
//  pokedex
//
//  Created by yves on 17/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct ColoredBackgroundButtonStyle: PrimitiveButtonStyle {
    
    let backgroundColor: Color
    let labelColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(self.labelColor)
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(self.backgroundColor)
            )
    }
}

struct ColoredBackgroundButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Hello World") {
            
        }.buttonStyle(ColoredBackgroundButtonStyle(backgroundColor: .blue, labelColor: .yellow))
    }
}

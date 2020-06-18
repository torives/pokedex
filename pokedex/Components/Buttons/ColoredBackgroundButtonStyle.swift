//
//  ColoredBackgroundButtonStyle.swift
//  pokedex
//
//  Created by yves on 17/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

protocol ColoredBackgroundButtonStyle: ButtonStyle {
    var backgroundColor: Color { get }
    var labelColor: Color { get }
}

extension ColoredBackgroundButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(self.backgroundColor)
            .overlay(
                configuration.label
                    .descriptionTextStyle()
                    .foregroundColor(self.labelColor)
            )
            .shadow(color: self.backgroundColor.opacity(0.3), radius: 10, x: 0, y: 10)
    }
}

struct ColoredBackgroundButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            Button("Hello World") {}
                .buttonStyle(PrimaryButtonStyle())
                .frame(width: 160, height: 60)
            
            Button("Hello World") {}
                .buttonStyle(SecondaryButtonStyle())
                .frame(width: 160, height: 60)
        }
    }
}

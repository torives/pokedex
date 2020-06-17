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
        configuration.label
            .descriptionTextStyle()
            .foregroundColor(self.labelColor)
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(self.backgroundColor)
        )
    }
}

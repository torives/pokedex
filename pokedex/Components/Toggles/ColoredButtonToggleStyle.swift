//
//  ColoredButtonToggleStyle.swift
//  pokedex
//
//  Created by yves on 24/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

//swiftlint:disable line_length
struct ColoredButtonToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(configuration.isOn ? Color.Background.selectedInput : Color.Background.defaultInput)
            .overlay(
                configuration.label
                    .descriptionTextStyle()
                    .foregroundColor(configuration.isOn ? Color.Text.white : Color.Text.grey)
            )
            .shadow(
                color: configuration.isOn ? Color.Background.selectedInput.opacity(0.3) : Color.Background.defaultInput.opacity(0.3),
                radius: 10, x: 0, y: 10
            )
            .frame(maxHeight: 60)
    }
}

struct ColoredButtonToggleStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            Toggle(isOn: .constant(true)) {
                Text("Hello World")
            }
            Toggle(isOn: .constant(false)) {
                Text("Hello World")
            }
        }
        .toggleStyle(ColoredButtonToggleStyle())
    }
}

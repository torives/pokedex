//
//  CircleImageToggleStyle.swift
//  pokedex
//
//  Created by yves on 30/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

protocol CircleImageToggleStyle: ToggleStyle {
    var imageName: String { get }
    var imageColor: Color { get }
}

extension CircleImageToggleStyle {
    func makeBody(configuration: ToggleStyleConfiguration) -> some View {
        ZStack {
            if configuration.isOn {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(imageColor)
                    .shadow(color: imageColor.opacity(0.3), radius: 10, x: 0, y: 20)
            }
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(configuration.isOn ? Color.white : imageColor)
                .frame(width: 25, height: 25)
                .onTapGesture { configuration.isOn.toggle() }

struct CircleImageToggleStyle_Previews: PreviewProvider {
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

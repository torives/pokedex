//
//  RangeSlider.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 03/05/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

//swiftlint:disable identifier_name
struct RangeSlider: View {
    private let maximumTrackHeight: CGFloat = 4.0
    private let accentColor: Color = Color.Background.selectedInput
    private let secondaryColor: Color = Color.Background.white
    private let thumbDiameter: CGFloat = 20
    @State private var leftThumbXPosition: CGFloat = 0
    @State private var rightThumbXPosition: CGFloat = 0
    @State private var superviewSize: CGSize = .zero
    
    var body: some View {
        Track(color: Color.Background.defaultInput)
            .frame(maxHeight: self.maximumTrackHeight)
            .overlay(
                GeometryReader { geometry in
                     Track(color: self.accentColor)
                        .frame(maxWidth: self.rightThumbXPosition.isZero ? CGFloat.greatestFiniteMagnitude : self.rightThumbXPosition)
                        .offset(x: self.leftThumbXPosition, y: 0)
                    SliderThumb(
                        accentColor: self.accentColor,
                        secondaryColor: self.secondaryColor,
                        handleDiameter: self.thumbDiameter)
                        .offset(x: -self.thumbDiameter/2, y: -8)
                    SliderThumb(
                        accentColor: self.accentColor,
                        secondaryColor: self.secondaryColor,
                        handleDiameter: self.thumbDiameter)
                        .offset(x: geometry.size.width - self.thumbDiameter/2, y: -8)
                }
        )
            .padding([.top, .bottom])
            .padding([.leading, .trailing], 8 + self.thumbDiameter/2)
    }
    
    private struct Track: View {
        let color: Color
        
        var body: some View {
            Rectangle()
                .fill(color)
                .cornerRadius(2)
        }
    }
    
    private struct SliderThumb: View {
        let accentColor: Color
        let secondaryColor: Color
        let handleDiameter: CGFloat
        
        var body: some View {
            VStack {
                Circle()
                    .fill(accentColor)
                    .frame(width: handleDiameter, height: handleDiameter)
                    .overlay(
                        Circle()
                            .fill(secondaryColor)
                            .frame(width: handleDiameter - handleDiameter/2,
                                   height: handleDiameter - handleDiameter/2)
                )
                Text("78")
                    .pokemonTypeTextStyle()
                    .foregroundColor(Color.Text.grey)
            }.alignmentGuide(VerticalAlignment.center) { d in d[.top] + self.handleDiameter/2}
        }
    }
}

#if DEBUG
struct RangeSlider_Previews: PreviewProvider {
    static var previews: some View {
        RangeSlider()
        //.previewLayout(.fixed(width: 300, height: 75))
    }
}
#endif

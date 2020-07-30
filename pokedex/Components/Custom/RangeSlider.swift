//
//  RangeSlider.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 03/05/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

//TODO: passar as cores como objetos do ambiente
struct RangeSlider: View {
    let lineWidth: CGFloat = 4.0
    let accentColor: Color = Color.Background.selectedInput
    let secondaryColor: Color = Color.Background.white
    let thumbDiameter: CGFloat = 20
    let defaultPadding: CGFloat = 8
    
    @State private var leftSpacerLength = CGFloat.zero
    @State private var rightSpacerLength = CGFloat.zero
    @State private var minimalValue: Double = 0
    @State private var maximumValue: Double = 1.0
    
    @Binding var lowerBound: Double
    @Binding var upperBound: Double
    
    let maximumRange: ClosedRange<Double>
    
    public init(lowerBound: Binding<Double>, upperBound: Binding<Double>, in maximumRange: ClosedRange<Double>) {
        self._lowerBound = lowerBound
        self._upperBound = upperBound
        self.maximumRange = maximumRange
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 2, style: .circular)
                    .fill(Color.Background.defaultInput)
                    .padding(.horizontal, 10)
                    .frame(maxHeight: self.lineWidth)
                
                HStack(spacing: 0.0) {
                    Spacer(minLength: self.leftSpacerLength)
                    
                    Thumb(
                        accentColor: self.accentColor,
                        secondaryColor: self.secondaryColor,
                        diameter: self.thumbDiameter
                    )
                    .zIndex(1)
                    
                    RoundedRectangle(cornerRadius: 2, style: .circular)
                        .fill(self.accentColor)
                        .frame(maxHeight: self.lineWidth)
                        .padding(.horizontal, -10)
                        .zIndex(0)
                    
                    Thumb(
                        accentColor: self.accentColor,
                        secondaryColor: self.secondaryColor,
                        diameter: self.thumbDiameter
                    )
                    .zIndex(1)
                    
                    Spacer(minLength: self.rightSpacerLength)
                }
            }
        }
        .padding([.all], defaultPadding)
    }
    
    private struct Thumb: View {
        let accentColor: Color
        let secondaryColor: Color
        let diameter: CGFloat
        
        var body: some View {
            Circle()
                .fill(accentColor)
                .frame(width: diameter, height: diameter)
                .overlay(
                    Circle()
                        .fill(secondaryColor)
                        .frame(width: diameter - diameter/2, height: diameter - diameter/2)
                )
        }
    }
}

#if DEBUG
struct RangeSlider_Previews: PreviewProvider {
    static var previews: some View {
        RangeSlider(lowerBound: .constant(1.0), upperBound: .constant(890.0), in: 1.0...890.0)
            .previewLayout(.fixed(width: 500, height: 40))
    }
}
#endif

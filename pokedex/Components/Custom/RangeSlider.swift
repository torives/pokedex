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
    
    @State var leftSpacerLength = CGFloat.zero
    @State var rightSpacerLength = CGFloat.zero
    
    @Binding var lowerValue: Int
    @Binding var upperValue: Int
    
    let bounds: ClosedRange<Int>
    
    public init(selectedLowerBound: Binding<Int>, selectedUpperBound: Binding<Int>, in bounds: ClosedRange<Int>) {
        self._lowerValue = selectedLowerBound
        self._upperValue = selectedUpperBound
        self.bounds = bounds
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
    
    @State static var lowerValue = 1
    @State static var upperValue = 890
    
    static var previews: some View {
        RangeSlider(selectedLowerBound: $lowerValue, selectedUpperBound: $upperValue, in: lowerValue...upperValue)
            .previewLayout(.fixed(width: 500, height: 40))
    }
}
#endif

//
//  RangeSlider.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 03/05/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct RangeSlider: View {
    let lineWidth: CGFloat = 4.0
    let accentColor: Color = Color.Background.selectedInput
    let secondaryColor: Color = Color.Background.white
    let thumbDiameter: CGFloat = 20
    let spacerMinLength: CGFloat = 0
    @State var leftSpacerLength: CGFloat = 100
    @State var rightSpacerLength: CGFloat = 100
    
    var body: some View {
        ZStack {
            Track(color: Color.Background.defaultInput)
                .frame(maxHeight: lineWidth)
            HStack(spacing: 0.0) {
                Spacer(minLength: leftSpacerLength)
                Track(color: accentColor)
                    .frame(maxHeight: lineWidth)
                Spacer(minLength: rightSpacerLength)
            }
            HStack {
                Spacer()
                Thumb(
                    accentColor: accentColor,
                    secondaryColor: secondaryColor,
                    diameter: thumbDiameter).border(Color.green)
                Spacer().frame(width: -thumbDiameter/2 + rightSpacerLength)
            }.border(Color.red)
            HStack {
                Spacer().frame(width: -thumbDiameter/2 + leftSpacerLength)
                Thumb(
                    accentColor: accentColor,
                    secondaryColor: secondaryColor,
                    diameter: thumbDiameter).border(Color.green)
                Spacer()
            }.border(Color.purple)
        }.padding()
    }
    
    private struct Track: View {
        let color: Color
        
        var body: some View {
            Rectangle()
                .fill(color)
                .cornerRadius(2)
        }
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
        RangeSlider()
    }
}
#endif

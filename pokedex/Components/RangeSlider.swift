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
    let circleRadius: CGFloat = 20
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.Background.defaultInput)
                .frame(maxHeight: lineWidth)
                .cornerRadius(2)
            Rectangle()
                .fill(accentColor)
                .frame(maxWidth: 150, maxHeight: lineWidth)
                .cornerRadius(2)
            SliderHandle(
                accentColor: accentColor,
                secondaryColor: secondaryColor,
                circleRadius: circleRadius
            )
        }.padding()
    }
    
    private struct SliderHandle: View {
        let accentColor: Color
        let secondaryColor: Color
        let circleRadius: CGFloat
        
        var body: some View {
            Circle()
                .fill(accentColor)
                .frame(width: circleRadius, height: circleRadius)
                .overlay(
                    Circle()
                        .fill(secondaryColor)
                        .frame(width: circleRadius - circleRadius/2, height: circleRadius - circleRadius/2)
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

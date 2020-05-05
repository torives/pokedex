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
            Track(color: Color.Background.defaultInput)
                .frame(maxHeight: lineWidth)
            Track(color: accentColor)
                .frame(maxHeight: lineWidth)
            SliderHandle(
                accentColor: accentColor,
                secondaryColor: secondaryColor,
                circleRadius: circleRadius
            )
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

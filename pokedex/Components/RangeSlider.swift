//
//  RangeSlider.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 03/05/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct RangeSlider: View {
    private let lineWidth: CGFloat = 4.0
    private let accentColor: Color = Color.Background.selectedInput
    private let secondaryColor: Color = Color.Background.white
    private let handleDiameter: CGFloat = 20
    @State private var handlerXPosition: CGFloat = 0
    @State private var superviewSize: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(Color.Background.defaultInput)
                    .frame(maxHeight: self.lineWidth)
                    .cornerRadius(2)
                Rectangle()
                    .fill(self.accentColor)
                    .frame(maxHeight: self.lineWidth)
                    .cornerRadius(2)
                    .overlay(
                        GeometryReader { geometry in
                            SliderHandle(
                                accentColor: self.accentColor,
                                secondaryColor: self.secondaryColor,
                                handleDiameter: self.handleDiameter)
                            .offset(x: -self.handleDiameter/2, y: -8)
                            SliderHandle(
                                accentColor: self.accentColor,
                                secondaryColor: self.secondaryColor,
                                handleDiameter: self.handleDiameter)
                                .offset(
                                    x: self.handlerXPosition.isZero ? geometry.size.width - self.handleDiameter/2 : self.handlerXPosition,
                                    y: -8)
                                .gesture(DragGesture(minimumDistance: 1, coordinateSpace: .local)
                                    .onChanged { value in
                                        print("Size \(geometry.size.width)")
                                        print(value.location.x)
                                        guard value.location.x >= -self.handleDiameter/2,
                                            value.location.x <= (geometry.size.width - self.handleDiameter/2) else {
                                            return
                                        }
                                        self.handlerXPosition = value.location.x
                                })
//                                }).alignmentGuide(VerticalAlignment.center, computeValue: { _ in
//                                    self.handleDiameter/2
//                                })
                        }
                    )
            }
            .padding([.top, .bottom])
            .padding([.leading, .trailing], 8 + self.handleDiameter/2)
        }
    }
    
    private struct SliderHandle: View {
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
            }
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

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
    @State private var maxTrackWidth = CGFloat.zero
    @State private var trackXOffset = CGFloat.zero
    @State private var leftThumbXPosition: CGFloat = 0
    @State private var rightThumbXPosition: CGFloat = 0
    @State private var superviewSize: CGSize = .zero
    
    var body: some View {
        Track(color: Color.Background.defaultInput)
            .frame(maxHeight: self.maximumTrackHeight)
            .overlay(
                GeometryReader { geometry in
                     Track(color: self.accentColor)
                        .frame(maxWidth: self.maxTrackWidth(with: geometry.size))
                        .offset(x: self.trackXOffset, y: 0)
                    SliderThumb(
                        accentColor: self.accentColor,
                        secondaryColor: self.secondaryColor,
                        handleDiameter: self.thumbDiameter)
                        .offset(x: self.leftTumbXOffset(parentSize: geometry.size), y: -8)
                        .gesture(DragGesture(minimumDistance: 1, coordinateSpace: .local)
                            .onChanged { value in
                                print("Size \(geometry.size.width)")
                                print(value.location.x)
                                self.onLeftThumbUpdate(newX: value.location.x, oldSize: geometry.size)
                        })
                    SliderThumb(
                        accentColor: self.accentColor,
                        secondaryColor: self.secondaryColor,
                        handleDiameter: self.thumbDiameter)
                        .offset(x: self.rightTumbXOffset(parentSize: geometry.size), y: -8)
                        .gesture(DragGesture(minimumDistance: 1, coordinateSpace: .local)
                            .onChanged { value in
                                print("Size \(geometry.size.width)")
                                print(value.location.x)
                                self.onRightThumbUpdate(newX: value.location.x)
                        })
                }
        )
            .padding([.top, .bottom])
            .padding([.leading, .trailing], 8 + self.thumbDiameter/2)
    }
    
    private func maxTrackWidth(with size: CGSize) -> CGFloat {
        if self.maxTrackWidth.isZero {
            self.maxTrackWidth = size.width
        }
        return self.maxTrackWidth
    }
    
    private func onLeftThumbUpdate(newX: CGFloat, oldSize: CGSize) {
        self.maxTrackWidth = self.rightThumbXPosition.isZero ?
            oldSize.width - newX : self.rightThumbXPosition - newX
        self.trackXOffset = newX
        self.leftThumbXPosition = newX
    }
    
    //FIXME: newX é posicionamento e maxTrackWidth é tamanho, não dá pra comparar direto
    private func onRightThumbUpdate(newX: CGFloat) {
        self.maxTrackWidth = min(self.maxTrackWidth, newX)
//        self.trackXOffset = newX
        self.rightThumbXPosition = newX
    }
    
    private func rightTumbXOffset(parentSize: CGSize) -> CGFloat {
        if self.rightThumbXPosition.isZero {
            return parentSize.width - self.thumbDiameter/2
        } else {
            return self.rightThumbXPosition - self.thumbDiameter/2
        }
    }
    
    private func leftTumbXOffset(parentSize: CGSize) -> CGFloat {
        if self.leftThumbXPosition.isZero {
            return -self.thumbDiameter/2
        } else {
            return self.leftThumbXPosition - self.thumbDiameter/2
        }
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

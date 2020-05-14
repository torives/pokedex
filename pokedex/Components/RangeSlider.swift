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
    @State var leftSpacerLength = CGFloat.zero
    @State var rightSpacerLength = CGFloat.zero
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Track(color: Color.Background.defaultInput)
                    .frame(maxHeight: self.lineWidth)
                HStack(spacing: 0.0) {
                    Spacer(minLength: self.leftSpacerLength)
                    
                    Thumb(
                        accentColor: self.accentColor,
                        secondaryColor: self.secondaryColor,
                        diameter: self.thumbDiameter
                    )
                    .gesture(
                        DragGesture(
                            minimumDistance: 1,
                            coordinateSpace: .local
                        )
                        .onChanged { value in
                            print("Translado: \(value.translation.width)")
                            let displacement = value.translation.width
                            
                            if displacement.isLess(than: 0) {
                                self.leftSpacerLength = max(self.leftSpacerLength + displacement, 0)
                                print("Diminuiu para: \(self.leftSpacerLength)")
                            } else {
                                self.leftSpacerLength = min(
                                    self.leftSpacerLength + displacement,
                                    (geometry.size.width - self.rightSpacerLength) - (self.thumbDiameter + 60)
                                )
                                print("Cresceu para: \(self.leftSpacerLength)")
                            }
                        }
                    )
                    .zIndex(1)
                    
                    Track(color: self.accentColor)
                        .frame(maxHeight: self.lineWidth)
                        .padding(.horizontal, -10)
                        .zIndex(0)
                    
                    Thumb(
                        accentColor: self.accentColor,
                        secondaryColor: self.secondaryColor,
                        diameter: self.thumbDiameter
                    )
                    .gesture(
                        DragGesture(
                            minimumDistance: 1,
                            coordinateSpace: .local
                        )
                        .onChanged { value in
                            print("Translado: \(value.translation.width)")
                            let displacement = value.translation.width
                            
                            if displacement.isLess(than: 0) {
                                self.rightSpacerLength = min(
                                    self.rightSpacerLength + -displacement,
                                    (geometry.size.width - self.leftSpacerLength) - (self.thumbDiameter + 60)
                                )
                                print("Diminuiu para: \(self.leftSpacerLength)")
                            } else {
                                self.rightSpacerLength = max(self.rightSpacerLength - displacement, 0)
                                print("Cresceu para: \(self.leftSpacerLength)")
                            }
                        }
                    )
                    .zIndex(1)
                    
                    Spacer(minLength: self.rightSpacerLength)
                }
            }.padding()
        }.scaledToFit()
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

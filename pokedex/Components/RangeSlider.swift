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
    
    @Binding var leftValue: Int
    @Binding var rightValue: Int
    
    let bounds: ClosedRange<Int>
    let step: Int
    
    public init(selectedLowerBound: Binding<Int>, selectedUpperBound: Binding<Int>, in bounds: ClosedRange<Int>, step: Int = 1) {
        self._leftValue = selectedLowerBound
        self._rightValue = selectedUpperBound
        self.bounds = bounds
        self.step = step
    }
    
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
                        .onChanged { gesture in
                            print("Translado: \(gesture.translation.width)")
                            let displacement = gesture.translation.width
                            let trackWidth = geometry.size.width - self.defaultPadding - self.thumbDiameter/2
                            
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

                            let leftThumbMiddle = max(0, self.leftSpacerLength)// + self.thumbDiameter/2)
                            let percentage = Float(leftThumbMiddle/geometry.size.width)
                            self.leftValue = max(self.bounds.lowerBound, Int(roundf(Float(self.bounds.upperBound) * percentage)))
                            
                            print("\ntrackSize: \(trackWidth)")
                            print("width: \(geometry.size.width)")
                            print("middle: \(leftThumbMiddle)")
                            print("percentage: \(percentage)")
                            print("leftValue: \(self.leftValue)")
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
//                            print("Translado: \(value.translation.width)")
                            let displacement = value.translation.width
                            
                            if displacement.isLess(than: 0) {
                                self.rightSpacerLength = min(
                                    self.rightSpacerLength + -displacement,
                                    (geometry.size.width - self.leftSpacerLength) - (self.thumbDiameter + 60)
                                )
//                                print("Diminuiu para: \(self.leftSpacerLength)")
                            } else {
                                self.rightSpacerLength = max(self.rightSpacerLength - displacement, 0)
//                                print("Cresceu para: \(self.leftSpacerLength)")
                            }
                        }
                    )
                    .zIndex(1)
                    
                    Spacer(minLength: self.rightSpacerLength)
                }
            }
        }
        .padding([.all], defaultPadding)
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
    
    @State static var leftValue = 1
    @State static var rightValue = 890
    
    static var previews: some View {
        RangeSlider(selectedLowerBound: $leftValue, selectedUpperBound: $rightValue, in: leftValue...rightValue)
            .previewLayout(.fixed(width: 500, height: 300))
    }
}
#endif

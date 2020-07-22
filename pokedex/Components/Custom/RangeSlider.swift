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
    let minimumSpaceBetweenThumbs: CGFloat
    
    @State var leftSpacerLength = CGFloat.zero
    @State var rightSpacerLength = CGFloat.zero
    
    @Binding var lowerValue: Int
    @Binding var upperValue: Int
    
    let bounds: ClosedRange<Int>
    let step: Int
    
    public init(selectedLowerBound: Binding<Int>, selectedUpperBound: Binding<Int>, in bounds: ClosedRange<Int>, step: Int = 1) {
        self._lowerValue = selectedLowerBound
        self._upperValue = selectedUpperBound
        self.bounds = bounds
        self.step = step
        
        minimumSpaceBetweenThumbs = self.thumbDiameter + self.defaultPadding * 2
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
                    .gesture(
                        DragGesture().onChanged { gesture in
                            let trackWidth = geometry.size.width - self.defaultPadding - self.thumbDiameter/2
                            
                            print("Left Translation: \(gesture.translation.width)")
                            print("Left Location: \(gesture.location.x)")
                            print("Left Start Location: \(gesture.startLocation.x)")
                            
                            self.updateLeftThumbPosition(with: gesture.translation.width, trackWidth: trackWidth)
                        }
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
                    .gesture(
                        DragGesture().onChanged { gesture in
                            let trackWidth = geometry.size.width - self.defaultPadding - self.thumbDiameter/2
                            
                            print("Right Translation: \(gesture.translation.width)")
                            print("Right Location: \(gesture.location.x)")
                            print("Right Start Location: \(gesture.startLocation.x)")
                               
                            self.updateRightThumbPosition(with: gesture.translation.width, trackWidth: trackWidth)
                        }
                    )
                    .zIndex(1)
                    
                    Spacer(minLength: self.rightSpacerLength)
                }
            }
        }
        .padding([.all], defaultPadding)
    }
    
    private func updateLeftThumbPosition(with xTranslation: CGFloat, trackWidth: CGFloat) {
        let newLenght = self.leftSpacerLength + xTranslation
        let maxLenght = (trackWidth - self.rightSpacerLength) - (self.minimumSpaceBetweenThumbs)
        
        if xTranslation.isLess(than: 0) {
            self.leftSpacerLength = max(0, newLenght)
        } else {
            self.leftSpacerLength = min(newLenght, maxLenght)
        }
    }
    
    private func updateRightThumbPosition(with xTranslation: CGFloat, trackWidth: CGFloat) {
        if xTranslation.isLess(than: 0) {
            self.rightSpacerLength = min(
                self.rightSpacerLength + -xTranslation,
                (trackWidth - self.leftSpacerLength) - (self.thumbDiameter + 60)
            )
        } else {
            self.rightSpacerLength = max(self.rightSpacerLength - xTranslation, 0)
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
    
    @State static var lowerValue = 1
    @State static var upperValue = 890
    
    static var previews: some View {
        RangeSlider(selectedLowerBound: $lowerValue, selectedUpperBound: $upperValue, in: lowerValue...upperValue)
            .previewLayout(.fixed(width: 500, height: 300))
    }
}
#endif

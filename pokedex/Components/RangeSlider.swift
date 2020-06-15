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
                Track(color: Color.Background.defaultInput)
                    .frame(maxHeight: self.lineWidth)
               
                HStack(spacing: 0.0) {
                    self.generateLeftSpacer(with: geometry.size.width)
                    
                    Thumb(
                        accentColor: self.accentColor,
                        secondaryColor: self.secondaryColor,
                        diameter: self.thumbDiameter
                    )
                    .gesture(
                        DragGesture(
                       
                        )
                        .onChanged { gesture in
                            let trackWidth = geometry.size.width - self.defaultPadding - self.thumbDiameter/2
                            self.updateLeftThumbPosition(with: gesture.translation.width, trackWidth: trackWidth)
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
    
    private func generateLeftSpacer(with parentWidth: CGFloat) -> some View {
        let trackWidth = parentWidth - self.defaultPadding - self.thumbDiameter/2
//        self.lowerValue
//        self.upperValue
        
        
        let lenght = 0
        
        
        return Spacer(minLength: self.leftSpacerLength)
    }
    
    private func updateLeftThumbPosition(with xTranslation: CGFloat, trackWidth: CGFloat) {
        let newLenght = self.leftSpacerLength + xTranslation
        let maxLenght = (trackWidth - self.rightSpacerLength) - (self.minimumSpaceBetweenThumbs)
        
        if xTranslation.isLess(than: 0) {
            self.leftSpacerLength = max(0, newLenght)
        } else {
            self.leftSpacerLength = min(newLenght, maxLenght)
        }
        
        let leftThumbCenter = max(0, self.leftSpacerLength + self.thumbDiameter/2)
        let percentage = Float(leftThumbCenter/trackWidth)
               
        updateLowerValue(by: percentage)
        
        print("\nTrackSize: \(trackWidth)")
        print("Left thumb position: \(leftThumbCenter)")
        print("percentage: \(percentage)")
        print("leftValue: \(self.lowerValue)")
    }
    
    private func updateLowerValue(by percentage: Float) {
        let newLowerValue = Int(Float(self.bounds.upperBound) * percentage)
        
        self.lowerValue = max(self.bounds.lowerBound, newLowerValue)
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
    
    @State static var lowerValue = 1
    @State static var upperValue = 890
    
    static var previews: some View {
        RangeSlider(selectedLowerBound: $lowerValue, selectedUpperBound: $upperValue, in: lowerValue...upperValue)
            .previewLayout(.fixed(width: 500, height: 300))
    }
}
#endif

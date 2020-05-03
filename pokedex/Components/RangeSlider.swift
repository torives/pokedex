//
//  RangeSlider.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 03/05/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI


//swiftlint:disable identifier_name
extension VerticalAlignment {
    private enum MyVerticalAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[VerticalAlignment.center]
        }
    }
    
    static let myVerticalAlignment = VerticalAlignment(MyVerticalAlignment.self)
}

extension HorizontalAlignment {
    private enum MyHorizontalAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[HorizontalAlignment.leading]
        }
    }
    
    static let myHorizontalAlignment = HorizontalAlignment(MyHorizontalAlignment.self)
}

extension Alignment {
    static let myAlignment = Alignment(horizontal: .myHorizontalAlignment, vertical: .myVerticalAlignment)
}

struct RangeSlider: View {
    @State var value: ClosedRange<Double> = 0...1
    
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
            ZStack(alignment: .myAlignment) {
                Rectangle()
                    .fill(accentColor)
                    .frame(maxWidth: 150, maxHeight: lineWidth)
                    .cornerRadius(2)
                SliderHandle(
                    accentColor: accentColor,
                    secondaryColor: secondaryColor,
                    circleRadius: circleRadius
                ).alignmentGuide(.myHorizontalAlignment) { d in d[.center] }
                SliderHandle(
                    accentColor: secondaryColor,
                    secondaryColor: accentColor,
                    circleRadius: circleRadius
                ).alignmentGuide(.myHorizontalAlignment) { d in d[.trailing] }
            }.alignmentGuide(VerticalAlignment.center, computeValue: { _ in
                self.circleRadius/2
            })
        }.padding()
    }
    
    private struct SliderHandle: View {
        let accentColor: Color
        let secondaryColor: Color
        let circleRadius: CGFloat
        
        var body: some View {
            VStack {
                Circle()
                    .fill(accentColor)
                    .frame(width: circleRadius, height: circleRadius)
                    .overlay(
                        Circle()
                            .fill(secondaryColor)
                            .frame(width: circleRadius - circleRadius/2, height: circleRadius - circleRadius/2)
                )
                Text("78")
            }.alignmentGuide(VerticalAlignment.center, computeValue: { _ in
                self.circleRadius/2
            })
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

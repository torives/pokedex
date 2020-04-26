//
//  GenerationButton.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 25/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct GenerationButton: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        ZStack {
            GeometryReader { parent in
                
                    HStack {
                        VStack {
                            DotPattern()
                                .border(Color.yellow)
                            Spacer()
                                .frame(minHeight: parent.size.height * 0.1937)
                        }
                        .padding(.leading, parent.size.width * 0.0937)
                        .padding(.top, parent.size.height * 0.0775)
                        .border(Color.red)
                        
                        Spacer()
                            .frame(minWidth: parent.size.width * 0.4)
                    }
                    
                    HStack {
                        Spacer()
                            .frame(minWidth: parent.size.width * 0.312)
                        
                        VStack {
//                            Spacer()
//                                .frame(minWidth: parent.size.width * 0.375)
                            Pokeball()
                                .offset(x: parent.size.width * 0.0625, y: parent.size.height/2.1)
                                .border(Color.blue)
                        }
                    }
                
            }
        }.background(Color.black)
    }
}

//15*100/160 = 9,375%
//10*100/160 = 6.25
//10*100/129 = 7.75%
//25*100/129 = 19.37%
//50*100/160 = 31,25%
//60*100/160 = 37,5%
//65*100/160 = 37,5%
//95*100/160 = 59,375%
//110*100/160 = 68,75%
private struct DotPattern: View {
    var body: some View {
        Gradients.vector_gray
            .mask(
                Image("6x3")
                    .resizable()
                    .aspectRatio(2.28, contentMode: .fit))
    }
}

private struct Pokeball: View {
    var body: some View {
        Gradients.vector_gray
            .mask(
                Image("pokeball")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit))
    }
    
    func calculateFrame(_ parent: CGSize) -> some View {
        var maxWidth = CGFloat.zero
        
        if(parent.width > parent.height) {
            maxWidth = parent.height * 0.6875
        } else {
            maxWidth = parent.width * 0.6875
        }
        return self.frame(maxWidth: maxWidth, maxHeight: maxWidth)
    }
}

struct Gradients {
    static let vector_gray = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 255, green: 255, blue: 255, opacity: 0.3),
            Color(red: 255, green: 255, blue: 255, opacity: 0)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
}


#if DEBUG
struct GenerationButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GenerationButton().previewLayout(.fixed(width: 160, height: 129))
            GenerationButton().previewLayout(.fixed(width: 750, height: 1334))
            GenerationButton().previewLayout(.fixed(width: 1366, height: 1024))
        }
    }
}
#endif

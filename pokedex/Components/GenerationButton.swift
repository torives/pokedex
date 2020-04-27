//
//  GenerationButton.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 25/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct GenerationButton: View {
    var body: some View {
        ZStack {
            GeometryReader { parent in
                    HStack {
                        VStack {
                            DotPattern()
                            Spacer().frame(minHeight: parent.size.height * 0.193)
                        }
                        .padding(.leading, parent.size.width * 0.0937)
                        .padding(.top, parent.size.height * 0.0775)
                        
                        Spacer().frame(minWidth: parent.size.width * 0.4)
                    }
                    
                    HStack {
                        Spacer().frame(minWidth: parent.size.width * 0.312)
                        VStack {
                            Pokeball().offset(x: parent.size.width * 0.0625, y: parent.size.height/2.1)
                        }
                    }
            }
            GeometryReader { parent in
                VStack {
                    HStack {
                        Image("001").resizable().aspectRatio(1, contentMode: .fit)
                        Image("004").resizable().aspectRatio(1, contentMode: .fit)
                        Image("007").resizable().aspectRatio(1, contentMode: .fit)
                    }
                    .padding([.leading, .trailing], parent.size.width * 0.112)
                    Text("Generation VIII")
                        .font(Font.custom("SFProDisplay-Regular", size: 16))
                        .foregroundColor(Theme.Text.grey)
                }
            }
        }.background(Theme.Background.selected_input)
    }
}

//15*100/160 = 9,375%
// 18*100/160 = 11,25%
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
    static let vector_white = LinearGradient(gradient:
        Gradient(colors: [
            Color(red: 1, green: 1, blue: 1, opacity: 1),
            Color(red: 1, green: 1, blue: 1, opacity: 0)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let vector_gray = LinearGradient(gradient:
        Gradient(colors: [
            Color(red: 0.899, green: 0.899, blue: 0.899, opacity: 1),
            Color(red: 0.961, green: 0.961, blue: 0.961, opacity: 0)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
}


#if DEBUG
struct GenerationButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GenerationButton().previewLayout(.fixed(width: 160, height: 129))
//            GenerationButton().previewLayout(.fixed(width: 1366, height: 1024))
//            GenerationButton().previewLayout(.fixed(width: 750, height: 1334))
        }
    }
}
#endif

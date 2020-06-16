//
//  BottomSheetView.swift
//  pokedex
//
//  Created by yves on 15/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct BottomSheetView<Content: View>: View {
    @Binding private var isPresented: Bool
    @State private var isExtended: Bool = false
    @GestureState private var translation: CGFloat = 0
    
    private let maxHeight = UIScreen.main.bounds.height
    private let minHeight: CGFloat
    private let content: Content
    
    private var offset: CGFloat {
        isExtended ? 0 : maxHeight - minHeight
    }
    
    private var indicator: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.secondary)
            .frame(width: 80, height: 6)
    }
    
    init(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._isPresented = isPresented
        self.minHeight = maxHeight * 0.5
        self.content = content()
    }
    
    var body: some View {
        let dragGesture =  DragGesture().updating(self.$translation) { value, state, _ in
            state = value.translation.height
        }.onEnded { value in
            let snapDistance = self.maxHeight * 0.20
            let dismissDistance = self.maxHeight * 0.35
                       
            guard abs(value.translation.height) > snapDistance else {
                return
            }
            
            if self.isExtended {
                if value.translation.height > 0 {
                    if value.translation.height > dismissDistance {
                        self.isPresented = false
                    } else {
                        self.isExtended = false
                    }
                }
            } else {
                if value.translation.height < 0 {
                    self.isExtended = true
                } else {
                    self.isPresented = false
                }
            }
        }
        
        return GeometryReader { geometry in
            VStack(spacing: 0) {
                self.indicator
                    .padding(.bottom, 6)
                    .padding(.top, self.maxHeight * 0.05)
                self.content
                    .cornerRadius(25, corners: [.topLeft, .topRight])
            }
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: max(self.offset + self.translation, 0))
            .animation(.interactiveSpring())
            .gesture(dragGesture)
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(isPresented: .constant(false)) {
            Rectangle().fill(Color.red)
        }
    }
}

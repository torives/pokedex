//
//  View+Ext.swift
//  pokedex
//
//  Created by yves on 15/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(
            RoundedCorner(radius: radius, corners: corners)
        )
    }
    
    func bottomSheet<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) -> some View {
        return ZStack {
            self
            if(isPresented.wrappedValue) {
                BottomSheetView(isPresented: isPresented, content: content)
            } else {
                EmptyView()
            }
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        Path(
            UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            ).cgPath
        )
    }
}

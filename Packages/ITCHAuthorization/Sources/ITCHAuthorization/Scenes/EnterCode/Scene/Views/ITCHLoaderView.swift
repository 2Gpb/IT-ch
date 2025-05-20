//
//  ITCHLoaderView.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import SwiftUI
import ITCHUIComponents

public struct ITCHLoaderView: View {
    // MARK: - Constants
    private enum Constant {
        static let duration = 0.8
        static let circleSize = 24.0
        static let lineWidth = 3.0
        static let innerColor: Color = ITCHColor.blue60.swiftUIColor.opacity(0.3)
        static let filledColor: Color = ITCHColor.blue60.swiftUIColor
        static let startPosition = 0.0
        static let endPosition = 360.0
        static let trimFrom = 0.0
        static let trimTo = 0.2
    }
    
    // MARK: - Properties
    @State private var isAnimating: Bool = false
    
    // MARK: - Body
    public var body: some View {
        ZStack {
            innerCircle
            filledCircle
        }
        .onAppear {
            withAnimation(
                Animation
                .linear(duration: Constant.duration)
                .repeatForever(autoreverses: false)
            ) {
                self.isAnimating = true
            }
        }
    }
    
    // MARK: - Subviews
    private var innerCircle: some View {
        Circle()
            .stroke(Constant.innerColor, lineWidth: Constant.lineWidth)
            .frame(width: Constant.circleSize, height: Constant.circleSize)
    }
    
    private var filledCircle: some View {
        Circle()
            .trim(from: Constant.trimFrom, to: Constant.trimTo)
            .stroke(
                Constant.filledColor, style: StrokeStyle(
                    lineWidth: Constant.lineWidth,
                    lineCap: .round
                )
            )
            .frame(width: Constant.circleSize, height: Constant.circleSize)
            .rotationEffect(.degrees(isAnimating ? Constant.endPosition : Constant.startPosition))
    }
    
    // MARK: - Lifecycle
    public init () { }
}

// MARK: - Preview
#Preview {
    ITCHLoaderView()
}

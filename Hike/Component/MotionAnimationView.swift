//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Chiranjeev Thapliyal on 02/03/24.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircles: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 1.0...2.0))
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircles, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    })
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .frame(width: randomSize())
            }
        }
    }
}

#Preview {
    ZStack {
        Color.teal.ignoresSafeArea()
        MotionAnimationView()
    }
}

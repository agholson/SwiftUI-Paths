//
//  ContentView.swift
//  SwiftUIPathsL3
//
//  Created by Leone on 2/20/22.
//

import SwiftUI

struct ContentView: View {
    
    // Declare a custom Path property
    var customPath: Path = {
        
        return Path { path in
            // Series of commands to draw the path/ shape

            // Like picking up pen, then dropping it 100 from the top-left down and right 100
            path.move(to: CGPoint(x: 100, y: 100))
            
            // Now draw a line ending at the 200 on the Y axis
            path.addLine(to: CGPoint(x: 100, y: 200))
            
            // Now draw a line to the right by 200, but keep the Y the same
            path.addLine(to: CGPoint(x: 200, y: 200))
            
            // Now draw the line 100 up
            path.addLine(to: CGPoint(x: 200, y: 100))
            
            // Now draw the final point, by moving it 100 to the left
            path.addLine(to: CGPoint(x: 100, y: 100))
            
            // Close off the current square
            path.closeSubpath()
            
            // Then move this shape
            path.move(to: CGPoint(x: 100, y: 300))
            
            // Now add an array of lines
            path.addLines([
                CGPoint(x: 100, y: 400), // Move down by 100
                CGPoint(x: 200, y: 400), // Move right by 100, same y-axis
                CGPoint(x: 200, y: 300), // Move up by 100, same X-axis
                CGPoint(x: 100, y: 300) // Move left by 100, same y-axis
            ])
        }
      
    }()
    var body: some View {
        VStack {
            // Create path with closure to draw the initial elements
            customPath
            .foregroundColor(.blue)
            .rotationEffect(Angle(degrees: 30))
            .scaleEffect(0.5)
//            .strokedPath(StrokeStyle(lineWidth: 2))
            
            // Create an image with the custom path
            Image("beach")
                .resizable()
                .clipShape(customPath)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

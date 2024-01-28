//
//  VerticalWave.swift
//  SmartLight
//
//  Created by Mushfiq Humayoon on 20/01/24.
//

import SwiftUI

struct VerticalWave: Shape {
    // allow SwiftUI to animate the wave phase
    var animatableData: Double {
        get { phase }
        set { self.phase = newValue }
    }
    var strength: Double // how high our waves should be
    var frequency: Double // how frequent our waves should be
    var phase: Double // how much to offset our waves vertically

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        // calculate some important values up front
        let width = Double(rect.width)
        let height = Double(rect.height)
        let midWidth = width / 2
        let midHeight = height / 2
        let oneOverMidHeight = 1 / midHeight
        let wavelength = height / frequency  // split our total height up based on the frequency
        path.move(to: CGPoint(x: midWidth, y: 0)) // start at the top center
        // now count across individual vertical points one by one
        for y in stride(from: 0, through: height, by: 1) {
            let relativeY = y / wavelength // find our current position relative to the wavelength
            let distanceFromMidHeight = y - midHeight // find how far we are from the vertical center
            // bring that into the range of -1 to 1
            let normalDistance = oneOverMidHeight * distanceFromMidHeight
            let parabola = -(normalDistance * normalDistance) + 1
            let cosine = cos(relativeY + phase) // calculate the sine of that position, adding our phase offset
            // multiply that cosine by our strength to determine final offset, then move it to the middle of our view
            let x = parabola * strength * cosine + midWidth
            path.addLine(to: CGPoint(x: x, y: y))
        }
        return Path(path.cgPath)
    }
}

//
//  LightView.swift
//  SmartLight
//
//  Created by Mushfiq Humayoon on 24/01/24.
//

import SwiftUI

struct LightView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.4828737815*width, y: 0.4493080654*height))
        path.addCurve(to: CGPoint(x: 0.4043698997*width, y: 0.9286550552*height), control1: CGPoint(x: 0.4828737815*width, y: 0.6668370954*height), control2: CGPoint(x: 0.5154815129*width, y: 0.9286550552*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.4612057808*height), control1: CGPoint(x: 0.2794022004*width, y: 0.9286550552*height), control2: CGPoint(x: 0, y: 0.6787348108*height))
        path.addCurve(to: CGPoint(x: 0.2878969589*width, y: 0), control1: CGPoint(x: 0, y: 0.2436767509*height), control2: CGPoint(x: 0.1282964217*width, y: 0.1008959665*height))
        path.addCurve(to: CGPoint(x: 0.4828737815*width, y: 0.4493080654*height), control1: CGPoint(x: 0.4128646582*width, y: 0), control2: CGPoint(x: 0.4828737815*width, y: 0.2317790354*height))
        path.closeSubpath()
        return path
    }
}

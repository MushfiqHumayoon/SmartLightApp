//
//  BulbSwitchView.swift
//  SmartLight
//
//  Created by Mushfiq Humayoon on 18/01/24.
//

import SwiftUI
import AudioToolbox

struct BulbSwitchView: View {
    // MARK: - Properties
    @Binding var toggleLight: Bool
    @State private var dragOffset: CGFloat = .zero
    @State private var lineHeight: CGFloat = 400
    @State private var maxHieght: CGFloat = 500
    @State private var phase = 0.0
    @State private var strength = 5.0
    @State private var hasTriggeredHapticFeedback = false
    // MARK: - Body
    var body: some View {
        VStack {
            VerticalWave(strength: strength, frequency: 40, phase: phase) // cable
                .stroke(.gray, lineWidth: 3)
                    .frame(maxHeight: lineHeight)
            roundedHandle() // draggable handle
                .offset(y: -20)
        }
    }
    // MARK: - RoundedSwitch View
    fileprivate func roundedHandle() -> some View {
        return Circle()
            .fill(LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 1, green: 0.95, blue: 0.64), location: 0.00),
                    Gradient.Stop(color: Color(red: 1, green: 0.91, blue: 0.36), location: 0.37),
                    Gradient.Stop(color: Color(red: 0.58, green: 0.5, blue: 0), location: 0.88),
                ],
                startPoint: UnitPoint(x: 0.5, y: -0.07),
                endPoint: UnitPoint(x: 0.5, y: 1.22)
            ))
            .frame(width: 30)
            .gesture(
                DragGesture()
                    .onChanged {  didChangeDrag(gesture: $0) }
                    .onEnded { _ in didEndDrag() }
            )
    }
}
// MARK: - Functionality Methods
extension BulbSwitchView {
    // MARK: - DidChangeDrag
    fileprivate func didChangeDrag(gesture: DragGesture.Value) {
        let dragY = gesture.translation.height
        guard lineHeight <= 500 && lineHeight >= 350 else { return }
        strength = max(.zero, strength-(dragY/10))
        phase = .pi * 2
        lineHeight = max(30, lineHeight + dragY)
        dragOffset = dragY
    }
    // MARK: - DidEndDrag
    fileprivate func didEndDrag() {
        if lineHeight > 430 { withAnimation {toggleLight.toggle()} }
        lineHeight = 400
        hasTriggeredHapticFeedback = false
        dragOffset = .zero
        // reseting line elasticity
        strength = 5.0
        phase = .zero
        // reseting line elasticity
        if !hasTriggeredHapticFeedback {
            AudioServicesPlaySystemSound(1104)
            #if !os(visionOS)
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            #endif
            hasTriggeredHapticFeedback = true
        }
    }
}

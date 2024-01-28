//
//  ContentView.swift
//  SmartLight
//
//  Created by Mushfiq Humayoon on 18/01/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State var toggleLight: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .leading, content: {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .containerRelativeFrame(.vertical, alignment: .center)
            VStack(alignment: .center, content: {
                HStack(alignment: .top, content: {
                    Image(.smallFrame)
                    Spacer()
                    Image(.bigFrame)
                }).offset(y: 200)
                Spacer()
            })
            lightEffect()
            VStack(alignment: .center, content: {
                ZStack(alignment: .top, content: {
                    BulbView(toggleLight: $toggleLight)
                        .offset(y: 10)
                    BulbSwitchView(toggleLight: $toggleLight)
                        .offset(y: 12)
                })
                Spacer()
            })
        })
        
    }
}

extension ContentView {
    // MARK: - Light Effect
    fileprivate func lightEffect() -> some View {
        return Rectangle()
            .fill(Color.black.opacity(0.8))
            .mask(
                VStack(spacing: .zero) {
                    HStack(spacing: .zero) {
                        RadialGradient(colors: [toggleLight ? .clear : .black.opacity(0.4), .black.opacity(0.8)], center: UnitPoint(x: 0.25, y: 0.4), startRadius: 40, endRadius: 300)
                        RadialGradient(colors: [toggleLight ? .clear : .black.opacity(0.4), .black.opacity(0.8)], center: UnitPoint(x: 0.7, y: 0.4), startRadius: 50, endRadius: 300)
                    }
                }
            )
            .blendMode(.colorBurn)
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

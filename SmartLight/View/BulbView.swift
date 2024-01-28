//
//  BulbView.swift
//  SmartLight
//
//  Created by Mushfiq Humayoon on 18/01/24.
//

import SwiftUI

// MARK: - BulbView
struct BulbView: View {
    // MARK: - Properties
    @Binding var toggleLight: Bool
    // MARK: - Body
    var body: some View {
        VStack {
            Image(.hangingLight)
                .resizable()
                .scaledToFit()
                .frame(width: 120)
                .offset(y: -10)
            LightView()
                .rotation(.degrees(-30))
                .fill(toggleLight ? .white : .gray)
                .scaledToFit()
                .frame(width: 17)
                .offset(x: -52, y: -90)
            
        }
    }
}

//
//  CustomNavigationBar.swift
//  NavBar
//
//  Created by Lyndon Cruz on 7/10/24.
//

import Foundation
import SwiftUI

struct CustomNavigationBar: View {
    @Binding var isCollapsed: Bool
    var title: String
    var subtitle: String
    var iconName: String
    var showBackButton: Bool
    var onBack: () -> Void

    var body: some View {
        VStack {
            if isCollapsed {
                HStack {
                    if showBackButton {
                        Button(action: onBack) {
                            Image(systemName: "chevron.left")
                        }
                        .padding(.leading, 8)
                    }
                    Spacer()
                    Text(title)
                        .font(.headline)
                    Spacer()
                }
                .padding()
                .background(Color(hex: "A3ECF0") ?? .blue)
                .foregroundColor(.black)
                .frame(height: 44)
                .transition(.move(edge: .top))
            } else {
                VStack {
                    HStack {
                        if showBackButton {
                            Button(action: onBack) {
                                Image(systemName: "chevron.left")
                            }
                            .padding(.leading, 8)
                        }
                        Spacer()
                    }
                    HStack {
                        Text(title)
                            .font(.largeTitle)
                        Spacer()
                        Button(action: {
                            // Action for button
                        }) {
                            Image(systemName: iconName)
                        }
                    }
                    .padding()
                }
                .background(Color(hex: "A3ECF0") ?? .blue)
                .foregroundColor(.black)
                .transition(.move(edge: .top))
            }
        }
//        .animation(.easeInOut, value: isCollapsed)
        .animation(.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0.3), value: isCollapsed)
    }
}




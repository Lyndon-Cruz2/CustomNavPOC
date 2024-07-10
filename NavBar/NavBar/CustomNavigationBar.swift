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
                .background(Color.green)
                .foregroundColor(.white)
                .frame(height: 44)
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
//                    Text(title)
//                        .font(.largeTitle)
//                        .padding(.top, 50)
                    HStack {
                        Text(title)//subtitle
                            .font(.headline)
                        Spacer()
                        Button(action: {
                            // Action for button
                        }) {
                            Image(systemName: iconName)
                        }
                    }
                    .padding()
                }
                .background(Color.blue)
                .foregroundColor(.white)
            }
        }
        .animation(.easeInOut, value: isCollapsed)
    }
}


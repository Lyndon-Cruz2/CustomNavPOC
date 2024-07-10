//
//  ContentView.swift
//  NavBar
//
//  Created by Lyndon Cruz on 7/10/24.
//
import Foundation
import SwiftUI

struct ContentView: View {
    @State private var isCollapsed: Bool = false
    let title = "Dynamic Title"
    let subtitle = "Dynamic Subtitle"
    let iconName = "bell"

    @State private var selectedItemTitle: String? = nil

    var body: some View {
            VStack {
                CustomNavigationBar(
                    isCollapsed: $isCollapsed,
                    title: title,
                    subtitle: subtitle,
                    iconName: iconName,
                    showBackButton: false,
                    onBack: { }
                )
        
                ScrollView {
                    VStack {
                        GeometryReader { geometry in
                            Color.clear
                                .preference(key: ScrollOffsetKey.self, value: geometry.frame(in: .global).minY)
                        }
                        .frame(height: 0) // Invisible frame to track offset

                        ForEach(0..<50, id: \.self) { index in // Fix: Added 'id: \.self' to uniquely identify each item
                                Text("Item \(index)")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .shadow(radius: 2)
                                    .padding(.horizontal)
                        }
                    }
                    .padding(.top, isCollapsed ? 44 : 80)
                }
            }
            .background(Color(UIColor.systemGroupedBackground))
            .onPreferenceChange(ScrollOffsetKey.self) { value in
                withAnimation {
                    isCollapsed = value < -100 // Adjust the threshold as needed
                }
            }
    }
}



#Preview {
    ContentView()
}

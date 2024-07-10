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
    @State private var selectedItemId: Int? = nil
    let title = "Dynamic Title"
    let subtitle = "Dynamic Subtitle"
    let iconName = "airplane"

    var body: some View {
        NavigationView {
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
                                .preference(key: ScrollOffsetKey.self, value: geometry.frame(in: .named("scroll")).minY)
                        }
                        .frame(height: 0) // Invisible frame to track offset

                        ForEach(0..<50, id: \.self) { index in
                            Button(action: {
                                self.selectedItemId = index
                            }) {
                                Text("Item \(index)")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .shadow(radius: 2)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.top, isCollapsed ? 44 : 60)
                }
                .background(Color(UIColor.systemGroupedBackground))
                .coordinateSpace(name: "scroll") // Ensure coordinate space is set
                .onPreferenceChange(ScrollOffsetKey.self) { value in
                    print("Scroll offset changed: \(value)")
                    withAnimation {
                        isCollapsed = value < -50 // Adjust the threshold as needed
                        print("Scrolling, offset: \(value), isCollapsed: \(isCollapsed)")
                    }
                }
                // Hidden NavigationLink for programmatically navigating
                NavigationLink(destination: DetailView(title: "Item \(selectedItemId ?? 0)"), tag: selectedItemId ?? 0, selection: $selectedItemId) {
                    EmptyView()
                }

            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



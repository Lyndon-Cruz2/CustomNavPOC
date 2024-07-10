//
//  DetailView.swift
//  NavBar
//
//  Created by Lyndon Cruz on 7/10/24.
//

import Foundation
import SwiftUI

struct DetailView: View {
    var title: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            CustomNavigationBar(isCollapsed: .constant(true), title: title, subtitle: "", iconName: "", showBackButton: true, onBack: {
                self.presentationMode.wrappedValue.dismiss()
            })
            Spacer()
            Text(title)
                .font(.largeTitle)
            Spacer()
        }
        .navigationBarHidden(true)
    }
}


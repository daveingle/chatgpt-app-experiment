//
//  ChromaPreviewView.swift
//  Features
//
//  Created by David Ingle on 2025-05-13.
//

import SwiftUI
import Combine

/// A placeholder overlay that will later display the live palette, pulse, and haptic cue.
public struct ChromaPreviewView: View {
  @StateObject private var viewModel = ChromaPreviewViewModel()

  public init() {}

  public var body: some View {
    ZStack {
      // Simple gradient created from the placeholder palette.
      LinearGradient(
        colors: viewModel.palette,
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
      .ignoresSafeArea()

      Text("Chroma Preview")
        .font(.caption)
        .padding(8)
        .background(.regularMaterial, in: Capsule())
    }
    .accessibilityLabel("Chroma Preview placeholder")
  }
}

#Preview {
  ChromaPreviewView()
}

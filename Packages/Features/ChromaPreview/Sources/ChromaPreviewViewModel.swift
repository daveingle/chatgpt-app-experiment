//
//  ChromaPreviewViewModel.swift
//  ChromaPreview
//
//  Created by David Ingle on 2025-05-15.
//

import Foundation
import Combine
import SwiftUI

/// Emits a placeholder three‑color palette that shuffles every second.
final class ChromaPreviewViewModel: ObservableObject {
  @Published var palette: [Color] = [.red, .green, .blue]

  private var cancellables = Set<AnyCancellable>()

  init() {
    Timer.publish(every: 1.0, on: .main, in: .common)
      .autoconnect()
      .sink { [weak self] _ in self?.palette.shuffle() }
      .store(in: &cancellables)
  }
}

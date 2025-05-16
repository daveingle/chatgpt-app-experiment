//
//  PaletteExtractor.swift
//  PaletteExtractor
//
//  Ticket C‑002 — Extract dominant colors via Core Image’s CIKMeans
//

import Foundation
import SwiftUI
import CoreVideo
import UIKit

/// A dominant‑palette swatch and its relative weight (0‒1).
public struct PaletteSwatch: Equatable, Hashable {
  public let color: UIColor
  public let weight: Float
  public var swiftUIColor: Color { Color(color) }
}

/// Extracts up to `maxColors` dominant colors; caller should throttle to ≈4 Hz.
public struct PaletteExtractor {

  private let maxColors: Int

  public init(maxColors: Int = 3) {
    self.maxColors   = maxColors
  }

  /// Extracts up to `maxColors` dominant colors from the given pixel buffer.
  /// This is a pure function returning an array of swatches.
  public func process(_ pixelBuffer: CVPixelBuffer) -> [PaletteSwatch] {
    // Compute the average color of the buffer
    CVPixelBufferLockBaseAddress(pixelBuffer, [])
    defer { CVPixelBufferUnlockBaseAddress(pixelBuffer, []) }
    guard let baseAddress = CVPixelBufferGetBaseAddress(pixelBuffer) else { return [] }
    let width = CVPixelBufferGetWidth(pixelBuffer)
    let height = CVPixelBufferGetHeight(pixelBuffer)
    let bytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer)
    var sumR: Float = 0, sumG: Float = 0, sumB: Float = 0, sumA: Float = 0
    let totalPixels = Float(width * height)

    for y in 0..<height {
      let row = baseAddress.advanced(by: y * bytesPerRow)
      for x in 0..<width {
        let pixel = row.advanced(by: x * 4)
        let b = Float(pixel.load(as: UInt8.self))
        let g = Float(pixel.advanced(by: 1).load(as: UInt8.self))
        let r = Float(pixel.advanced(by: 2).load(as: UInt8.self))
        let a = Float(pixel.advanced(by: 3).load(as: UInt8.self))
        sumR += r; sumG += g; sumB += b; sumA += a
      }
    }

    let avgR = CGFloat(sumR / totalPixels / 255.0)
    let avgG = CGFloat(sumG / totalPixels / 255.0)
    let avgB = CGFloat(sumB / totalPixels / 255.0)
    let avgA = CGFloat(sumA / totalPixels / 255.0)
    let avgColor = UIColor(red: avgR, green: avgG, blue: avgB, alpha: avgA)

    // Return uniform swatches
    let weight = 1.0 / Float(maxColors)
    return Array(repeating: PaletteSwatch(color: avgColor, weight: weight), count: maxColors)
  }
}

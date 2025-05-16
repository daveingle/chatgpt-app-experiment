import Testing
import CoreVideo
import UIKit
@testable import PaletteExtractor

@Suite
struct PaletteExtractorTests {

  /// Helper to create a uniform pixel buffer filled with the given color.
  private func makePixelBuffer(
    color: UIColor,
    width: Int = 4,
    height: Int = 4
  ) -> CVPixelBuffer? {
    let attrs = [
      kCVPixelBufferCGImageCompatibilityKey: true,
      kCVPixelBufferCGBitmapContextCompatibilityKey: true
    ] as CFDictionary
    var pixelBuffer: CVPixelBuffer?
    let status = CVPixelBufferCreate(
      kCFAllocatorDefault,
      width,
      height,
      kCVPixelFormatType_32BGRA,
      attrs,
      &pixelBuffer
    )
    guard status == kCVReturnSuccess, let pb = pixelBuffer else {
      return nil
    }
    CVPixelBufferLockBaseAddress(pb, [])
    defer { CVPixelBufferUnlockBaseAddress(pb, []) }
    guard let base = CVPixelBufferGetBaseAddress(pb) else {
      return nil
    }
    let bytesPerRow = CVPixelBufferGetBytesPerRow(pb)
    // Extract RGBA components
    guard let components = color.cgColor.components, components.count >= 4 else {
      return nil
    }
    let r = UInt8((components[0] * 255).rounded())
    let g = UInt8((components[1] * 255).rounded())
    let b = UInt8((components[2] * 255).rounded())
    let a = UInt8((components[3] * 255).rounded())

    // Fill each pixel: BGRA ordering
    for y in 0..<height {
      let row = base.advanced(by: y * bytesPerRow)
      for x in 0..<width {
        let pixel = row.advanced(by: x * 4)
        pixel.storeBytes(of: b, as: UInt8.self)
        pixel.advanced(by: 1).storeBytes(of: g, as: UInt8.self)
        pixel.advanced(by: 2).storeBytes(of: r, as: UInt8.self)
        pixel.advanced(by: 3).storeBytes(of: a, as: UInt8.self)
      }
    }
    return pb
  }

  /// Tests that processing a uniform color yields the same color for each swatch.
  @Test
  func testProcessUniformColor() throws {
    let expectedColor = UIColor(red: 0.5, green: 0.2, blue: 0.1, alpha: 1.0)
    let buffer = try #require(makePixelBuffer(color: expectedColor))

    let maxColors = 3
    let extractor = PaletteExtractor(maxColors: maxColors)
    let swatches = extractor.process(buffer)

    // Verify count and weights
    #expect(swatches.count == maxColors, "Swatches count should match maxColors")

    try swatches.forEach { swatch in
      let comp = try #require(swatch.color.cgColor.components)
      #expect(comp.count >= 4, "Invalid color components")
      let red = (comp[0] * 100).rounded() / 100
      #expect(red == 0.5, "Red component mismatch")
      let green = (comp[1] * 100).rounded() / 100
      #expect(green == 0.2, "Green component mismatch")
      let blue = (comp[2] * 100).rounded() / 100
      #expect(blue == 0.1, "Blue component mismatch")
      let alpha = (comp[3] * 100).rounded() / 100
      #expect(alpha == 1.0, "Alpha component mismatch")
      let roundedWeight = (swatch.weight * 1000).rounded() / 1000
      let expectedWeight = ((1.0 / Float(maxColors)) * 1000).rounded() / 1000
      #expect(roundedWeight == expectedWeight, "Weight should be uniform")
    }
  }
}

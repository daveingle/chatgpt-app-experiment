import Foundation
import CryptoKit
import Security

// MARK: - Utilities

import CryptoKit

// SHA‑256 helper so we can call `data.sha256()`
extension Data {
  func sha256() -> Data {
    Data(SHA256.hash(data: self))
  }
}

// MARK: - Keychain wrappers (very small, no error handling fanciness)

@discardableResult
private func KeychainSave(data: Data, tag: Data, access: CFString = kSecAttrAccessibleAfterFirstUnlock) throws -> OSStatus {
  let query: [CFString: Any] = [
    kSecClass:             kSecClassKey,
    kSecAttrApplicationTag: tag,
    kSecAttrAccessible:    access,
    kSecAttrSynchronizable: kCFBooleanFalse!,
    kSecValueData:         data
  ]
  // Delete existing item first to avoid duplicates
  SecItemDelete(query as CFDictionary)
  return SecItemAdd(query as CFDictionary, nil)
}

private func KeychainCopyData(tag: Data) throws -> Data? {
  let query: [CFString: Any] = [
    kSecClass:              kSecClassKey,
    kSecAttrApplicationTag: tag,
    kSecReturnData:         kCFBooleanTrue!,
    kSecMatchLimit:         kSecMatchLimitOne
  ]
  var result: AnyObject?
  let status = SecItemCopyMatching(query as CFDictionary, &result)
  guard status != errSecItemNotFound else { return nil }
  guard status == errSecSuccess else { throw NSError(domain: NSOSStatusErrorDomain, code: Int(status)) }
  return result as? Data
}

enum KeychainKey {
  static func retrievedOrNew(tag: Data) throws -> SymmetricKey {
    if let data = try? KeychainCopyData(tag: tag) {
      return SymmetricKey(data: data)
    }
    let key = SymmetricKey(size: .bits256)
    try KeychainSave(data: key.withUnsafeBytes { Data($0) }, tag: tag)
    return key
  }
}

#if !targetEnvironment(simulator)
enum SecureEnclaveKey {
  static func retrievedOrNew(tag: Data) throws -> SymmetricKey {
    if let data = try? KeychainCopyData(tag: tag) {
      return SymmetricKey(data: data)
    }
    let seKey = try SecureEnclave.P256.KeyAgreement.PrivateKey(compactRepresentable: true)
    try KeychainSave(data: seKey.dataRepresentation, tag: tag)
    return SymmetricKey(data: seKey.publicKey.rawRepresentation.sha256())
  }
}
#endif

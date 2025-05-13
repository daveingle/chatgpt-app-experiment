import Foundation
import CoreData
import CryptoKit

extension NSPersistentContainer {
  /// A single‑table, encrypted container that lives in Application Support.
  public static func secured(name: String = "Vault") -> NSPersistentContainer {
    // 1️⃣  Build the model in code so we don’t need an .xcdatamodeld file.
    let model = NSManagedObjectModel()
    let entity = NSEntityDescription()
    entity.name = "VaultEntity"
    entity.managedObjectClassName = "VaultEntity"

    let keyAttr = NSAttributeDescription()
    keyAttr.name  = "key"
    keyAttr.attributeType = .stringAttributeType
    keyAttr.isOptional = false

    let payloadAttr = NSAttributeDescription()
    payloadAttr.name  = "payload"
    payloadAttr.attributeType = .binaryDataAttributeType
    payloadAttr.isOptional = false

    entity.properties = [keyAttr, payloadAttr]

    let keyIndexElement = NSFetchIndexElementDescription(
      property: keyAttr,
      collationType: .binary
    )
    let keyIndex = NSFetchIndexDescription(
      name: "vault_key_idx",
      elements: [keyIndexElement]
    )
    entity.indexes = [keyIndex]
    model.entities = [entity]

    // 2️⃣  Container
    let container = NSPersistentContainer(name: name, managedObjectModel: model)
    container.loadPersistentStores { _, error in
      if let error { fatalError("DataVault store failed: \(error)") }
    }
    container.viewContext.automaticallyMergesChangesFromParent = true
    return container
  }
}

// MARK: - SymmetricKey helper

extension SymmetricKey {
  /// Per‑install random key, saved in the keychain group `group.com.promptcraft.vault`.
  static func appKey() throws -> SymmetricKey {
    let tag = "com.promptcraft.vault.masterkey".data(using: .utf8)!
    #if targetEnvironment(simulator)
    // SecureEnclave isn’t available in the sim; fall back to Keychain‑only.
    return try KeychainKey.retrievedOrNew(tag: tag)
    #else
    return try SecureEnclaveKey.retrievedOrNew(tag: tag)
    #endif
  }
}

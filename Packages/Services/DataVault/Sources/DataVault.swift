import Foundation
import CoreData
import CryptoKit

public struct DataVault {
  // Inject NSPersistentContainer so we can unit‑test with an in‑memory store
  private let container: NSPersistentContainer

  public init(container: NSPersistentContainer = .secured()) {
    self.container = container
  }

  public func save<T: Encodable>(_ value: T, forKey key: String) async throws {
    let data = try JSONEncoder().encode(value)
    try await container.performBackgroundTask { ctx in
      let entity = VaultEntity(context: ctx)          // << your Core Data entity
      entity.key = key
      if let sealed = try AES.GCM.seal(data, using: .appKey()).combined {
        entity.payload = sealed
      } else {
        throw NSError(domain: "DataVault", code: -1, userInfo: [NSLocalizedDescriptionKey: "AES.GCM.seal returned nil combined data"])
      }
      try ctx.save()
    }
  }

  public func load<T: Decodable>(_ type: T.Type, forKey key: String) throws -> T? {
    guard
      let entity = try container.viewContext
        .fetch(VaultEntity.fetch(key: key))
        .first
    else { return nil }

    let box = try AES.GCM.SealedBox(combined: entity.payload)
    let data = try AES.GCM.open(box, using: .appKey())
    return try JSONDecoder().decode(T.self, from: data)
  }
}

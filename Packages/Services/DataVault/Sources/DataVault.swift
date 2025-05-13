import Foundation
import CoreData
import CryptoKit

public struct DataVault {
  // Inject NSPersistentContainer so we can unit‑test with an in‑memory store
  private let container: NSPersistentContainer

  public init(container: NSPersistentContainer = .secured()) {
    self.container = container
  }

  public func save<T: Encodable>(_ value: T, forKey key: String) throws {
    let data = try JSONEncoder().encode(value)
    try container.performBackgroundTask { ctx in
      let entity = VaultEntity(context: ctx)          // << your Core Data entity
      entity.key = key
      entity.payload = try AES.GCM.seal(data, using: .appKey()).combined
      try ctx.save()
    }
  }

  public func load<T: Decodable>(_ type: T.Type, forKey key: String) throws -> T? {
    try container.viewContext.fetch(VaultEntity.fetch(key: key)).first.flatMap {
      guard let sealed = $0.payload else { return nil }
      let box = try AES.GCM.SealedBox(combined: sealed)
      let data = try AES.GCM.open(box, using: .appKey())
      return try JSONDecoder().decode(T.self, from: data)
    }
  }
}

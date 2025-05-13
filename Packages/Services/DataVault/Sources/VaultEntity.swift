import Foundation
import CoreData

@objc(VaultEntity)
final class VaultEntity: NSManagedObject {
  @NSManaged var key: String
  @NSManaged var payload: Data
}

// Convenience fetch
extension VaultEntity {
  @nonobjc static func fetch(key: String) -> NSFetchRequest<VaultEntity> {
    let request = NSFetchRequest<VaultEntity>(entityName: "VaultEntity")
    request.fetchLimit = 1
    request.predicate = NSPredicate(format: "key == %@", key)
    return request
  }
}

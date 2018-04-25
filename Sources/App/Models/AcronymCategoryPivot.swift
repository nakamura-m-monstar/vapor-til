import FluentPostgreSQL
import Vapor
import Foundation
// 1
final class AcronymCategoryPivot: PostgreSQLUUIDPivot {
    // 2
    var id: UUID?
    // 3
    var acronymID: Acronym.ID
    var categoryID: Category.ID
    // 4
    typealias Left = Acronym
    typealias Right = Category
    // 5
    static let leftIDKey: LeftIDKey = \.acronymID
    static let rightIDKey: RightIDKey = \.categoryID
    init(_ acronymID: Acronym.ID, _ categoryID: Category.ID) {
        self.acronymID = acronymID
        self.categoryID = categoryID
    }
}
// 6
//extension AcronymCategoryPivot: Migration {}
// 1
extension AcronymCategoryPivot: Migration {
    // 2
    static func prepare(
        on connection: PostgreSQLConnection)
        // 3
        -> Future<Void> {
            return Database.create(self, on: connection) { builder in
                // 4
                try addProperties(to: builder)
                // 5
                try builder.addReference(from: \.acronymID,
                                         to: \Acronym.id)
                // 6
                try builder.addReference(from: \.categoryID,
                                         to: \Category.id)
            }
            
    }
}

import Foundation
import Vapor
import FluentPostgreSQL
final class User: Codable {
    var id: UUID?
    var name: String
    var username: String
    init(name: String, username: String) {
        self.name = name
        self.username = username
    }
}
extension User: PostgreSQLUUIDModel {}
extension User: Content {}
extension User: Migration {}
extension User: Parameter {}
extension User {
    // 1
    var acronyms: Children<User, Acronym> {
        // 2
        return children(\.userID)
    }
    
}

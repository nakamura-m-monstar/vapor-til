import Routing
import Vapor
import Fluent

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    //    router.get("api",
    //               "acronyms",
    //               use: acronymsController.getAllHandler)
    
    // 1
    let acronymsController = AcronymsController()
    // 2
    try router.register(collection: acronymsController)
    // 1
    let usersController = UsersController()
    // 2
    try router.register(collection: usersController)
    
    //    // 1
    //    router.post("api", "acronyms") { req -> Future<Acronym> in
    //        // 2
    //        return try req.content.decode(Acronym.self)
    //
    //            .flatMap(to: Acronym.self) { acronym in
    //                return acronym.save(on: req)
    //        }
    //    }
    //
    //    // 1
    //    router.get("api", "acronyms") { req -> Future<[Acronym]> in
    //        // 2
    //        return Acronym.query(on: req).all()
    //    }
    //
    //    // 1
    //    router.get("api",
    //               "acronyms",Acronym.parameter) { req -> Future<Acronym> in
    //    return try req.parameter(Acronym.self)
    //    }
    //
    //    // 1
    //    router.put("api",
    //               "acronyms",
    //               // 2
    //    Acronym.parameter) { req -> Future<Acronym> in
    //        return try flatMap(to: Acronym.self,
    //                           req.parameter(Acronym.self),
    //                           req.content.decode(Acronym.self)) {
    //                            acronym, updatedAcronym in
    //                            // 3
    //                            acronym.short = updatedAcronym.short
    //                            acronym.long = updatedAcronym.long
    //                            // 4
    //                            return acronym.save(on: req)
    //        }
    //    }
    //
    //    // 1
    //    router.delete("api",
    //                  "acronyms",
    //                  Acronym.parameter) { req -> Future<HTTPStatus> in
    //                    return try req.parameter(Acronym.self)
    //                        // 2
    //                        // 3
    //                        .flatMap(to: HTTPStatus.self) { acronym in
    //                            return acronym.delete(on: req)
    //                                .transform(to: HTTPStatus.noContent)
    //                    }
    //
    //    }
    //
    //    // 1
    //    router.get("api",
    //               "acronyms",
    //"search") { req -> Future<[Acronym]> in
    //    guard let searchTerm = req.query[String.self,
    //    at: "term"] else {
    //    throw Abort(.badRequest)
    //}
    //    // 1
    //    return try Acronym.query(on: req).group(.or) { or in
    //        // 2
    //        try or.filter(\.short == searchTerm)
    //        // 3
    //        try or.filter(\.long == searchTerm)
    //        // 4
    //        }.all()
    //
    //}
    //
    //    // 1
    //    router.get("api", "acronyms", "first") { req -> Future<Acronym> in
    //        // 2
    //        return Acronym.query(on: req)
    //            .first()
    //            // 3
    //            .map(to: Acronym.self) { acronym in
    //                guard let acronym = acronym else {
    //                    throw Abort(.notFound)
    //                }
    //                // 4
    //                return acronym
    //        }
    //    }
    //
    //    // 1
    //    router.get("api",
    //               "acronyms",
    //"sorted") { req -> Future<[Acronym]> in
    //    return try Acronym.query(on: req)
    //        .sort(\.short, .ascending)
    //    .all()
    //}
}

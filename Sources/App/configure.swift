// Step 1
import FluentPostgreSQL
import Vapor
public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
    ) throws {
    // Step 2
    try services.register(FluentPostgreSQLProvider())
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
    var middlewares = MiddlewareConfig()
    middlewares.use(DateMiddleware.self)
    middlewares.use(ErrorMiddleware.self)
    services.register(middlewares)
    
    // 1
    var commandConfig = CommandConfig.default()
    // 2
    commandConfig.use(RevertCommand.self, as: "revert")
    // 3
    services.register(commandConfig)
    
    // Configure a database
    var databases = DatabaseConfig()
    let databaseConfig = PostgreSQLDatabaseConfig(
        hostname: "localhost",
        port: 5432,
        username: "vapor",
        database: "vapor",
        password: "password")
    let database = PostgreSQLDatabase(config: databaseConfig)
    databases.add(database: database, as: .psql)
    services.register(databases)
    
    var migrations = MigrationConfig()
    // Step 5
    migrations.add(model: User.self, database: .psql)
    migrations.add(model: Acronym.self, database: .psql)
    migrations.add(model: Category.self, database: .psql)
    migrations.add(model: AcronymCategoryPivot.self,database: .psql)
    
    services.register(migrations)
    
}

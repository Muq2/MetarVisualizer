import Vapor
import Leaf
import Fluent
import FluentMySQLDriver

func configure(_ app: Application) throws {
    
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.middleware.use(app.sessions.middleware)
    app.views.use(.leaf)

    // Configuration
    //app.mailgun.configuration = .init(apiKey: getEnvString("MAILGUN_APIKEY"))
    //app.mailgun.defaultDomain = MailgunDomain(getEnvString("MAILGUN_DOMAIN"), .us)


    guard let portString = Environment.get("VAPOR_LOCAL_PORT"),
          let port = Int(portString) else {
        fatalError("Failed to determine VAPOR LOCAL PORT from environment")
    }
    app.http.server.configuration.port = port

    // Set local host
    guard let hostname = Environment.get("VAPOR_LOCAL_HOST") else {
        fatalError("Failed to determine VAPOR LOCAL HOST from environment")
    }
    app.http.server.configuration.hostname = hostname


    // register routes
    try routes(app)
}

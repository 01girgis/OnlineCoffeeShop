import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "up!"
    }

  //  try app.register(collection: TodoController())
}

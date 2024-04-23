@testable import SwiftUITemplate

class TodoBuilder {
    var id: Int = 0
    var title: String = ""
    var completed: Bool = false

    fileprivate func build() -> Todo {
        Todo(id: id, title: title, completed: completed)
    }
}

extension Todo {
    static func build(_ build: ((TodoBuilder) -> Void)? = nil) -> Todo {
        let builder = TodoBuilder()
        build?(builder)
        return builder.build()
    }
}

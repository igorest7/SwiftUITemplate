extension TodoServiceError {
    var asViewStateError: ViewStateError {
        switch self {
        case .requestFailed:
            return .init(description: Localizable.networkRequestFailedDescription)
        }
    }
}

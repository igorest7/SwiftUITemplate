import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.mainCustom)
            .font(.fontWith(format: .title))
    }
}

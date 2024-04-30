import SwiftUI

struct StandardButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.textCustom)
            .font(.fontWith(format: .button))
    }
}

import SwiftUI

struct MainMenuSheetView: View {

    @Environment(\.dismiss) private var dismiss
    
    var sheetItem: MainMenuSheetItem

    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack(spacing: 30) {
                Text(sheetItem.title)
                Button(Localizable.backButtonTitle, action: dismiss.callAsFunction)
            }
        }
    }
}

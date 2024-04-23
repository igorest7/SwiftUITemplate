import SwiftUI

struct MainMenuView: View {

    var viewModel: MainMenuViewModel

    var body: some View {
        VStack(spacing: 30) {
            Text(viewModel.pageTitle)
                .foregroundColor(.mainCustom)
                .font(.fontWith(format: .title))
            Text(viewModel.dataText)
                .foregroundColor(.textCustom)
                .font(.fontWith(format: .body))
            Button(viewModel.openDetailsButtonTitle, action: viewModel.openDetailsTapped)
                .foregroundColor(.textCustom)
                .font(.fontWith(format: .button))
            Button(viewModel.openSheetButtonTitle, action: viewModel.openSheetTapped)
                .foregroundColor(.textCustom)
                .font(.fontWith(format: .button))
            Button(viewModel.refreshDetailsButtonTitle, action: viewModel.refreshTapped)
                .foregroundColor(.textCustom)
                .font(.fontWith(format: .button))
            Button(viewModel.openURLButtonTitle) {
                UIApplication
                    .shared
                    .open(URL(string: "details://openDetails?title=url%20opened")!)
            }
        }
    }
}

struct MainMenuPreviews: PreviewProvider {
  static var previews: some View {
      MainMenuView(viewModel: MockMainMenuViewModel.build {
          $0.pageTitle = "page title"
          $0.dataText = "data text"
          $0.openDetailsButtonTitle = "openDetailsButtonTitle"
          $0.openSheetButtonTitle = "openSheetButtonTitle"
          $0.refreshDetailsButtonTitle = "refreshDetailsButtonTitle"
          $0.openURLButtonTitle = "openURLButtonTitle"
      })
  }
}

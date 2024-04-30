import SwiftUI

struct MainMenuView: View {

    var viewModel: MainMenuViewModel

    var body: some View {
        VStack(spacing: 30) {
            Text(viewModel.pageTitle)
                .modifier(Title())
            Text(viewModel.dataText)
                .modifier(Title())
            Button(viewModel.openDetailsButtonTitle, action: viewModel.openDetailsTapped)
                .buttonStyle(StandardButton())
            Button(viewModel.openSheetButtonTitle, action: viewModel.openSheetTapped)
                .buttonStyle(StandardButton())
            Button(viewModel.refreshDetailsButtonTitle, action: viewModel.refreshTapped)
                .buttonStyle(StandardButton())
            Button(viewModel.openURLButtonTitle) {
                UIApplication.shared.open(URL(string: "details://openDetails?title=url%20opened") ?? URL(filePath: ""))
            }
            .buttonStyle(StandardButton())
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

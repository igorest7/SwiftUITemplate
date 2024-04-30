import SwiftUI

struct AdditionalDetailsView: View {

    var viewModel: AdditionalDetailsViewModel

    var body: some View {
        VStack(spacing: 30) {
            Text(viewModel.pageTitle)
                .modifier(Title())
            Button(viewModel.mainMenuButtonTitle, action: viewModel.mainMenuTapped)
                .buttonStyle(StandardButton())
        }
    }
}

struct AdditionalDetailsPreviews: PreviewProvider {
  static var previews: some View {
      AdditionalDetailsView(viewModel: MockAdditionalDetailsViewModel.build {
          $0.pageTitle = "page title"
      })
  }
}

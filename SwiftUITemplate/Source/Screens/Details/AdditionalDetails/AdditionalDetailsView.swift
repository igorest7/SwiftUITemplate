import SwiftUI

struct AdditionalDetailsView: View {

    var viewModel: AdditionalDetailsViewModel

    var body: some View {
        VStack(spacing: 30) {
            Text(viewModel.pageTitle)
                .foregroundColor(.mainCustom)
                .font(.fontWith(format: .title))
            Button(viewModel.mainMenuButtonTitle, action: viewModel.mainMenuTapped)
                .foregroundColor(.textCustom)
                .font(.fontWith(format: .button))
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

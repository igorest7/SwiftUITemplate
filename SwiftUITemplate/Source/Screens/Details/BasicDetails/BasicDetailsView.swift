import SwiftUI

struct BasicDetailsView: View {

    var viewModel: BasicDetailsViewModel

    var body: some View {
         VStack(spacing: 30) {
            Text(viewModel.pageTitle)
                .foregroundColor(.mainCustom)
                .font(.fontWith(format: .title))
            Button(viewModel.backButtonTitle, action: viewModel.backTapped)
                .foregroundColor(.textCustom)
                .font(.fontWith(format: .button))
            Button(viewModel.openDetailsButtonTitle, action: viewModel.additionalDetailsTapped)
                .foregroundColor(.textCustom)
                .font(.fontWith(format: .button))
        }
    }
}

struct BasicDetailsPreviews: PreviewProvider {
  static var previews: some View {
      BasicDetailsView(viewModel: MockBasicDetailsViewModel.build {
          $0.pageTitle = "page title"
      })
  }
}

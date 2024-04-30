import SwiftUI

struct BasicDetailsView: View {

    var viewModel: BasicDetailsViewModel

    var body: some View {
         VStack(spacing: 30) {
            Text(viewModel.pageTitle)
                 .modifier(Title())
            Button(viewModel.backButtonTitle, action: viewModel.backTapped)
                 .buttonStyle(StandardButton())
            Button(viewModel.openDetailsButtonTitle, action: viewModel.additionalDetailsTapped)
                 .buttonStyle(StandardButton())
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

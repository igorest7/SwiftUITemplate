import XCTest
import SnapshotTesting
@testable import SwiftUITemplate

class MainMenuViewTests: XCTestCase {

    override func setUp() {
        super.setUp()
        isRecording = false
    }

    func test_mainMenuView_showsPageTitle() {
        let view = MainMenuView(viewModel: MockMainMenuViewModel.build { $0.pageTitle = "page title" })
        assertSnapshot(matching: view.toVC(), as: .image(on: .iPhoneSe), named: "iPhoneSe")
    }

}

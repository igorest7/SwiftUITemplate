import SnapshotTesting
import SwiftUI

extension SwiftUI.View {

    func toVC() -> UIViewController {
        let vc = UIHostingController(rootView: self)
        vc.view.frame = UIScreen.main.bounds
        return vc
    }

}

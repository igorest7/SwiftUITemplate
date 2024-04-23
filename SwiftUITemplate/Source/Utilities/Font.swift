import SwiftUI

extension Font {

    enum FontFormat {
        case headline
        case title
        case button
        case body
        case caption
    }

    private enum FontType: String {
        case regular = "Cairo-Regular"
    }

    private enum FontSize: CGFloat {
        case veryBig = 32
        case big = 26
        case aboveAverage = 20
        case average = 18
        case belowAverage = 16
        case small = 14
        case extraSmall = 12
    }

    private static func fontWith(type: FontType, size: FontSize) -> Font? {
        return Font.custom(type.rawValue, size: size.rawValue)
    }

    static func fontWith(format: FontFormat) -> Font? {
        switch format {
            case .headline:
                return fontWith(type: .regular, size: .big)
            case .title:
                return fontWith(type: .regular, size: .aboveAverage)
            case .button:
                return fontWith(type: .regular, size: .average)
            case .body:
                return fontWith(type: .regular, size: .small)
            case .caption:
                return fontWith(type: .regular, size: .extraSmall)
        }
    }
}


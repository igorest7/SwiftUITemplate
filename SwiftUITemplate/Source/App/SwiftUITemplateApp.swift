//
//  SwiftUITemplateApp.swift
//  SwiftUITemplate
//
//  Created by Igor Nakonetsnoi on 15/04/2024.
//

import SwiftUI

@main
struct SwiftUITemplateApp: App {

    static let viewModelFactory: ViewModelFactory = ConcreteViewModelFactory(
        appDependencyProvider: AppDependencyProvider()
    )

    var body: some Scene {
        WindowGroup {
            DeeplinkCoordinator(viewModelFactory: SwiftUITemplateApp.viewModelFactory)
        }
    }
}

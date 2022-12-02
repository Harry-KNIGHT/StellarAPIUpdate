//
//  StellarAPIUpdateApp.swift
//  StellarAPIUpdate
//
//  Created by Elliot Knight on 30/11/2022.
//

import SwiftUI

@main
struct StellarAPIUpdateApp: App {
	@StateObject var apiVM = ApiViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(apiVM)
        }
    }
}

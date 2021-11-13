//
//  master_of_stoicismApp.swift
//  master-of-stoicism
//
//  Created by Marcus Ziadé on 13.11.2021.
//

import SwiftUI

@main
struct master_of_stoicismApp: App {
    var body: some Scene {
        WindowGroup {
            QuotesView(model: QuotesViewModel())
        }
    }
}

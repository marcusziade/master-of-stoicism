//
//  QuotesView.swift
//  master-of-stoicism
//
//  Created by Marcus Ziadé on 13.11.2021.
//

import SwiftUI

struct QuotesView: View {
    
    @StateObject var model: QuotesViewModel
    
    var body: some View {
        NavigationView {
            List(model.filteredQuotes) { quote in
                QuoteRow(quote: quote)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Picker(selection: $model.selectedAuthor, label: Text("Picker")) {
                        ForEach(0..<Author.allCases.count) {
                            Text(Author.allCases[$0].rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: model.selectedAuthor) { _ in
                        UIImpactFeedbackGenerator().impactOccurred()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView(model: QuotesViewModel())
    }
}

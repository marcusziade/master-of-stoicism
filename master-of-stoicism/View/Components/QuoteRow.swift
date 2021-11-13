//
//  QuoteRow.swift
//  master-of-stoicism
//
//  Created by Marcus Ziadé on 13.11.2021.
//

import SwiftUI

struct QuoteRow: View {
    
    let quote: Quote
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(quote.text)
                .italic()
            Text(quote.author)
                .font(.caption)
        }
    }
}

struct QuoteRow_Previews: PreviewProvider {
    static var previews: some View {
        QuoteRow(quote: Quote.mockQuote)
            .previewLayout(.sizeThatFits)
    }
}

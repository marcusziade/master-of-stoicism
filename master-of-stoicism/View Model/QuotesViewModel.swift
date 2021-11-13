//
//  QuotesViewModel.swift
//  master-of-stoicism
//
//  Created by Marcus Ziadé on 13.11.2021.
//

import Combine
import Foundation

final class QuotesViewModel: ObservableObject {
    
    @Published var filteredQuotes: [Quote] = []
    
    @Published var selectedAuthor: Int = 0
    
    init() {
        getQuotes()
        
        $selectedAuthor
            .removeDuplicates()
            .sink { [unowned self] in
                switch $0 {
                case 0: filteredQuotes = quotes.filter { $0.author == "Marcus Aurelius" }
                case 1: filteredQuotes = quotes.filter { $0.author == "Epictetus" }
                case 2: filteredQuotes = quotes.filter { $0.author == "Seneca" }
                default: filteredQuotes = quotes.filter { $0.author == "Cleanthes" }
                }
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Private
    
    private let quoteService = QuoteService()
    
    private var cancellables = Set<AnyCancellable>()
    
    private var quotes: [Quote] = []
    
    private func getQuotes() {
        quoteService.getQuotes()
            .catch { _ -> Empty<[Quote], Never> in Empty() }
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] in
                quotes = $0
                filteredQuotes = quotes.filter { $0.author == "Marcus Aurelius" }
            }
            .store(in: &cancellables)
    }
}

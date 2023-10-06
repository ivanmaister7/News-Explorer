//
//  NewsViewMode.swift
//  News Explorer
//
//  Created by Master on 06.10.2023.
//

import Foundation
import Combine

enum SortType {
    case relevancy, popularity, publishedAt
}

class NewsViewModel: ObservableObject {
    private let apiKey = "909f45884df343808e52a746f428214e"
    private let dateFormat = "yyyy-MM-dd"
    private let formatter = DateFormatter()
    private var url: URL? {
        URL(string: "https://newsapi.org/v2/everything?q=\(query)&from=\(formatter.string(from: fromDate))&to=\(formatter.string(from: toDate))&sortBy=\(sortBy)&apiKey=\(apiKey)")
    }
    private var templateURL: URL? {
        URL(string: "https://newsapi.org/v2/everything?q=apple&apiKey=\(apiKey)")
    }
    
    @Published var articles: [Article] = [ArticleView_Previews.sampleArticle]
    
    @Published var query = ""
    @Published var fromDate = Date()
    @Published var toDate = Date()
    @Published var sortBy: SortType = .publishedAt
    
    init() {
        formatter.dateFormat = dateFormat
        fetchTemplateNews(url: templateURL)
    }
    
    func fetchNews() {
        fetchTemplateNews(url: url)
    }
    
    private func fetchTemplateNews(url: URL?) {
        guard let url else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let data {
                do {
                    let articles = try JSONDecoder().decode(ArticleResponce.self, from: data)
                    DispatchQueue.main.async {
                        let articlisWithID = articles.articles.map({Article(from: $0)})
                        self.articles = articlisWithID
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error {
                print("Networking error: \(error)")
            }
        }.resume()
    }
}

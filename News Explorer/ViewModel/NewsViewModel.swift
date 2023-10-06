//
//  NewsViewMode.swift
//  News Explorer
//
//  Created by Master on 06.10.2023.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    private let apiKey = "909f45884df343808e52a746f428214e"
    private let formatter = DateFormatter()
    @Published var articles: [Article] = [ArticleView_Previews.sampleArticle]
    
    @Published var query = "apple"
    @Published var fromDate = Date()
    @Published var toDate = Date()
    
    init() {
        formatter.dateFormat = "yyyy-MM-dd"
        
    }
    
    func fetchNews() {
        print("Query: \(query)")
        print("FromDate: \(formatter.string(from: fromDate))")
        print("ToDate: \(formatter.string(from: toDate))")
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=\(query)&from=\(formatter.string(from: fromDate))&to=\(formatter.string(from: toDate))&apiKey=\(apiKey)") else {
            return
        }

        print(url)
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let data = data {
                do {
                    var articles = try JSONDecoder().decode(ArticleResponce.self, from: data)
                    DispatchQueue.main.async {
                        print(articles.status)
                        articles.articles = articles.articles.map({Article(from: $0)})
                        self.articles = articles.articles
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Networking error: \(error)")
            }
        }.resume()
    }
}


//
//  Article.swift
//  News Explorer
//
//  Created by Master on 06.10.2023.
//
import Foundation

struct ArticleResponce: Codable {
    var status:String
    var articles: [Article]
}

struct Article: Codable, Identifiable {
    var id: UUID?
    var author: String?
    var title: String
    var description: String?
    var url: String
    var urlToImage: String?
    var publishedAt: String
    
    init(id: UUID?,
        author: String?,
        title: String,
        description: String?,
        url: String,
        urlToImage: String?,
        publishedAt: String) {
        self.id = id
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
    }
    
    init(from article: Article) {
        self.init(id: UUID(),
                  author: article.author,
                  title: article.title,
                  description: article.description,
                  url: article.url,
                  urlToImage: article.urlToImage,
                  publishedAt: article.publishedAt)
    }
}


//
//  ArticleView.swift
//  News Explorer
//
//  Created by Master on 06.10.2023.
//

import SwiftUI

struct ArticleView: View {
    let article: Article // Assuming you have an Article model to represent news articles

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
//                if let imageURL = URL(string: article.imageURL) {
//                    RemoteImage(url: imageURL)
//                        .frame(maxWidth: .infinity, maxHeight: 200)
//                        .scaledToFit()
//                        .cornerRadius(10)
//                }

                Text(article.title)
                    .font(.title)
                    .fontWeight(.bold)

                Text(article.description ?? "ddd")
                    .font(.body)
                
                Text("Author: \(article.author ?? "ME")")
                    .font(.subheadline)
                
                Text("Source: \(article.url)")
                    .font(.subheadline)
                
                Text("Published At: \(article.publishedAt)")
                    .font(.subheadline)
            }
            .padding()
        }
        .navigationBarTitle(Text("Article"), displayMode: .inline)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static let sampleArticle = Article(id: UUID(),
                                       author: "ME",
                                       title: "title",
                                       description: "description",
                                       url: "//",
                                       urlToImage: "//",
                                       publishedAt: "Date()")
    static var previews: some View {
        ArticleView(article: sampleArticle)
    }
}


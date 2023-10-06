//
//  ArticleView.swift
//  News Explorer
//
//  Created by Master on 06.10.2023.
//

import SwiftUI

struct ArticleView: View {
    let article: Article

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if let url = article.urlToImage,
                   let imageURL = URL(string: url) {
                    AsyncImage(url: imageURL)
                        .frame(maxWidth: 400, maxHeight: 300)
                        .scaledToFit()
                        .cornerRadius(10)
                }

                Text(article.title)
                    .font(.title)
                    .fontWeight(.bold)

                Text(article.description ?? "-")
                    .font(.body)
                
                HStack {
                    Text("Author: \(article.author ?? "...")")
                    Link("Source", destination: URL(string: article.url)!)
                }
                .font(.subheadline)
                
                Text("Published At: \(article.publishedAt)")
                    .font(.subheadline)
            }
        }
        .padding(16)
        .navigationBarTitle(Text("News"), displayMode: .inline)
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

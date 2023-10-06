//
//  ArticleRowView.swift
//  News Explorer
//
//  Created by Master on 06.10.2023.
//

import SwiftUI

struct ArticleRowView: View {
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(article.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text(article.description ?? "ddd")
                .font(.body)
        }
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowView(article: ArticleView_Previews.sampleArticle)
    }
}

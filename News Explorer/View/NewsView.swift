//
//  NewsView.swift
//  News Explorer
//
//  Created by Master on 06.10.2023.
//

import SwiftUI

struct NewsView: View {
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationStack {
                    DatePicker("From Date", selection: $viewModel.fromDate, in: ...Date(), displayedComponents: .date)
                    DatePicker("To Date", selection: $viewModel.toDate, in: ...Date(), displayedComponents: .date)
                    
                    Button(action: { fetchNews() }) {
                        Text("Search")
                    }
                }
                .searchable(text: $viewModel.query, prompt: "Searching for ...")
                List {
                    ForEach(viewModel.articles) { article in
                        NavigationLink(destination: ArticleView(article: article)) {
                            ArticleView(article: article)
                        }
                    }
                    .navigationBarTitle("News")
                }
            }
            .onAppear { fetchNews() }
        }
    }
    
    func fetchNews() {
        viewModel.fetchNews()
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

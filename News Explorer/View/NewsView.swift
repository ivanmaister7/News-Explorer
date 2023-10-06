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
                    List {
                        ForEach(viewModel.articles) { article in
                            NavigationLink(destination: ArticleView(article: article)) {
                                ArticleRowView(article: article)
                            }
                        }
                    }
                }
                .searchable(text: $viewModel.query, prompt: "Searching for ...")
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        
                        HStack {
                            Menu("Sort") {
                                Button("Relevancy", action: { fetchSortNews(sortBy: .relevancy) })
                                Button("Popularity", action: { fetchSortNews(sortBy: .popularity) })
                                Button("PublishedAt", action: { fetchSortNews(sortBy: .publishedAt) })
                            }
                            DatePicker("", selection: $viewModel.fromDate, in: ...Date(), displayedComponents: .date)
                            
                            Text(" - ")
                            
                            DatePicker("", selection: $viewModel.toDate, in: ...Date(), displayedComponents: .date)
                            
                            Spacer()
                            
                            Button(action: { fetchNews() }) {
                                Image(systemName: "magnifyingglass.circle")
                            }
                        }
                    }
                }
            }
        }
    }
    
    func fetchNews() {
        viewModel.fetchNews()
    }
    
    func fetchSortNews(sortBy: SortType) {
        viewModel.sortBy = sortBy
        fetchNews()
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

//
//  ApiViewModel.swift
//  StellarAPIUpdate
//
//  Created by Elliot Knight on 30/11/2022.
//

import SwiftUI

class ApiViewModel: ObservableObject {
	@Published var articles = [ArticleElement]()
	
	@MainActor func getArticles() {
		Task {
			do {
				articles = try await ArticleApi.fetchArticleAPI()
			} catch {
				print("Cant fetch data: \(error.localizedDescription)")
			}
		}
	}
}

//
//  ArticleAPI.swift
//  StellarAPIUpdate
//
//  Created by Elliot Knight on 02/12/2022.
//

import Foundation

struct ArticleApi {
	enum ArticleApiError: Error { case outOfBounds, someThingWentWrong, wrongURL, decodingError }

	public static func fetchArticleAPI() async throws -> [ArticleElement] {
		let url = "https://apod.ellanan.com/api?start_date=2022-02-28&end_date=2022-05-01"

		guard let url = URL(string: url) else { throw ArticleApiError.wrongURL }

		let (data, response) = try await URLSession.shared.data(from: url)

		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			throw ArticleApiError.outOfBounds
		}

		do {
			return try JSONDecoder().decode([ArticleElement].self, from: data)
		} catch {
			throw ArticleApiError.decodingError
		}
	}
}

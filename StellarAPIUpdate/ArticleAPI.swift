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

// MARK: Extension for conform to async api call from iOS 13

extension URLSession {
	@available(iOS, deprecated: 15.0, message: "This extension is no longer necessary. Use API built into SDK")
	func data(from url: URL) async throws -> (Data, URLResponse) {
		try await withCheckedThrowingContinuation { continuation in
			let task = self.dataTask(with: url) { data, response, error in
				guard let data = data, let response = response else {
					let error = error ?? URLError(.badServerResponse)
					return continuation.resume(throwing: error)
				}
				continuation.resume(returning: (data, response))
			}
			task.resume()
		}
	}
}

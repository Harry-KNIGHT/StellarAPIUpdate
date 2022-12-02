//
//  UrlSession.swift
//  StellarAPIUpdate
//
//  Created by Elliot Knight on 02/12/2022.
//

import Foundation

// MARK: Extension for conform to async api call from iOS 13

extension URLSession {
	@available(iOS, deprecated: 15.0, message: "This extension is no longer necessary. Use API built into SDK")
	public func data(from url: URL) async throws -> (Data, URLResponse) {
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

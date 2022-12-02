//
//  ArticleModel.swift
//  StellarAPIUpdate
//
//  Created by Elliot Knight on 30/11/2022.
//

import Foundation

struct ArticleElement: Codable {
	let title, explanation, date: String
	let hdurl: String?
	let serviceVersion: ServiceVersion
	let copyright: String?
	let mediaType: MediaType
	let url: String
	let credit: String?

	enum CodingKeys: String, CodingKey {
		case title, explanation, date, hdurl
		case serviceVersion = "service_version"
		case copyright
		case mediaType = "media_type"
		case url, credit
	}
}

enum MediaType: String, Codable {
	case image = "image"
	case video = "video"
}

enum ServiceVersion: String, Codable {
	case v1 = "v1"
}

typealias Article = [ArticleElement]

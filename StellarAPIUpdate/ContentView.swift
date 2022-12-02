//
//  ContentView.swift
//  StellarAPIUpdate
//
//  Created by Elliot Knight on 30/11/2022.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var apiVM: ApiViewModel
	var body: some View {
		NavigationView {
			List {
				ForEach(apiVM.articles, id: \.title) { article in
					Text(article.title)
				}
			}
			.navigationTitle("Articles")
			.onAppear {
				apiVM.getArticles()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.environmentObject(ApiViewModel())
	}
}

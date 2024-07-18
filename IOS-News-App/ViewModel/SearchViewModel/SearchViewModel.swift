//
//  SearchViewModel.swift
//  IOS-News-App
//
//  Created by Bholanath Barik on 19/07/24.
//

import Foundation

class SearchViewModel : ObservableObject {
    @Published var searchText = ""
    
    func clearSearch() {
        self.searchText = "";
    }
    
    func storeSearch(Search : String) {
        self.searchText = Search;
    }
}

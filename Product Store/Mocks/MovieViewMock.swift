//
//  MovieViewMock.swift
//  Product StoreTests
//
//  Created by Ahmed Elmemy on 22/10/2022.
//
import Foundation

class MovieViewMock:MovieView{
    
    var fetchingDataSuccessCalled = false
    var showErrorCalled = false
    var noDataIsCalled = false

    func fetchingDataSuccess() {
        fetchingDataSuccessCalled = true
    }
    
    func showEror(error: String) {
        showErrorCalled = true
    }
    
    func NoData() {
        noDataIsCalled = true
    }
    
    
    
}

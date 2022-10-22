//
//  MoviePresnterTest.swift
//  Product StoreTests
//
//  Created by Ahmed Elmemy on 22/10/2022.
//
import XCTest
@testable import Product_Store

final class MoviePresnterTest: XCTestCase {
    
    var moviesPresenter: MoviePresenterImplementation!
    var interactor:MoviesInteractorMock!
    var movieView:MovieViewMock!

    override func setUp() {
        let moviesModel = createMoviesModel()
        
        movieView = MovieViewMock()
        interactor = MoviesInteractorMock(failFetchingData: false, returnedModel: moviesModel)
        moviesPresenter = MoviePresenterImplementation(view: movieView, router: nil, interactor: interactor)
    }
    
    
    override func tearDown() {
        moviesPresenter = nil
    }
    
    
    func testPresenterGetData_WithData_CallsFetchDataSuccess(){
        //Given
        interactor.failFetchingData = false
        
        //when
        moviesPresenter.getData()
        
        //then
        XCTAssertTrue(movieView.fetchingDataSuccessCalled)
        XCTAssertFalse(movieView.showErrorCalled)
    }
    
    
    func testPresenterGetData_WithError_CallsShowError(){
        
        //Given
        interactor.failFetchingData = true
        
        //When
        moviesPresenter.getData()
        
        //Then
        XCTAssertTrue(movieView.showErrorCalled)
        XCTAssertFalse(movieView.fetchingDataSuccessCalled)
    }
    
    
    func testPresenterGetData_WithNillResult_CallsNoData(){
        
        //Given
        interactor.failFetchingData = false
        interactor.returnedModel = nil
        
        //When
        moviesPresenter.getData()
        
        //Then
        XCTAssertTrue(movieView.noDataIsCalled)
    }
    
    
    func testPresenterGetData_WithEmptyResult_CallsNoData(){
        
        //Given
        let data = createMoviesModelWithEmptyArray()
        interactor.failFetchingData = false
        interactor.returnedModel = data
        
        //When
        moviesPresenter.getData()
        
        //Then
        XCTAssertTrue(movieView.noDataIsCalled)
    }
    
}


private extension MoviePresnterTest{
    
    func createMoviesModel() -> MoviesModel {
        
        let movie = Movie(id: 1, titleEnglish: "titleEngilsh", descriptionFull: "descriptionFull", largeCoverImage: "largeCoverImage", rating: 5.0)
        
        let movies = Movies(movieCount: 1, limit: 20, page_number: 1, movies: [movie])
        
        let moviesModel = MoviesModel(status: "true", status_message: "succsess", data: movies)
        
        return moviesModel
    }
    
    func createMoviesModelWithEmptyArray() -> MoviesModel {
        
        let movies = Movies(movieCount: 1, limit: 20, page_number: 1, movies: [])
        
        let moviesModel = MoviesModel(status: "true", status_message: "succsess", data: movies)
        
        return moviesModel
    }
}

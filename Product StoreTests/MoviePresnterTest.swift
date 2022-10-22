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
    
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        moviesPresenter = nil
    }
    
    
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
    
    func testPresenterGetDataFunctionWithData(){
        
        let movieView = MovieViewMock()
        
        let moviesModel = createMoviesModel()
        let interactor = MoviesInteractorMock(failFetchingData: false, returnedModel: moviesModel)
        
        moviesPresenter = MoviePresenterImplementation(view: movieView, router: nil, interactor: interactor)
        
        moviesPresenter.getData()
        
        // TESTING PRESENTER GET data function while interactor return data
        XCTAssertTrue(movieView.fetchingDataSuccessCalled)
        XCTAssertFalse(movieView.showErrorCalled)
    }
    
    
    func testPresenterGetDataFunctionWithError(){
        
        let movieView = MovieViewMock()
        
        
        let moviesModel = createMoviesModel()
        let interactor = MoviesInteractorMock(failFetchingData: false, returnedModel: moviesModel)
        
        moviesPresenter = MoviePresenterImplementation(view: movieView, router: nil, interactor: interactor)
        
        
        // TESTING PRESENTER GET data function while interactor return error
        interactor.returnedModel = nil
        interactor.failFetchingData = true
        moviesPresenter.getData()
        XCTAssertTrue(movieView.showErrorCalled)
        XCTAssertFalse(movieView.fetchingDataSuccessCalled)
    }
    
    
    func testPresenterGetDataFunctionWithNilResult(){
        
        let movieView = MovieViewMock()
        
        let interactor = MoviesInteractorMock(failFetchingData: false, returnedModel: nil)
        
        moviesPresenter = MoviePresenterImplementation(view: movieView, router: nil, interactor: interactor)
        
        
        // Testing Presenter getData while there is nil
        moviesPresenter.getData()
        XCTAssertTrue(movieView.noDataIsCalled)
    }
    
    func testPresenterGetDataFunctionWithEmptyResult(){
        
        let movieView = MovieViewMock()
        let moviesModel = createMoviesModelWithEmptyArray()
        
     
        let interactor = MoviesInteractorMock(failFetchingData: false, returnedModel: moviesModel)
        
        moviesPresenter = MoviePresenterImplementation(view: movieView, router: nil, interactor: interactor)
        
        
        // Testing Presenter getData while there is no data
        moviesPresenter.getData()
        XCTAssertTrue(movieView.noDataIsCalled)
    }
}

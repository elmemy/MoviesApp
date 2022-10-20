//
//  MoviePresenter.swift
//  Product Store
//
//  Created by Ahmed Elmemy on 20/10/2022.
//

import Foundation


protocol MovieView: AnyObject{
    func fetchingDataSuccess()
    func showEror(error:String)
    func NoData()
}


protocol MovieCellView {
    func configCell(movieModel:Movie)
}

protocol MoviePresenter {
    func viewDidLoad()
    func getMoreData()
    func configure(cell: MovieCellView, forRow row: Int)
    func numberOfRow() -> Int
    func didSelect(index: Int)
    func isPagination() -> Bool
    func reloadDataFromRefreshControl()
}

class MoviePresenterImplementation: MoviePresenter {
    
    
    fileprivate weak var view: MovieView?
    internal let router: MovieRouter
    internal let interactor : MovieInteractor
    
    private var movieModel =  [Movie]()
    private var page: Int = 1
    private var isPaginate = true
    
    
    init(view: MovieView,router: MovieRouter,interactor:MovieInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    
    func viewDidLoad() {
        getData()
    }
    
    
    func getData(){
        self.interactor.getData(page: self.page){[weak self] data,error in
            guard let self = self else {return}
            if let error = error{
                self.view?.showEror(error: error.localizedDescription)
            }else{
                guard let data = data else {return}
                self.page += 1
                self.movieModel = data.data?.movies ?? []
                
                if !self.movieModel.isEmpty{
                    self.view?.fetchingDataSuccess()
                }else{
                    self.view?.NoData()
                }
            }
        }
        
    }
    
    
    func getMoreData() {
        self.interactor.getData(page: self.page){[weak self] data,error in
            guard let self = self else {return}
            if let error = error{
                self.view?.showEror(error: error.localizedDescription)
            }else{
                guard let data = data else {return}
                self.page += 1
                self.movieModel += data.data?.movies ?? []
                //check Pagination
                if (data.data?.movieCount) ?? 0 == self.movieModel.count{
                    self.isPaginate = false
                }else{
                    self.isPaginate = true
                }
                
                
                if !self.movieModel.isEmpty{
                    self.view?.fetchingDataSuccess()
                }
            }
        }
    }
    
    
    func reloadDataFromRefreshControl() {
        self.page = 1
        self.movieModel = []
        getData()
    }
    
    
    
    
    func numberOfRow() -> Int {
        self.movieModel.count
    }
    
    
    func isPagination() -> Bool {
        return  self.isPaginate
    }
    
    func didSelect(index: Int) {
        let movie = self.movieModel[index]
        router.goToMovieDetails(movieModel: movie)
    }
    
    func configure(cell: MovieCellView, forRow row: Int) {
        let movie = self.movieModel[row]
        cell.configCell(movieModel: movie)
    }
    
    
    
    
}



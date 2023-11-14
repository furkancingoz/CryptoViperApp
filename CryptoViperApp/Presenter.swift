//
//  Presenter.swift
//  CryptoViperApp
//
//  Created by Furkan Cingöz on 12.11.2023.
//

import Foundation

//MARK: TO DO LIST
//Class, protocol
// talks to -> interactor,view,router


enum NetworkError : Error {
  case NetworkFailed
  case ParsingFailed
}



protocol AnyPresenter {
  var router : AnyRouter? {get set}
  var interactor : AnyInteractor? {get set}
  var view : AnyView? {get set}

  func didDownloadCrypto(result : Result<[Crypto],Error>)
}

class CryptoPresenter : AnyPresenter {
  var router: AnyRouter?
  
  var interactor: AnyInteractor?
  
  var view: AnyView?
  
  func didDownloadCrypto(result: Result<[Crypto], Error>) {
    switch result {
    case .success(let cryptos):
      //view update
      print("updated")
    case .failure(let error):
      //view update error
      print("fatal :D error")
    }
  }
  

}

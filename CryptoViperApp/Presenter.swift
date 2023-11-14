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
  
  var interactor: AnyInteractor? {
    didSet {
      interactor?.downloadCryptos()
    }
  }


  var view: AnyView?
  
  func didDownloadCrypto(result: Result<[Crypto], Error>) {
    switch result {
    case .success(let cryptos):
      //view update
      view?.update(wtih: cryptos)
    case .failure(_):
      //view update error
      view?.update(with: "Try again later")
    }
  }
  

}

//
//  Interactor.swift
//  CryptoViperApp
//
//  Created by Furkan Cingöz on 12.11.2023.
//

import Foundation

//MARK: TO DO LIST
//Class, protocol
//talks to -> presenter


protocol AnyInteractor{
  var presenter : AnyPresenter? {get set}

  func downloadCryptos()
}

class CryptoInteractor : AnyInteractor {
  var presenter: AnyPresenter?

  func downloadCryptos() {
    guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json") else {
      return
    }
    let task = URLSession.shared.dataTask(with: url) { data, response, error in

      guard let data = data, error == nil else {
        self.presenter?.didDownloadCrypto(result: .failure(NetworkError.NetworkFailed))
        return
      }
      
      do {
        let cryptos = try JSONDecoder().decode([Crypto].self , from: data)
        self.presenter?.didDownloadCrypto(result: .success(cryptos))

      } catch {
        self.presenter?.didDownloadCrypto(result: .failure(NetworkError.ParsingFailed))
      }
    }
    task.resume()
  }
}

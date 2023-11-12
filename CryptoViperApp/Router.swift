//
//  Router.swift
//  CryptoViperApp
//
//  Created by Furkan Cingöz on 12.11.2023.
//

import Foundation

//MARK: TO DO LIST
//class, prtocol
//entrypoint

protocol AnyRouter {
  static func startExecution() -> AnyRouter
}

class CryptoRouter : AnyRouter {

  static func startExecution() -> AnyRouter {
    let router = CryptoRouter()

    return router
  }

}

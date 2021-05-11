//
//  TrackViewDelegateProtocol.swift
//  TickiOSCodeChallenge
//
//  Created by Oladipupo Oluwatobi on 10/05/2021.
//

import Foundation

protocol NewsViewDelegateProtocol: AnyObject {
    func successGetNews(response:NewsResponseModel)
    func errorHandler(error: NewsError)
}

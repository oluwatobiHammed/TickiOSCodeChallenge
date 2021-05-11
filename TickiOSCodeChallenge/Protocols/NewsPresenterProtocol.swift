//
//  TrackPresenterProtocol.swift
//  TickiOSCodeChallenge
//
//  Created by Oladipupo Oluwatobi on 10/05/2021.
//

import Foundation
import UIKit
protocol NewsPresenterProtocol: AnyObject {
    init( webservice: NewsWebServiceProtocol,
    delegate: NewsViewDelegateProtocol)
    func processNews()
    //func processTrackCell(imageUrl: String, imageView: UIImageView)
}

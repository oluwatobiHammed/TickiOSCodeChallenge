//
//  NewsPresenter.swift
//  TickiOSCodeChallenge
//
//  Created by Oladipupo Oluwatobi on 10/05/2021.
//

import UIKit
import Foundation
class NewsPresenter: NewsPresenterProtocol {
    
  
    
    private var webservice: NewsWebServiceProtocol
    private weak var delegate: NewsViewDelegateProtocol?
    
    
    required init(webservice: NewsWebServiceProtocol,
         delegate: NewsViewDelegateProtocol) {
        self.webservice = webservice
        self.delegate = delegate
    }
    
    func processNews() {
        
        
        
        webservice.getNews(methodFor: .GET, completionHandler: { [weak self]  (responseModel, error) in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                return
            }
            
            if let responseModel = responseModel {
                self?.delegate?.successGetNews(response: responseModel)
            }

        })
   
    }
//    func processTrackCell(imageUrl: String,imageView: UIImageView ) {
//        imageView.downloadImage(url: imageUrl)
//
//    }
  
}


//
//  ContentView.swift
//  TickiOSCodeChallenge
//
//  Created by Oladipupo Oluwatobi on 10/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    var body: some View {
        Text("\(viewModel.news.count)")
            .padding().onAppear(perform: {
                viewModel.getNews()
            })
      
    }
    
    
  
    
}

extension ContentView {
    
    class ViewModel: ObservableObject, NewsViewDelegateProtocol {
        @Published var news = [Result]()
        var newsPresenter : NewsPresenterProtocol?
        
        func getNews() {
            if newsPresenter == nil {
                let webservice = NewsWebService(urlString: NewsConstants.newsURLString)
                
                newsPresenter = NewsPresenter(webservice: webservice, delegate: self)
            }
            
            newsPresenter?.processNews()

        }
        
        func successGetNews(response: NewsResponseModel) {
            print(response)
            DispatchQueue.main.async {
                self.news = response.response.results
            }
        }
        
        func errorHandler(error: NewsError) {
            print(error)
        }
        
         
       
        
    
        
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

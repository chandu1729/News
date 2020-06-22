//
//  NewsAPI.swift
//  News
//
//  Created by chandrasekhar yadavally on 6/18/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

class NewsAPI: API {
    private let baseUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey="
    private let APIKey = "354dacfa04aa4ab7801d9695acbd4650"
        
    func getArticles() -> [Article] { [Article]() }
    
    func getArticles(_ completion: @escaping (Result<Articles, ErrorMessage>) -> Void) {
        let endPoint = baseUrl + APIKey
        guard let url = URL(string: endPoint) else {
            completion(.failure(.invalidUrl))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(.connectionError))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let articles = try decoder.decode(Articles.self, from: data)
                completion(.success(articles))
                
            } catch {
                completion(.failure(.invalidData))
            }
        }.resume()
    }
}


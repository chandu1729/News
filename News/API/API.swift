//
//  API.swift
//  News
//
//  Created by chandrasekhar yadavally on 6/16/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

protocol API {
    func getArticles() -> [Article]
    func getArticles(_ completion: @escaping (Result<Articles, ErrorMessage>) -> Void)
}

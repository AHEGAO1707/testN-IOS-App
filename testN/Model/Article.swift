//
//  Article.swift
//  testN
//
//  Created by rokdan32 on 18.06.2024.
//

import Foundation

struct Article{
    var autor: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var sourceName: String
    
    init(dictionary: Dictionary<String, Any>){
        autor = dictionary["autor"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        
        sourceName = (dictionary["autor"] as? Dictionary<String,Any> ?? ["":""])["name"] as? String ?? ""
    }
}

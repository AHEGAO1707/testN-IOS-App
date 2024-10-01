//
//  Model.swift
//  testN
//
//  Created by rokdan32 on 18.06.2024.
//

import Foundation

var articles: [Article]{
    let data = try? Data(contentsOf: urlToData)
    if data==nil{return []}		
    
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!,options: .allowFragments)
    if rootDictionaryAny == nil{return []}	
    
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil{return []}
    
    
    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>]{
        var returnArray: [Article]=[]
        for dict in array {
            let newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
        }
        return returnArray
    }
    return []
}
var urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath		
}

func loadNews(completionHandler: (()->Void)?) {
    let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2024-06-17&to=2024-06-17&sortBy=popularity&apiKey=d3305c8d9def4062a9ad3485485ba879")
    let session = URLSession(configuration: .default)
    let downloadTask = session.downloadTask(with: url!){ (urlFile, responce, error) in
        if urlFile != nil{

            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            completionHandler?()
        }
    }
    downloadTask.resume()
}


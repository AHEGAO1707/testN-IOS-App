//
//  OneNewsViewController.swift
//  testN
//
//  Created by rokdan32 on 18.06.2024.
//

import UIKit
import SafariServices
class OneNewsViewController: UIViewController {
    
    var index: Int = 0

    var article: Article!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelTitle: UILabel!

    @IBOutlet weak var openInSafari: UIButton!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func pushOpenAction(_ sender: Any) {
        if let url = URL(string: article.url){
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text=article.title
        if let description = article?.description {
            let processedDescription = description.replacingOccurrences(of: "\n{3,}", with: "\n\n", options: .regularExpression, range: nil)
            labelDescription.text = processedDescription
        }

        if let url = URL(string: self.article.urlToImage) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            }
        }

        if URL(string: article.url) == nil {
            openInSafari.isEnabled=true
        }


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

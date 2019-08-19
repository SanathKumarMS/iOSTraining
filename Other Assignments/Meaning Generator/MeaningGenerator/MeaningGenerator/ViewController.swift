//
//  ViewController.swift
//  MeaningGenerator
//
//  Created by Sanath Kumar M S on 16/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    struct Root: Decodable {
        let results: [Result]
    }
    struct Result: Codable {
        let lexicalEntries: [Lexical]
    }
    struct Lexical: Codable {
        let entries: [Entry]
    }
    struct Entry: Codable {
        let senses: [Sense]
    }
    struct Sense: Codable {
        let definitions: [String]
        let subsenses: [Subsenses]?
    }
    struct Subsenses: Codable{
        let definitions: [String]
    }
    
    @IBOutlet weak var textField: UITextField!
    var word: String = ""
    let appId = "3368cc95"
    let appKey = "6eff7222080e11be4cf86bdb0772702a"
    let apiurl = "https://od-api.oxforddictionaries.com/api/v2/"
    let language_code = "en-gb"
    let endpoint = "entries"
    let fields = "definitions"
    let strictMatch = "false"
    let word_id = "sinister"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.textField.delegate = self
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        
        
    }
    
    
    func textFieldShouldReturn(_ textField : UITextField) -> Bool
    {
        //print("Inside return")
        textField.resignFirstResponder()
        return true
    }
    
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        print("Should Begin Editing")
//        return true
//    }
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        print("Should End editing")
//        return true
//    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("\n\n")
        word = textField.text ?? "Did not read"
        print("Word is : \(word)")
        
        guard let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v2/entries/\(language_code)/\(word)?fields=\(fields)&strictMatch=\(strictMatch)") else { return }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")
        
        let session = URLSession.shared.dataTask(with: request, completionHandler: { data,response,error in
            
            if let error = error{
                print(error)
            }
            if let response = response, let data = data{
                
                do {
                    //print(String(data: data, encoding: .utf8) ?? "")
                    let root = try JSONDecoder().decode(Root.self, from: data)
                    let results = root.results
                    for result in results {
                        for lexical in result.lexicalEntries {
                            for entry in lexical.entries {
                                for sense in entry.senses {
                                    for definition in sense.definitions {
                                        print("Meaning : \(definition)")
                                    }
                                    if let subsenses = sense.subsenses{
                                        for subsense in subsenses{
                                            print("Meaning : \(subsense.definitions[0])")
                                        }
                                    }
                                }
                            }
                        }
                    }
                } catch {
                    print("Error : \(error)")
                }
            }
//                if let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSDictionary{
//                    let temp = jsonData["results"] as! NSArray
//
//                    let first = temp[0] as! NSDictionary
//
//                    let lexicalEntries = first["lexicalEntries"] as! NSArray
//
//                    let firstLexicalEntry = lexicalEntries[0] as! NSDictionary
//
//                    let entries = firstLexicalEntry["entries"] as! NSArray
//
//                    let firstEntry = entries[0] as! NSDictionary
//
//                    let senses = firstEntry["senses"] as! NSArray
//
//                    let firstSense = senses[0] as! NSDictionary
//
//                    let definitions = firstSense["definitions"] as! NSArray
//
//                    let meaning = definitions[0]
//                    print("Meaning : \(meaning)")
//
//                    let subsenses = firstSense["subsenses"] as! NSArray
//
//                    for item in subsenses{
//                        let otherDefinitions = item as! NSDictionary
//                        let otherMeanings = otherDefinitions["definitions"] as! NSArray
//                        print("Other Meanings : \(otherMeanings[0])")
//                    }
//
//                }
//            }
//            else
//            {
//                print("Error in data")
//            }
        })
        session.resume()
    }

}


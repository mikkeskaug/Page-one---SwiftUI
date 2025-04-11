//
//  XMLParser extension.swift
//  Page one - SwiftUI
//
//  Created by Jon Mikael Skaug on 07/06/2022.
//

import Foundation
import Combine
import SwiftUI



extension XMLParser: XMLParserDelegate {
   
    
    public func startParsingWithContentsOfURL(rssURL: URL){
        let parser = XMLParser(contentsOf: rssURL)
        parser?.delegate = self
        parser?.parse()
    }
    
    //MARK:- XML Delegate methods
    
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
  
        parseElements().currentParsingElement = elementName
       
        if elementName == "fmresultset" {
            
            
        }
        
        if elementName == "field" {
            
            let dict = NSMutableDictionary(dictionary: attributeDict)

            let enumerator = dict.keyEnumerator()
            
            while let key = enumerator.nextObject() {
                let value = dict.object(forKey: key)
                
                attribute = value as! String
                
            }
            
        }
        if elementName == "HeroTableView"{
           count += 1
        }
        
        else if elementName == "SecondaryHeroTableView"{
            count += 1
        }
        else if elementName == "item"{
            count+=1
            //tempArray.removeAll()
           
        }
        
        
       

    }

    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        let foundedChar = string.trimmingCharacters(in:NSCharacterSet.whitespacesAndNewlines)
        
        
        if (!foundedChar.isEmpty) {
            
            item.setValue(foundedChar, forKey: attribute)
          
        }
        
        if count == 1 {
            
            if (!foundedChar.isEmpty){
                HeroArray.append(foundedChar)
                print(foundedChar)
            }
            
        }
        
        if count == 2 {
            
            if (!foundedChar.isEmpty){
                SecondaryHeroArray.append(foundedChar)
                
            }
            
        }
        else if count >= 3{
            if (!foundedChar.isEmpty){
                //SecondaryHeroArray.append(foundedChar)
                /*if foundedChar.contains("https://pageone.no/wp-content"){
                    var imageURL = URL(string: "")
                    
                    
                    imageURL = URL(string: string)
                    if let data = try? Data(contentsOf: imageURL!) {
                        // Create Image and Update Image View
                        //print(data)
                        let image = UIImage(data: data)
                        // images.append(image!)
                        
                    }
                    else{
                        //print("error")
                    }
                }
                
                
                
                else {
                    tempArray.append(string)
                    
                }*/
                tempArray.append(string)
            }
            
            
        }
        
        //print(aktueltDict)
    }

    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "fmresultset" {
            
     
        }
        
        else if elementName == "item" {
            aktueltDict[count] = tempArray
            
            tempArray.removeAll()
        }
        
    }
    
    public func parserDidEndDocument(_ parser: XMLParser) {
        
        
      
        
        if (item.object(forKey: "Deler") != nil){
        tekst = item.object(forKey: "Deler") as! String
        }
        else{
            tekst = "Beklager. Vi finner ingen serviceordre."
        }
    }
    
}









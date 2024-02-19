//
//  StringExtension.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 17.02.2024.
//

import Foundation
import UIKit

extension String {
  func localized() -> String {
    return NSLocalizedString(self, comment: "")
  }
  
  func widthOfString(usingFont font: UIFont) -> CGFloat {
    let fontAttributes = [NSAttributedString.Key.font: font]
    let size = self.size(withAttributes: fontAttributes)
    
    return size.width
  }
  
  func heightOfString(usingFont font: UIFont) -> CGFloat {
    let fontAttributes = [NSAttributedString.Key.font: font]
    let size = self.size(withAttributes: fontAttributes)
    
    return size.height
  }
  
  func sizeOfString(usingFont font: UIFont) -> CGSize {
    let fontAttributes = [NSAttributedString.Key.font: font]
    
    return self.size(withAttributes: fontAttributes)
  }
}

extension String {
  var htmlToAttributedString: NSAttributedString? {
    guard let data = data(using: .utf8) else { return nil }
    do {
      return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
    } catch {
      return nil
    }
  }
  var htmlToString: String {
    return htmlToAttributedString?.string ?? ""
  }
}

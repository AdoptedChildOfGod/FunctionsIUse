//
//  File.swift
//  
//
//  Created by Shannon Draeker on 9/17/20.
//

import UIKit

extension UILabel {
    convenience init(text: String,
                     color: UIColor = .white,
                     fontSize: CGFloat = 18,
                     fontName: FontNames = .regular,
                     alignment: NSTextAlignment = .left,
                     autoResize: Bool = true,
                     numberOfLines: Int = 0) {
        self.init()
        setUpViews(text, color: color, fontSize: fontSize, fontName: fontName, alignment: alignment, autoResize: autoResize, numberOfLines: numberOfLines)
    }
    
    /// A helper function to format the usual properties of a label
    func setUpViews(_ text: String?,
                    color: UIColor = .white,
                    fontSize: CGFloat = 18,
                    fontName: FontNames = .regular,
                    alignment: NSTextAlignment = .left,
                    autoResize: Bool = true,
                    numberOfLines: Int = 0) {
        self.text = text
        
        // Color
        textColor = color
        
        // Font
        if let customFont = UIFont(name: fontName.rawValue, size: fontSize) {
            font = customFont
        } else { font = UIFont(name: font.familyName, size: fontSize) }
        
        // Alignment
        textAlignment = alignment
        self.numberOfLines = numberOfLines
        
        // Automatically resize as necessary
        adjustsFontSizeToFitWidth = autoResize
    }
    
    /// Add an image before or after the text of a label
    func addImage(image: UIImage?, afterLabel: Bool = false) {
        guard let image = image else { return }
        let attachment = NSTextAttachment()
        attachment.image = image
        // attachment.bounds = CGRect(x: 0, y: 0, width: intrinsicContentSize.height / 2, height: intrinsicContentSize.height / 2)
        let attachmentString = NSAttributedString(attachment: attachment)
        
        let startingText = self.text ?? ""
        
        if afterLabel {
            let strLabelText = NSMutableAttributedString(string: "\(startingText) ")
            strLabelText.append(attachmentString)
            
            self.attributedText = strLabelText
        } else {
            let strLabelText = NSAttributedString(string: " \(startingText)")
            let mutableAttachmentString = NSMutableAttributedString(attributedString: attachmentString)
            mutableAttachmentString.append(strLabelText)
            
            self.attributedText = mutableAttachmentString
        }
    }
    
    func addImageToText(image: UIImage?, text: NSMutableAttributedString, afterLabel: Bool = false) -> NSMutableAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = image
        let attachmentString = NSAttributedString(attachment: attachment)
        let strLabelText = text
        
        if afterLabel {
            strLabelText.append(attachmentString)
            return strLabelText
        } else {
            let mutableAttachmentString = NSMutableAttributedString(attributedString: attachmentString)
            mutableAttachmentString.append(strLabelText)
            
            return mutableAttachmentString
        }
    }
    
    /// Add spacing between the letters of a word
    func addCharacterSpacing(_ kernValue: Double = 1.2) {
      if let labelText = text, !labelText.isEmpty {
        let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue,
                                      range: NSRange(location: 0, length: attributedString.length - 1))
        attributedText = attributedString
      }
    }
    
    /// Change the font size
    func changeSize(to fontSize: CGFloat) {
        font = UIFont(name: font.familyName, size: fontSize)
    }
}

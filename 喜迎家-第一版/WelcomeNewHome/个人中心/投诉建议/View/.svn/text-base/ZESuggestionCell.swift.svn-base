//
//  ZESuggestionCell.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/12.
//  Copyright © 2016年 TH. All rights reserved.
//
typealias suggestBlock1 = (String)->()
typealias suggestBlock2 = (String)->()
typealias suggestBlock3 = (String)->()
import UIKit

class ZESuggestionCell: UITableViewCell,UITextViewDelegate {

    @IBOutlet weak var suggestionTV: UITextView!
    @IBOutlet weak var nameTV: UITextView!
    @IBOutlet weak var phoneNumTV: UITextView!
    @IBOutlet weak var wordCountLab: UILabel!
    var block1: suggestBlock1?
    var block2: suggestBlock2?
    var block3: suggestBlock3?
    let tipLab = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.None
        setupUI()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(){
        
        tipLab.frame = CGRectMake(0, 0, 150, 30)
        tipLab.text = "  请留下您的宝贵意见"
        tipLab.backgroundColor = UIColor.clearColor()
        tipLab.textColor = UIColor.init(hexString: "282828")
        tipLab.font = UIFont.systemFontOfSize(14)
        suggestionTV.addSubview(tipLab)
        //suggestionTV.text = " 请留下您的宝贵意见"
        
        suggestionTV.textColor = UIColor.init(hexString: "282828")
        suggestionTV.font = UIFont.systemFontOfSize(14)
        nameTV.textColor = UIColor.init(hexString: "282828")
        nameTV.font = UIFont.systemFontOfSize(14)
        phoneNumTV.textColor = UIColor.init(hexString: "282828")
        phoneNumTV.font = UIFont.systemFontOfSize(14)
        suggestionTV.delegate = self;
        nameTV.delegate = self
        phoneNumTV.delegate = self

    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        
        tipLab.removeFromSuperview()
    }
    
    func textViewDidChange(textView: UITextView){
        
        if textView.tag == 100 {
            wordCountLab.text = "\(textView.text.characters.count)/70"
            self.block1!(textView.text)
        }else if textView.tag == 200{
            self.block2!(textView.text)
        }else{
            self.block3!(textView.text)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for subView in self.contentView.subviews{
            if subView.isKindOfClass(UITextView){
                subView.resignFirstResponder()
                
            }
        }
    }
}

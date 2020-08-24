//
//  CheckBox.swift
//  ActionSheetPicker-3.0
//
//  Created by Andy Tamilo on 11/27/17.
//

import UIKit

@IBDesignable
public class CheckBox: UIControl {
    
    let imageView: UIImageView
    
    @IBInspectable public var on: Bool = false {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable public var insets: Int = 0 {
        didSet {
            updateView()
        }
    }
    
    public override init(frame: CGRect) {
        imageView = UIImageView()
        super.init(frame: frame)
        self.addSubview(imageView)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        imageView = UIImageView()
        super.init(coder: aDecoder)
        self.addSubview(imageView)
        setup()
    }
    
    override public func layoutSubviews() {
        let inset = CGFloat(insets)
        let size = bounds.width - inset*2
        imageView.frame.origin = CGPoint(x: inset, y: inset)
        imageView.frame.size = CGSize(width: size, height: size)
        super.layoutSubviews()
    }
    
    func setup() {
        imageView.contentMode = .scaleAspectFill
    }
    
    private func setImage(_ image: UIImage?) {
        imageView.image = image
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.layoutIfNeeded()
        self.updateView()
    }
    
    func updateView() {
        if on {
            self.setImage(UIImage(systemName: "checkmark.square"))
        } else {
            self.setImage(UIImage(systemName: "app"))
        }
    }
    
    func imageWithName(_ name: String) -> UIImage? {
        let bundle = Bundle(for: CheckBox.self)
        let image = UIImage(named: name, in: bundle, compatibleWith: nil)
        
        return image
    }
    
    func toggleSelected() {
        on = !on
        updateView()
    }
    
    override public func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        toggleSelected()
        self.sendActions(for: .valueChanged)
        super.endTracking(touch, with: event)
    }
    
}

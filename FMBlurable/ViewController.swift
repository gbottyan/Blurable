//
//  ViewController.swift
//  FMBlurable
//
//  Created by SIMON_NON_ADMIN on 18/09/2015.
//  Copyright © 2015 Simon Gladman. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    let stackView = UIStackView()
    let horizontalStackView = UIStackView()
    
    let segmentedControl = UISegmentedControl(items: ["AAA", "BBB", "CCC", "DDD"])
    let toggleSwitch = UISwitch()
    let slider = UISlider()
    let stepper = UIStepper()
    let unarrangedLabel = UILabel()
    let unarrangedButton = UIButton(type: UIButton.ButtonType.infoDark)
    let compositeComponent = SliderWidget(title: "Composite Component")
    
    let toolbar = UIToolbar()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        view.addSubview(toolbar)

        stackView.frame = view.frame.insetBy(dx: 50, dy: 200)
        
        stackView.axis = NSLayoutConstraint.Axis.vertical
       
        stackView.alignment = UIStackView.Alignment.fill
        stackView.distribution = UIStackView.Distribution.equalSpacing
        
        horizontalStackView.distribution = UIStackView.Distribution.fillEqually
        
        stackView.addArrangedSubview(segmentedControl)
        stackView.addArrangedSubview(slider)
        stackView.addArrangedSubview(horizontalStackView)
        stackView.addArrangedSubview(compositeComponent)
        
        horizontalStackView.addArrangedSubview(stepper)
        horizontalStackView.addArrangedSubview(toggleSwitch)
      
        unarrangedLabel.text = "Unarranged Label"

        view.addSubview(unarrangedLabel)
        
        unarrangedButton.setTitle("Unarranged Button", for: .normal)
        
        view.addSubview(unarrangedButton)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let toggleSegmentedControl = UIBarButtonItem(title: BarButtonLabel.SegmentedControl.rawValue, style: UIBarButtonItem.Style.plain, target: self, action: #selector(toolbarClickHandler(barButtonItem:)))
        
        let toggleToggleSwitch = UIBarButtonItem(title: BarButtonLabel.Switch.rawValue, style: UIBarButtonItem.Style.plain, target: self, action: #selector(toolbarClickHandler(barButtonItem:)))
        
        let toggleSlider = UIBarButtonItem(title: BarButtonLabel.Slider.rawValue, style: UIBarButtonItem.Style.plain, target: self, action: #selector(toolbarClickHandler(barButtonItem:)))
        
        let toggleStepper = UIBarButtonItem(title: BarButtonLabel.Stepper.rawValue, style: UIBarButtonItem.Style.plain, target: self, action: #selector(toolbarClickHandler(barButtonItem:)))
        
        let toggleUnarrangedLabel = UIBarButtonItem(title: BarButtonLabel.LabelOne.rawValue, style: UIBarButtonItem.Style.plain, target: self, action: #selector(toolbarClickHandler(barButtonItem:)))

        let toggleUnarrangedButton = UIBarButtonItem(title: BarButtonLabel.Button.rawValue, style: UIBarButtonItem.Style.plain, target: self, action: #selector(toolbarClickHandler(barButtonItem:)))
        
        let toggleCompositeComponent = UIBarButtonItem(title: BarButtonLabel.CompositeComponent.rawValue, style: UIBarButtonItem.Style.plain, target: self, action: #selector(toolbarClickHandler(barButtonItem:)))
        
        toolbar.setItems([toggleSegmentedControl, spacer,
            toggleToggleSwitch, spacer,
            toggleSlider, spacer,
            toggleStepper, spacer,
            toggleUnarrangedLabel, spacer,
            toggleUnarrangedButton, spacer,
            toggleCompositeComponent], animated: false)
    }

    @objc func toolbarClickHandler(barButtonItem: UIBarButtonItem)
    {
        guard let title = barButtonItem.title,
            let barButtonLabel = BarButtonLabel(rawValue: title) else
        {
            return
        }
        
        let widget: UIView
        
        switch barButtonLabel
        {
        case .SegmentedControl:
            widget = segmentedControl
        case .Switch:
            widget = toggleSwitch
        case .Slider:
            widget = slider
        case .Stepper:
            widget = stepper
        case .LabelOne:
            widget = unarrangedLabel
        case .Button:
            widget = unarrangedButton
        case .CompositeComponent:
            widget = compositeComponent
        }
        
        if widget.isBlurred
        {
            widget.unBlur()
        }
        else
        {
            widget.blur(radius: 2)
        }
    }
    
    override func viewDidLayoutSubviews()
    {
        stackView.frame = CGRect(x: 0,
            y: topLayoutGuide.length,
            width: view.frame.width,
            height: view.frame.height - topLayoutGuide.length).insetBy(dx: 50, dy: 50)

        toolbar.frame = CGRect(x: 0,
                               y: view.frame.height - toolbar.intrinsicContentSize.height,
            width: view.frame.width,
            height: toolbar.intrinsicContentSize.height)
        
        unarrangedButton.frame = CGRect(x: view.frame.width - unarrangedButton.intrinsicContentSize.width - 20,
            y: 20,
            width: unarrangedButton.intrinsicContentSize.width,
            height: unarrangedButton.intrinsicContentSize.height)
        
        unarrangedLabel.frame = CGRect(x: 20,
            y: 20,
            width: unarrangedLabel.intrinsicContentSize.width,
            height: unarrangedLabel.intrinsicContentSize.height)
    }
    
}

enum BarButtonLabel: String
{
    case SegmentedControl,
        Switch,
        Slider,
        Stepper,
        LabelOne,
        Button,
        CompositeComponent
}









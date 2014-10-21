//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Tony Morales on 10/20/14.
//  Copyright (c) 2014 Tony Morales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Containers
    
    var inventoryContainer: UIView!
    var purchaseContainer: UIView!
    var mixContainer: UIView!
    var sellContainer: UIView!
    
    // Container Labels
    
    var inventoryLabel: UILabel!
    var purchaseSectionLabel: UILabel!
    var mixSectionLabel: UILabel!
    var sellLabel: UILabel!
    
    // Static Information Labels
    
    var lemonPriceLabel: UILabel!
    var icePriceLabel: UILabel!
    var lemonsInMixLabel: UILabel!
    var iceInMixLabel: UILabel!
    var saleExplanationLabel: UILabel!
    
    // Variable Information Labels
    
    var bank: UILabel!
    var lemonInventory: UILabel!
    var iceInventory: UILabel!
    var lemonsToBeBought: UILabel!
    var iceToBeBought: UILabel!
    var lemonsInMix: UILabel!
    var iceInMix: UILabel!
    
    // Buttons
    
    var sellButton: UIButton!
    
    // Constants
    
    let kMarginForView:CGFloat = 10.0
    let kFourth:CGFloat = 1/4
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupContainerViews()
        setupInventoryContainer(inventoryContainer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupContainerViews() {
        inventoryContainer = UIView(frame: CGRectMake(view.bounds.origin.x + kMarginForView, view.bounds.origin.y, view.bounds.width - (kMarginForView * 2), view.bounds.height * kFourth))
        inventoryContainer.backgroundColor = UIColor.darkGrayColor()
        view.addSubview(inventoryContainer)
        
        purchaseContainer = UIView(frame: CGRectMake(view.bounds.origin.x + kMarginForView, inventoryContainer.frame.height, view.bounds.width - (kMarginForView * 2), view.bounds.height * kFourth))
        purchaseContainer.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(purchaseContainer)
        
        mixContainer = UIView(frame: CGRectMake(view.bounds.origin.x + kMarginForView, inventoryContainer.frame.height + purchaseContainer.frame.height, view.bounds.width - (kMarginForView * 2), view.bounds.height * kFourth))
        mixContainer.backgroundColor = UIColor.grayColor()
        view.addSubview(mixContainer)
        
        sellContainer = UIView(frame: CGRectMake(view.bounds.origin.x + kMarginForView, inventoryContainer.frame.height + purchaseContainer.frame.height + mixContainer.frame.height, view.bounds.width - (kMarginForView * 2), view.bounds.height * kFourth))
        view.addSubview(sellContainer)
    }
    
    func setupInventoryContainer(containerView: UIView) {
        inventoryLabel = UILabel()
        inventoryLabel.text = "You have:"
        inventoryLabel.textColor = UIColor.redColor()
        inventoryLabel.frame = CGRectMake(10, 25, 100, 50)
        inventoryLabel.sizeToFit()
        containerView.addSubview(inventoryLabel)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}


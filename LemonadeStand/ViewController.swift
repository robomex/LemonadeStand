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
        setupPurchaseContainer(purchaseContainer)
        setupMixContainer(mixContainer)
        setupSellContainer(sellContainer)
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
        
        bank = UILabel()
        bank.text = "$10"
        bank.textColor = UIColor.greenColor()
        bank.sizeToFit()
        bank.center = CGPoint(x: containerView.frame.width / 2, y: containerView.frame.height / 4)
        bank.textAlignment = NSTextAlignment.Center
        containerView.addSubview(bank)
        
        lemonInventory = UILabel()
        lemonInventory.text = "1 Lemons"
        lemonInventory.sizeToFit()
        lemonInventory.center = CGPoint(x: containerView.frame.width / 2, y: containerView.frame.height / 2)
        lemonInventory.textAlignment = NSTextAlignment.Center
        containerView.addSubview(lemonInventory)
        
        iceInventory = UILabel()
        iceInventory.text = "1 Ice Cubes"
        iceInventory.sizeToFit()
        iceInventory.center = CGPoint(x: containerView.frame.width / 2, y: containerView.frame.height / 4 * 3)
        containerView.addSubview(iceInventory)
    }
    
    func setupPurchaseContainer(containerView: UIView) {
        
        purchaseSectionLabel = UILabel()
        purchaseSectionLabel.text = "Step 1: Purchase Supplies"
        purchaseSectionLabel.textColor = UIColor.blueColor()
        purchaseSectionLabel.frame = CGRectMake(10, 25, 100, 50)
        purchaseSectionLabel.sizeToFit()
        containerView.addSubview(purchaseSectionLabel)
        
        lemonPriceLabel = UILabel()
        lemonPriceLabel.text = "Lemons for $2:"
        lemonPriceLabel.frame = CGRectMake(0, 0, containerView.frame.width / 2, containerView.frame.height / 4)
        lemonPriceLabel.center = CGPoint(x: containerView.frame.width / 4, y: containerView.frame.height / 2)
        lemonPriceLabel.textAlignment = NSTextAlignment.Right
        containerView.addSubview(lemonPriceLabel)
        
        icePriceLabel = UILabel()
        icePriceLabel.text = "Ice Cubes for $1:"
        icePriceLabel.frame = CGRectMake(0, 0, containerView.frame.width / 2, containerView.frame.height / 4)
        icePriceLabel.center = CGPoint(x: containerView.frame.width / 4, y: containerView.frame.height / 4 * 3)
        icePriceLabel.textAlignment = NSTextAlignment.Right
        containerView.addSubview(icePriceLabel)
    }
    
    func setupMixContainer(containerView: UIView) {
        
        mixSectionLabel = UILabel()
        mixSectionLabel.text = "Step 2: Mix Your Lemonade"
        mixSectionLabel.textColor = UIColor.blueColor()
        mixSectionLabel.frame = CGRectMake(10, 25, 100, 50)
        mixSectionLabel.sizeToFit()
        containerView.addSubview(mixSectionLabel)
        
        lemonsInMixLabel = UILabel()
        lemonsInMixLabel.text = "Lemons:"
        lemonsInMixLabel.frame = CGRectMake(0, 0, containerView.frame.width / 2, containerView.frame.height / 4)
        lemonsInMixLabel.center = CGPoint(x: containerView.frame.width / 4, y: containerView.frame.height / 2)
        lemonsInMixLabel.textAlignment = NSTextAlignment.Right
        containerView.addSubview(lemonsInMixLabel)
        
        iceInMixLabel = UILabel()
        iceInMixLabel.text = "Ice Cubes:"
        iceInMixLabel.frame = CGRectMake(0, 0, containerView.frame.width / 2, containerView.frame.height / 4)
        iceInMixLabel.center = CGPoint(x: containerView.frame.width / 4, y: containerView.frame.height / 4 * 3)
        iceInMixLabel.textAlignment = NSTextAlignment.Right
        containerView.addSubview(iceInMixLabel)
    }
    
    func setupSellContainer(containerView: UIView) {
        
        sellLabel = UILabel()
        sellLabel.text = "Step 3: Start Selling Your Brew"
        sellLabel.textColor = UIColor.blueColor()
        sellLabel.frame = CGRectMake(10, 15, 100, 50)
        sellLabel.sizeToFit()
        containerView.addSubview(sellLabel)
        
        saleExplanationLabel = UILabel()
        saleExplanationLabel.text = "At the end of the day you will either make or lose money. If you don't have enough money to buy new inventory then you lose the game."
        saleExplanationLabel.font = UIFont(name: "Arial", size: 12)
        saleExplanationLabel.sizeToFit()
        saleExplanationLabel.frame = CGRectMake(10, 30, containerView.frame.width - 20, containerView.frame.height / 2)
        saleExplanationLabel.numberOfLines = 0
        containerView.addSubview(saleExplanationLabel)
        
        sellButton = UIButton()
        sellButton.setTitle("Start Day", forState: UIControlState.Normal)
        sellButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        sellButton.backgroundColor = UIColor.yellowColor()
        sellButton.sizeToFit()
        sellButton.center = CGPoint(x: containerView.frame.width / 2, y: containerView.frame.height / 4 * 3)
        sellButton.addTarget(self, action: "sellButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(sellButton)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}


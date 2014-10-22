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
    var lemonsInMixStaticLabel: UILabel!
    var iceInMixStaticLabel: UILabel!
    var saleExplanationLabel: UILabel!
    
    // Variable Labels
    
    var bankLabel: UILabel!
    var lemonInventoryLabel: UILabel!
    var iceInventoryLabel: UILabel!
    var lemonsToBeBoughtLabel: UILabel!
    var iceToBeBoughtLabel: UILabel!
    var lemonsInMixLabel: UILabel!
    var iceInMixLabel: UILabel!
    
    // Variables
    
    var bank = 10
    var lemonInventory = 1
    var iceInventory = 1
    var lemonsToBeBought = 0
    var iceToBeBought = 0
    var lemonsInMix = 0
    var iceInMix = 0
    var results: ([Float]!, Weather!)
    var customers: [Float] = []
    var weather = UIImageView()
    
    // Buttons
    
    var incrementLemonsToBuyButton: UIButton!
    var decrementLemonsToBuyButton: UIButton!
    var incrementIceToBuyButton: UIButton!
    var decrementIceToBuyButton: UIButton!
    var incrementLemonsToMixButton: UIButton!
    var decrementLemonsToMixButton: UIButton!
    var incrementIceToMixButton: UIButton!
    var decrementIceToMixButton: UIButton!
    
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
    
    // IBActions
    
    func incrementLemonsToBuyButtonPressed (button: UIButton) {
        if bank <= 1 {
            showAlertWithText(header: "You're low on cash, you also suck", message: "You can't buy a lemon, mofo")
        } else {
            bank -= 2
            lemonInventory += 1
            lemonsToBeBought += 1
            updateMainView()
        }
    }
    
    func decrementLemonsToBuyButtonPressed (button: UIButton) {
        if lemonsToBeBought <= 0 {
            showAlertWithText(header: "You don't have any lemons being purchased, idiot", message: "Nice try")
        } else {
            bank += 2
            lemonInventory -= 1
            lemonsToBeBought -= 1
            updateMainView()
        }
    }
    
    func incrementIceToBuyButtonPressed (button: UIButton) {
        if bank <= 0 {
            showAlertWithText(header: "You're low on cash, you also suck", message: "You can't buy any goddamn ice, bitch")
        } else {
            bank -= 1
            iceInventory += 1
            iceToBeBought += 1
            updateMainView()
        }
    }
    
    func decrementIceToBuyButtonPressed (button: UIButton) {
        if iceToBeBought <= 0 {
            showAlertWithText(header: "You don't have any ice being purchased", message: "Maybe next time")
        } else {
            bank += 1
            iceInventory -= 1
            iceToBeBought -= 1
            updateMainView()
        }
    }
    
    func incrementLemonsToMixButtonPressed (button:UIButton) {
        if lemonInventory <= 0 {
            showAlertWithText(header: "You don't HAVE any lemons, fool", message: "Buy some, idiot")
        } else {
            lemonInventory -= 1
            lemonsInMix += 1
            updateMainView()
        }
    }
    
    func decrementLemonsToMixButtonPressed (button: UIButton) {
        if lemonsInMix <= 0 {
            showAlertWithText(header: "There aren't any lemons in the mix yet, moron", message: "wtf")
        } else {
            lemonInventory += 1
            lemonsInMix -= 1
            updateMainView()
        }
    }
    
    func incrementIceToMixButtonPressed (button: UIButton) {
        if iceInventory <= 0 {
            showAlertWithText(header: "Ya got no ice", message: "Get some maybe?")
        } else {
            iceInventory -= 1
            iceInMix += 1
            updateMainView()
        }
    }
    
    func decrementIceToMixButtonPressed (button: UIButton) {
        if iceInMix <= 0 {
            showAlertWithText(header: "There ain't no ice here", message: "Sorry")
        } else {
            iceInventory += 1
            iceInMix -= 1
            updateMainView()
        }
    }
    
    func sellButtonPressed (button: UIButton) {
        
        if lemonsInMix == 0 {
            showAlertWithText(header: "No one wants that shit", message: "Mix in some lemons, idiot")
        } else {
            var sales = 0
            var mix: Float
            if iceInMix == 0 {
                mix = Float(lemonsInMix)
            } else {
                mix = Float(lemonsInMix / iceInMix)
            }
            //customers = Factory.createCustomers().customers
            results = Factory.createCustomers()
            customers = results.0!
            weather.image = results.1!.image
            sales = LemonadeBrain.determineSales(customers, mix: mix)
            bank += sales
            lemonsInMix = 0
            iceInMix = 0
            lemonsToBeBought = 0
            iceToBeBought = 0
            updateMainView()
        }
        
    }
    
    // Setting Up Views
    
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
        
        bankLabel = UILabel()
        bankLabel.text = "$\(bank)"
        bankLabel.textColor = UIColor.greenColor()
        bankLabel.sizeToFit()
        bankLabel.center = CGPoint(x: containerView.frame.width / 2, y: containerView.frame.height / 4)
        bankLabel.textAlignment = NSTextAlignment.Center
        containerView.addSubview(bankLabel)
        
        weather.frame = CGRectMake(10, 50, 100, 50)
        containerView.addSubview(weather)
            
        lemonInventoryLabel = UILabel()
        lemonInventoryLabel.text = "\(lemonInventory) Lemons"
        lemonInventoryLabel.sizeToFit()
        lemonInventoryLabel.center = CGPoint(x: containerView.frame.width / 2, y: containerView.frame.height / 2)
        lemonInventoryLabel.textAlignment = NSTextAlignment.Center
        containerView.addSubview(lemonInventoryLabel)
        
        iceInventoryLabel = UILabel()
        iceInventoryLabel.text = "\(iceInventory) Ice Cubes"
        iceInventoryLabel.sizeToFit()
        iceInventoryLabel.center = CGPoint(x: containerView.frame.width / 2, y: containerView.frame.height / 4 * 3)
        containerView.addSubview(iceInventoryLabel)
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
        
        lemonsToBeBoughtLabel = UILabel()
        lemonsToBeBoughtLabel.text = "0"
        lemonsToBeBoughtLabel.sizeToFit()
        lemonsToBeBoughtLabel.center = CGPoint(x: containerView.frame.width / 4 * 3, y: containerView.frame.height / 2)
        containerView.addSubview(lemonsToBeBoughtLabel)
        
        icePriceLabel = UILabel()
        icePriceLabel.text = "Ice Cubes for $1:"
        icePriceLabel.frame = CGRectMake(0, 0, containerView.frame.width / 2, containerView.frame.height / 4)
        icePriceLabel.center = CGPoint(x: containerView.frame.width / 4, y: containerView.frame.height / 4 * 3)
        icePriceLabel.textAlignment = NSTextAlignment.Right
        containerView.addSubview(icePriceLabel)
        
        iceToBeBoughtLabel = UILabel()
        iceToBeBoughtLabel.text = "0"
        iceToBeBoughtLabel.sizeToFit()
        iceToBeBoughtLabel.center = CGPoint(x: containerView.frame.width / 4 * 3, y: containerView.frame.height / 4 * 3)
        containerView.addSubview(iceToBeBoughtLabel)
        
        incrementLemonsToBuyButton = UIButton()
        incrementLemonsToBuyButton.setTitle("+", forState: UIControlState.Normal)
        incrementLemonsToBuyButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        incrementLemonsToBuyButton.sizeToFit()
        incrementLemonsToBuyButton.center = CGPoint(x: containerView.frame.width / 3 * 2, y: containerView.frame.height / 2)
        incrementLemonsToBuyButton.addTarget(self, action: "incrementLemonsToBuyButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(incrementLemonsToBuyButton)
        
        decrementLemonsToBuyButton = UIButton()
        decrementLemonsToBuyButton.setTitle("-", forState: UIControlState.Normal)
        decrementLemonsToBuyButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        decrementLemonsToBuyButton.sizeToFit()
        decrementLemonsToBuyButton.center = CGPoint(x: containerView.frame.width / 8 * 7, y: containerView.frame.height / 2)
        decrementLemonsToBuyButton.addTarget(self, action: "decrementLemonsToBuyButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(decrementLemonsToBuyButton)
        
        incrementIceToBuyButton = UIButton()
        incrementIceToBuyButton.setTitle("+", forState: UIControlState.Normal)
        incrementIceToBuyButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        incrementIceToBuyButton.sizeToFit()
        incrementIceToBuyButton.center = CGPoint(x: containerView.frame.width / 3 * 2, y: containerView.frame.height / 4 * 3)
        incrementIceToBuyButton.addTarget(self, action: "incrementIceToBuyButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(incrementIceToBuyButton)
        
        decrementIceToBuyButton = UIButton()
        decrementIceToBuyButton.setTitle("-", forState: UIControlState.Normal)
        decrementIceToBuyButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        decrementIceToBuyButton.sizeToFit()
        decrementIceToBuyButton.center = CGPoint(x: containerView.frame.width / 8 * 7, y: containerView.frame.height / 4 * 3)
        decrementIceToBuyButton.addTarget(self, action: "decrementIceToBuyButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(decrementIceToBuyButton)
    }
    
    func setupMixContainer(containerView: UIView) {
        
        mixSectionLabel = UILabel()
        mixSectionLabel.text = "Step 2: Mix Your Lemonade"
        mixSectionLabel.textColor = UIColor.blueColor()
        mixSectionLabel.frame = CGRectMake(10, 25, 100, 50)
        mixSectionLabel.sizeToFit()
        containerView.addSubview(mixSectionLabel)
        
        lemonsInMixStaticLabel = UILabel()
        lemonsInMixStaticLabel.text = "Lemons:"
        lemonsInMixStaticLabel.frame = CGRectMake(0, 0, containerView.frame.width / 2, containerView.frame.height / 4)
        lemonsInMixStaticLabel.center = CGPoint(x: containerView.frame.width / 4, y: containerView.frame.height / 2)
        lemonsInMixStaticLabel.textAlignment = NSTextAlignment.Right
        containerView.addSubview(lemonsInMixStaticLabel)
        
        lemonsInMixLabel = UILabel()
        lemonsInMixLabel.text = "0"
        lemonsInMixLabel.sizeToFit()
        lemonsInMixLabel.center = CGPoint(x: containerView.frame.width / 4 * 3, y: containerView.frame.height / 2)
        containerView.addSubview(lemonsInMixLabel)
        
        iceInMixStaticLabel = UILabel()
        iceInMixStaticLabel.text = "Ice Cubes:"
        iceInMixStaticLabel.frame = CGRectMake(0, 0, containerView.frame.width / 2, containerView.frame.height / 4)
        iceInMixStaticLabel.center = CGPoint(x: containerView.frame.width / 4, y: containerView.frame.height / 4 * 3)
        iceInMixStaticLabel.textAlignment = NSTextAlignment.Right
        containerView.addSubview(iceInMixStaticLabel)
        
        iceInMixLabel = UILabel()
        iceInMixLabel.text = "0"
        iceInMixLabel.sizeToFit()
        iceInMixLabel.center = CGPoint(x: containerView.frame.width / 4 * 3, y: containerView.frame.height / 4 * 3)
        containerView.addSubview(iceInMixLabel)
        
        incrementLemonsToMixButton = UIButton()
        incrementLemonsToMixButton.setTitle("+", forState: UIControlState.Normal)
        incrementLemonsToMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        incrementLemonsToMixButton.sizeToFit()
        incrementLemonsToMixButton.center = CGPoint(x: containerView.frame.width / 3 * 2, y: containerView.frame.height / 2)
        incrementLemonsToMixButton.addTarget(self, action: "incrementLemonsToMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(incrementLemonsToMixButton)

        decrementLemonsToMixButton = UIButton()
        decrementLemonsToMixButton.setTitle("-", forState: UIControlState.Normal)
        decrementLemonsToMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        decrementLemonsToMixButton.sizeToFit()
        decrementLemonsToMixButton.center = CGPoint(x: containerView.frame.width / 8 * 7, y: containerView.frame.height / 2)
        decrementLemonsToMixButton.addTarget(self, action: "decrementLemonsToMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(decrementLemonsToMixButton)
        
        incrementIceToMixButton = UIButton()
        incrementIceToMixButton.setTitle("+", forState: UIControlState.Normal)
        incrementIceToMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        incrementIceToMixButton.sizeToFit()
        incrementIceToMixButton.center = CGPoint(x: containerView.frame.width / 3 * 2, y: containerView.frame.height / 4 * 3)
        incrementIceToMixButton.addTarget(self, action: "incrementIceToMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(incrementIceToMixButton)
        
        decrementIceToMixButton = UIButton()
        decrementIceToMixButton.setTitle("-", forState: UIControlState.Normal)
        decrementIceToMixButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        decrementIceToMixButton.sizeToFit()
        decrementIceToMixButton.center = CGPoint(x: containerView.frame.width / 8 * 7, y: containerView.frame.height / 4 * 3)
        decrementIceToMixButton.addTarget(self, action: "decrementIceToMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(decrementIceToMixButton)
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
    
    func updateMainView () {
        bankLabel.text = "$\(bank)"
        lemonInventoryLabel.text = "\(lemonInventory) Lemons"
        iceInventoryLabel.text = "\(iceInventory) Ice Cubes"
        lemonsToBeBoughtLabel.text = "\(lemonsToBeBought)"
        iceToBeBoughtLabel.text = "\(iceToBeBought)"
        lemonsInMixLabel.text = "\(lemonsInMix)"
        iceInMixLabel.text = "\(iceInMix)"
    }
    
    func showAlertWithText (header: String = "Warning", message: String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}


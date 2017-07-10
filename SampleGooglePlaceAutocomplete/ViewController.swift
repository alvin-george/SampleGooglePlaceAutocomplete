//
//  ViewController.swift
//  SampleGooglePlaceAutocomplete
//
//  Created by apple on 10/07/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import GooglePlaces

class ViewController: UIViewController, GMSAutocompleteViewControllerDelegate {
    
    @IBOutlet weak var placeDetailTextView: UITextView!
    
    var  gmsController:GMSAutocompleteViewController =  GMSAutocompleteViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addInitialUISetup()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        addInitialUISetup()
    }
    func addInitialUISetup(){

        gmsController.delegate = self
        customizeGooglePlaceSearch()
    }
    
    @IBAction func launchGooglePicker(_ sender: Any) {
        
        present(gmsController, animated: true, completion: nil)
        
    }
    func customizeGooglePlaceSearch()
    {
        //CHANGING FOR BETTER UNDERSTANDING
        gmsController.tintColor =  UIColor.cyan
        gmsController.tableCellBackgroundColor =  UIColor.white

        gmsController.primaryTextColor =  UIColor.blue
        gmsController.secondaryTextColor =  UIColor.red
        gmsController.tableCellSeparatorColor =  UIColor.green
    
        
    }
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
        
        
        placeDetailTextView.text = "Place name: \(place.name) \nPlace address: \(place.formattedAddress) \nPlace attributions: \(place.attributions)"
        
        
        dismiss(animated: true, completion: nil)
        
        
        
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: \(error)")
        dismiss(animated: true, completion: nil)
    }
    
    // User cancelled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        print("Autocomplete was cancelled.")
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


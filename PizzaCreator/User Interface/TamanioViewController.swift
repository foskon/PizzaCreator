//
//  TamanioViewController.swift
//  PizzaCreator
//
//  Created by Carlos Manzanas on 18/09/16.
//  Copyright © 2016 Carlos Manzanas. All rights reserved.
//

import UIKit

class TamanioViewController: BasePickerViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: UIPickerViewDataSource

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let sizes = self.pizzaManager.getSizes()
        return sizes.count
    }

    // MARK: UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let pizzaSize = self.pizzaManager.getSizes()[row]
        return pizzaSize.title
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let selectedRow = self.picker.selectedRowInComponent(0)
        let selectedSize = self.pizzaManager.getSizes()[selectedRow]
        self.pizzaManager.setCurrentSize(selectedSize)
    }
}
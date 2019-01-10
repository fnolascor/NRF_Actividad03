//
//  ViewController.swift
//  NRF_Actividad03
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class TipController: UIViewController {
    @IBOutlet weak var txtAmount: UITextField!
    @IBOutlet weak var pvTipPercentaje: UIPickerView!
    @IBOutlet weak var txtTotalTip: UITextField!
    @IBOutlet weak var txtTotal: UITextField!
    
    var pickerData: [String] = [String]()
    
    @IBAction func actualizaMonto(_ sender: UITextField) {
        let porcentajeSeleccionado = self.pvTipPercentaje.selectedRow(inComponent: 0)
        let valor = self.pickerData[porcentajeSeleccionado]
        
        if(valor != "")
        {
            calculaTotales(porcentaje: valor)
        }
    }
    
    func calculaTotales(porcentaje: String)
    {
        if(porcentaje == "Ninguno")
        {
            txtTotalTip.text = "0.0"
            txtTotal.text = txtAmount.text
            return
        }
        
        let importe: Int = Int(txtAmount.text!)!
        var totalPropiona: Double = 0
        var total: Double = 0
        if(porcentaje == "10%")
        {
            totalPropiona = (Double(importe) * 0.10)
        }
        else if(porcentaje == "15%")
        {
            totalPropiona = (Double(importe) * 0.15)
        }
        else if(porcentaje == "20%")
        {
            totalPropiona = (Double(importe) * 0.20)
        }
        
        txtTotalTip.text = String(totalPropiona)
        total = Double(txtAmount.text!)! + totalPropiona
        txtTotal.text = String(total)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pvTipPercentaje.dataSource = self
        pvTipPercentaje.delegate = self
        pickerData = ["Ninguno", "10%", "15%", "20%"]
        txtAmount.text = "0"
    }
}

extension TipController : UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerData.count
    }
}

extension TipController : UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row] as String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print ("row: \(row)")
//        print ("value: \(self.pickerData[row])")
        let porcentajeSeleccionado = self.pickerData[row]
        
        if(porcentajeSeleccionado == "Ninguno")
        {
            txtTotalTip.text = "0.0"
            txtTotal.text = txtAmount.text
            return
        }
        
        let importe: Int = Int(txtAmount.text!)!
        var totalPropiona: Double = 0
        var total: Double = 0
        
        if(porcentajeSeleccionado == "10%")
        {
            totalPropiona = (Double(importe) * 0.10)
        }
        else if(porcentajeSeleccionado == "15%")
        {
            totalPropiona = (Double(importe) * 0.15)
        }
        else if(porcentajeSeleccionado == "20%")
        {
            totalPropiona = (Double(importe) * 0.20)
        }
        
        txtTotalTip.text = String(totalPropiona)
        total = Double(txtAmount.text!)! + totalPropiona
        txtTotal.text = String(total)
        
        
    }
    
    
}

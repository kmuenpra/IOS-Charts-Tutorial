//
//  ViewController.swift
//  Charts-Tutorial
//
//  Created by Macboy on 6/17/21.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var lineChartBox: LineChartView!
    @IBOutlet weak var pieChartBox: PieChartView!
    @IBOutlet weak var barChartBox: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data = [2, 1, 1 ,1 ,3, 2, 4, 5, 2, 7]
        graphLineChart(dataArray: data)
        graphPieChart(dataArray: data)
        graphBarChart(dataArray: data)
        
    }

    func graphLineChart(dataArray: [Int]){
        
        //set width, height, and frame of the box
        lineChartBox.frame = CGRect(x:0, y:0,
                                    width: self.view.frame.size.width,
                                    height: self.view.frame.size.width / 2)
        
        lineChartBox.center.x = self.view.center.x
        lineChartBox.center.y = self.view.center.y - 200
        
        //Case when there's no data input
        lineChartBox.noDataText = "No data available."
        lineChartBox.noDataTextColor = UIColor.black
        
        //for loop to add X, Y coordinate to entries list
        var entries = [ChartDataEntry]()
        
        for i in 0..<dataArray.count {
            let value = ChartDataEntry(x: Double(i), y:Double(dataArray[i]))
            entries.append(value)
        }
        
        // creat LineChartDataSet object
        let dataSet = LineChartDataSet(entries: entries, label: "Line Chart")
        
        dataSet.colors = ChartColorTemplates.joyful()
        
        let data = LineChartData(dataSet: dataSet)
        lineChartBox.data = data
        
        lineChartBox.chartDescription?.text = "Pi Values"
        
        lineChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
        
    }
    
    func graphPieChart(dataArray: [Int]){
        
        //set width, height, and frame of the box
        pieChartBox.frame = CGRect(x:0, y:0,
                                    width: self.view.frame.size.width,
                                    height: self.view.frame.size.width / 2)
        
        pieChartBox.center.x = self.view.center.x
        pieChartBox.center.y = self.view.center.y
        
        //Case when there's no data input
        pieChartBox.noDataText = "No data available."
        pieChartBox.noDataTextColor = UIColor.black
        
        //for loop to add X, Y coordinate to entries list
        var entries = [ChartDataEntry]()
        
        for i in 0..<dataArray.count {
            let value = ChartDataEntry(x: Double(i), y:Double(dataArray[i]))
            entries.append(value)
        }
        
        // creat PieChartDataSet object
        let dataSet = PieChartDataSet(entries: entries, label: "Pie Chart")
        
        dataSet.colors = ChartColorTemplates.colorful()
        
        let data = PieChartData(dataSet: dataSet)
        pieChartBox.data = data
        
        pieChartBox.chartDescription?.text = "Pi Values"
        
        pieChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
        
    }
    
    func graphBarChart(dataArray: [Int]){
        
        //set width, height, and frame of the box
        barChartBox.frame = CGRect(x:0, y:0,
                                    width: self.view.frame.size.width,
                                    height: self.view.frame.size.width / 2)
        
        barChartBox.center.x = self.view.center.x
        barChartBox.center.y = self.view.center.y + 200
        
        //Case when there's no data input
        barChartBox.noDataText = "No data available."
        barChartBox.noDataTextColor = UIColor.black
        
        //for loop to add X, Y coordinate to entries list
        var entries = [BarChartDataEntry]()
        
        for i in 0..<dataArray.count {
            let value = BarChartDataEntry(x: Double(i), y:Double(dataArray[i]))
            entries.append(value)
        }
        
        // creat BarChartDataSet object
        let dataSet = BarChartDataSet(entries: entries, label: "Bar Chart")
        
        dataSet.colors = ChartColorTemplates.liberty()
        
        let data = BarChartData(dataSet: dataSet)
        barChartBox.data = data
        
        barChartBox.chartDescription?.text = "Pi Values"
        
        barChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
        
    }

}


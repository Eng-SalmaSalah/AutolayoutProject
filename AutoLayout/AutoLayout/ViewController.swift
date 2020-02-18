//
//  ViewController.swift
//  AutoLayout
//
//  Created by Salma Salah on 2/14/20.
//  Copyright © 2020 Salma Salah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false //  because by default iOS generates Auto Layout constraints based on a view's size and position. We'll be doing it by hand, so we need to disable this feature.
        label1.text = "Ahmed"
        label1.backgroundColor = UIColor.red
        label1.sizeToFit() //makes label sized to fit its content
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.text = "Samy"
        label2.backgroundColor = UIColor.darkGray
        label2.sizeToFit()
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.text = "Mahmoud"
        label3.backgroundColor = UIColor.blue
        label3.sizeToFit()
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.text = "Abd-Elhamid"
        label4.backgroundColor = UIColor.systemPurple
        label4.sizeToFit()
        
        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.text = "Ibrahem"
        label5.backgroundColor = UIColor.brown
        label5.sizeToFit()
        
        let label6 = UILabel()
        label6.translatesAutoresizingMaskIntoConstraints = false
        label6.text = "Shabaan"
        label6.backgroundColor = UIColor.systemPink
        label6.sizeToFit()
        
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        view.addSubview(label6)
        // we must add the subviews before applying the constraints
        
        let viewsDictionary = ["label1" : label1 ,"label2" : label2 , "label3" : label3 , "label4" : label4 ,"label5" : label5 , "label6" : label6]
        let metrics = ["labelHeight" : 72]
        for label in viewsDictionary.keys{
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
            /*
             The H: parts means that we're defining a horizontal layout; we'll do a vertical layout soon. The pipe symbol, |, means "the edge of the view." We're adding these constraints to the main view inside our view controller, so this effectively means "the edge of the view controller." Finally, we have [label1], which is a visual way of saying "put label1 here". Imagine the brackets, [ and ], are the edges of the view.
             */

        }
                    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-[label6(label1)]-(>=10)-|", options: [], metrics: metrics, views: viewsDictionary))
        /*
         This time we're specifying V:, meaning that these constraints are vertical. And we have multiple views inside the VFL, so lots of constraints will be generated.
         the - symbol, which means "space". It's 10 points by default, but you can customize it.

         Note that our vertical VFL doesn't have a pipe at the end, so we're not forcing the last label to stretch all the way to the edge of our view. This will leave whitespace after the last label, which is what we want right now.
         */

    }
//Unable to simultaneously satisfy constraints : in case of landscape so we need to use priority @priority between (0-1000) if 1000 you have to apply this constraint
    //we set height of label one as labelHeight with priority of 999 , so if it cannot set height to 72 it will decrease it but it will set it with the nearest possible value,and we set heights of all other labels to be the same as label 1

}


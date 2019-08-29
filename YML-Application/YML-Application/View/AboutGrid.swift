//
//  AboutGrid.swift
//  YML-Application
//
//  Created by Karthik UK on 29/08/19.
//  Copyright © 2019 Karthik UK. All rights reserved.
//

import UIKit

class AboutGrid: BaseVC,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  imageCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: "AboutGridCell"), for: indexPath as IndexPath) as? AboutGridCell
        cell.vi
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

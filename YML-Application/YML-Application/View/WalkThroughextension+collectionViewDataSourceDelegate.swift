import UIKit
import Foundation
extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath as IndexPath) as? CollectionViewCell
        cell?.imageView.image =  UIImage(named: storyModel.productInfo[indexPath.row].images)
        cell?.headTitle.text = storyModel.productInfo[indexPath.row].headings
        cell?.logoImage.image = UIImage(named: storyModel.productInfo[indexPath.row].imageLogos)
        cell?.descriptionTitle.text = storyModel.productInfo[indexPath.row].descriptions
        return cell ?? UICollectionViewCell()
    }
}

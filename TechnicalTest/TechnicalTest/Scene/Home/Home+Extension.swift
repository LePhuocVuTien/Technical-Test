import UIKit
import Domain
import RxCocoa
import RxSwift
import RxDataSources

extension HomeController {
  
  func createDataSource() -> RxTableDataSource<SectionModel<String, Domain.Detail>> {
    return RxTableDataSource<SectionModel<String, Domain.Detail>>(
      configureCell: { (dataSource, tableView, indexPath, item) -> UITableViewCell in
        let cell = tableView.dequeueReusableCell(
          cellClass: Cell.self,
          indexPath: indexPath
        )
        cell.configure(item)
        return cell
      }
    )
  }
  
  func createTypeDataSource() -> RxCollectionDataSource<SectionModel<String, TypeItem>> {
    return RxCollectionDataSource<SectionModel<String, TypeItem>>(
      configureCell: { (dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
        let cell = collectionView.dequeueReusableCell(
          cellClass: TypeCell.self,
          indexPath: indexPath
        )
        cell.configure(item)
        return cell
      }
    )
  }
}
  
extension Reactive where Base: HomeController {
  var name: Binder<String> {
    return Binder(self.base) { scene, item in
      print(item)
    }
  }
}

import UIKit

extension UITableView {
    
    func registerNib<T: UITableViewCell>(withClass cellClass: T.Type) {
        register(
            Config.Nib.loadNib(name: T.cellIdentifier),
            forCellReuseIdentifier: T.cellIdentifier
        )
    }
    
    func registerClass<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass.self, forCellReuseIdentifier: cellClass.cellIdentifier)
    }
    
    func cell<T: ReusableCellIdentifiable>(forRowAt indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.cellIdentifier, for: indexPath) as! T
    }
    
    func cell<T: ReusableCellIdentifiable>(forClass cellClass: T.Type = T.self) -> T {
        return dequeueReusableCell(withIdentifier: T.cellIdentifier) as! T
    }
    
}

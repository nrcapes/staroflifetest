/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class SidePanelViewController: UITableViewController {
 // @IBOutlet weak var tableView: UITableView!
  
  
  var delegate: SidePanelViewControllerDelegate?
  var sections = ["Dispatch", "Patient"]
  var dispatchRows = ["Dispatch"]
  var patientDetailRows = ["Patient Details"]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerCell()
    tableView.reloadData()
  }
  func registerCell(){
    let cell = UINib(nibName: "sideCell",
                           bundle: nil)
    self.tableView.register(cell,
             forCellReuseIdentifier: "sideCell")  }
}


// MARK: Table View Data Source
extension SidePanelViewController {
  
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "sideCell") as? sideCell else {
      return UITableViewCell()
    }
    switch indexPath.section{
    case 0 :
      switch indexPath.row {
      case 0:
        cell.label.text = "Dispatch Time"
      case 1:
        cell.label.text = "On Site Time"
      default:
        cell.label.text = "*"
      }
    case 1 :
      switch indexPath.row {
      case 0:
        cell.label.text = "Patient Name"
      case 1:
        cell.label.text = "Patient Address"
        
      default:
        cell.label.text = "*"
      }
      
    default:
      cell.label.text = "Test \(indexPath.row)"
    }
    
    
    return cell
  }

}
extension SidePanelViewController{
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    var animal = "*"
    switch indexPath.section {
    case 0:
      animal = dispatchRows[indexPath.row]
    case 1 :
      animal = patientDetailRows[indexPath.row]
    default:
      animal = "*"
    }
   
    delegate?.didSelectAnimal(animal)
  }
}

protocol SidePanelViewControllerDelegate {
  func didSelectAnimal(_ animal: String)
}

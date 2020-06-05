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

class SidePanelViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  var delegate: SidePanelViewControllerDelegate?
  var sections = ["Dispatch", "Patient"]
  var dispatchRows = ["Dispatch"]
  var patientDetailRows = ["Patient Details"]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.reloadData()
  }
}

// MARK: Table View Data Source
extension SidePanelViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var count : Int
    switch section {
    case 0 :
      count = dispatchRows.count
    case 1 :
      count = patientDetailRows.count
    default:
      count = 0
    }
    return count
  }
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    var title = ""
    switch section {
    case 0:
      title = "Dispatch"
    case 1 :
      title = "Patient"
    default:
      title = "*"
    }
    return title
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "sideCell", for: indexPath)
    switch indexPath.section {
    case 0:
      cell.textLabel?.text = dispatchRows[indexPath.row]
    case 1 :
      cell.textLabel?.text = patientDetailRows[indexPath.row]
    default:
      cell.textLabel?.text = "*"
    }
   
    return cell
  }
}
func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 2 // number of required sections
}// Mark: Table View Delegate

extension SidePanelViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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

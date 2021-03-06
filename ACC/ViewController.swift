
import UIKit
import CoreMotion

class ViewController: UIViewController, DataProcessorDelegate {
    
    // Retreive the managedObjectContext from AppDelegate
    //let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    // MARK: Model
    var dataSource: DataProcessor = DataProcessor()
    let publicDB = UserDefaults.standard
    

    
    // MARK: Outlets
    @IBOutlet var info: UILabel?
    
    @IBOutlet var disX: UILabel?
    @IBOutlet var disY: UILabel?
    @IBOutlet var disZ: UILabel?
    
    @IBOutlet var accX: UILabel?
    @IBOutlet var accY: UILabel?
    @IBOutlet var accZ: UILabel?
    
    @IBOutlet var velX: UILabel?
    @IBOutlet var velY: UILabel?
    @IBOutlet var velZ: UILabel?
    
    @IBOutlet var velXGyro: UILabel?
    @IBOutlet var velYGyro: UILabel?
    @IBOutlet var velZGyro: UILabel?
    
    @IBOutlet var disXGyro: UILabel?
    @IBOutlet var disYGyro: UILabel?
    @IBOutlet var disZGyro: UILabel?
    
    @IBAction func reset() {
        dataSource.reset()
    }
    
    // MARK: Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.startsDetection()
        //self.reset()
    }

    // MARK: Functions
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "dataSource"), object: dataSource)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dataSource.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    // MARK: Delegate
    func sendingNewData(_ person: DataProcessor, type: speedDataType, data: ThreeAxesSystemDouble) {
        switch type {
        case .accelerate:
            accX?.text = "\(roundNum(data.x))"
            accY?.text = "\(roundNum(data.y))"
            accZ?.text = "\(roundNum(data.z))"
        case .velocity:
            velX?.text = "\(roundNum(data.x))"
            velY?.text = "\(roundNum(data.y))"
            velZ?.text = "\(roundNum(data.z))"
        case .distance:
            disX?.text = "\(roundNum(data.x))"
            disY?.text = "\(roundNum(data.y))"
            disZ?.text = "\(roundNum(data.z))"
        }
    }
    
    func sendingNewStatus(_ person: DataProcessor, status: String) {
        info?.text = status
    }
    
}

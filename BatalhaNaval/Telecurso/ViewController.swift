import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    let anchor = try! Experience.loadBox()

    override func viewDidLoad() {

        super.viewDidLoad()
        arView.scene.anchors.append(anchor)
        gameplay()
    }

    func gameplay() {
        anchor.actions.atack.onAction = { _ in

            let numberOfGrills = self.anchor.notifications.allNotifications.count
            var avaiableMoves = Array(1...numberOfGrills)
            guard let randomMove = avaiableMoves.randomElement() else { return }

            avaiableMoves = avaiableMoves.filter { element in
                element != randomMove
            }
            self.anchor
                .notifications
                .allNotifications[randomMove - 1]
                .post()
        }
    }
}

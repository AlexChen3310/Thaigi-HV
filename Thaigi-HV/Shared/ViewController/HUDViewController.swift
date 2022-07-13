//
//  HUDViewController.swift
//  TFChessApp
//
//  Created by Johnny on 2021/12/10.
//

import UIKit
import Lottie

class HUDViewController: BaseViewController {

    @IBOutlet weak var loadingView: UIView!{
        didSet{
            loadingView.layer.cornerRadius = 4
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        let animationView = AnimationView(name: "lego_loader")
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
        loadingView.addSubview(animationView)
        animationView.layoutAttachAll()
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

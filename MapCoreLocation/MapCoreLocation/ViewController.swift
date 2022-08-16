//
//  ViewController.swift
//  MapCoreLocation
//
//  Created by Metin Donmez on 16.08.2022.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {
    
    // enlem ve boylam bılgılerini almak için manager yonetıcı sınıfı
    var localtionManager : CLLocationManager = CLLocationManager()
    
    
    @IBOutlet weak var enlem: UILabel!
    @IBOutlet weak var boylam: UILabel!
    @IBOutlet weak var hizlabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // uygulama ilk acldıgın on ayarlar  gps enlem ve boylam bılgısdir burada => dogruluk ıcın cıhazı etkıler
        
        localtionManager.desiredAccuracy = kCLLocationAccuracyBest  //keskınlık
        localtionManager.delegate = self  //porotocol
        // locakyon ıznı alınması lazım
        
        localtionManager.requestWhenInUseAuthorization()
        
        //lokasyon guncelleme yapıyoruz
        localtionManager.startUpdatingLocation()
        
    }

}



extension ViewController: CLLocationManagerDelegate {
    
    // bu bıze parametereler verecek !
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum :CLLocation = locations[locations.count-1] // location en onunsunun bir eksıgı son lokasyonu verır
        
        
        // enlem ve boylem labellerın ıcın yazalım
        enlem.text = "Enlem : \(sonKonum.coordinate.latitude)"
        boylam.text = "Boylam : \(sonKonum.coordinate.longitude)"
        hizlabel.text = "Hiz: \(sonKonum.speed)"
        
        
    }
}

//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Mike Zhang Xunda on 28/6/17.
//  Copyright © 2017 Mike Zhang Xunda. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftSpinner

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var baseAtkLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var pokeLbl: UILabel!
    
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var musicPlayer: AVAudioPlayer!
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var pokeEvoImgStackView: UIStackView!
    @IBOutlet weak var pokeEvoView: UIView!
    @IBOutlet weak var pokeImgStackView: UIStackView!
    @IBOutlet weak var pokeTypeStackView: UIStackView!
    
    @IBAction func indexChanged(_ sender: AnyObject) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            pokeImgStackView.isHidden = false
            pokeTypeStackView.isHidden = false
            pokeEvoView.isHidden = false
            pokeEvoImgStackView.isHidden = false
        case 1:
            pokeImgStackView.isHidden = true
            pokeTypeStackView.isHidden = true
            pokeEvoView.isHidden = true
            pokeEvoImgStackView.isHidden = true
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeLbl.text = pokemon.name
        
        let img  = UIImage(named: "\(pokemon.pokedexId)")
        mainImage.image = img
        currentEvoImg.image = img
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetail{
            print("did arrive here")
            //whatever we write will only be called after the network call is complete
            self.updateUI()
            SwiftSpinner.hide()
        }
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        baseAtkLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionID == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
        }else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionID)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

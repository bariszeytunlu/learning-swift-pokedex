//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Barış Zeytünlü on 19/10/2016.
//  Copyright © 2016 Barış Zeytünlü. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenceLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexIDLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var evoDescriptionLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoLbl: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    
    
    @IBAction func backPressedButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalized
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        pokedexIDLbl.text = "\(pokemon.pokedexId)"
        
        
        pokemon.downloadPokemonDetail {
            print("completed set data")
            self.updateUI()
        }

    }
    
    func updateUI() {
        baseAttackLbl.text = pokemon.attack
        defenceLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            evoDescriptionLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
            
        } else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoDescriptionLbl.text = str
        }
        
        print("updated all label")
        
    }
}

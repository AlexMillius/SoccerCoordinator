import UIKit

//MARK: Part1

//Declaration of the empty array of player
var players = [[String:NSObject]]()

//Ideally a player should be a class with a name, height, experience and guardian constant. Those constant should be initialised with an init. But since I can't use a class implementation, my array of players is just an array of dictionaries String:NSObject.


//To avoid typo, I create four strings keys
let name = "Name"
let height = "Height"
let experience = "Experience"
let guardian = "Guardian"

// implementation of each individual player
let joeSmith = [name:"Joe Smith",height:42,experience:true,guardian:"Jim and Jan Smith"]
let jillTanner = [name:"Jill Tanner",height:36,experience:true,guardian:"Clara Tanner"]
let billBon = [name:"Bill Bon",height:43,experience:true,guardian:"Sara and Jenny Bon"]
let evaGordon = [name:"Eva Gordon",height:45,experience:false,guardian:"Wendy and Mike Gordon"]
let mattGill = [name:"Matt Gill",height:40,experience:false,guardian:"Charles and Sylvia Gill"]
let kimmyStein = [name:"Kimmy Stein",height:41,experience:false,guardian:"Bill and Hillary Stein"]
let sammyAdams = [name:"Sammy Adams",height:45,experience:false,guardian:"Jeff Adams"]
let karlSaygan = [name:"Karl Saygan",height:42,experience:true,guardian:"Heather Biedsoe"]
let suzaneGreenberg = [name:"Suzane Greenberg",height:44,experience:true,guardian:"Henrietta Dumas"]
let salDali = [name:"Sal Dali",height:41,experience:false,guardian:"Gala Dali"]
let joeKavalier = [name:"Joe Kavalier",height:39,experience:false,guardian:"Sam and Elaine Kavalier"]
let benFinkeistein = [name:"Ben Finkeistein",height:44,experience:false,guardian:"Aaron and Jill Finkeistein"]
let diegoSoto = [name:"Diego Soto",height:41,experience:true,guardian:"Robin and Sarika Soto"]
let chloeAlaska = [name:"Chloe Alaska",height:47,experience:false,guardian:"David and Jamie Alaska"]
let arnoldWillis = [name:"Arnold Willis",height:43,experience:false,guardian:"Claire Willis"]
let philipHelm = [name:"Philip Helm",height:44,experience:true,guardian:"Thomas Helm and Eva Jones"]
let lesClay = [name:"Les Clay",height:42,experience:true,guardian:"Wynonna Brown"]
let herschelKrustofski = [name:"Herschel Krustofski",height:45,experience:true,guardian:"Hyman and Rachel Krustofski"]

//Implementation off all the 18 players into the players array
players = [joeSmith,jillTanner,billBon,evaGordon,mattGill,kimmyStein,sammyAdams,karlSaygan,suzaneGreenberg,salDali,joeKavalier,benFinkeistein,diegoSoto,chloeAlaska,arnoldWillis,philipHelm,lesClay,herschelKrustofski]



//MARK: Part 2

// Declaration of the three teams
var dragons = [[String:NSObject]]()
var raptors = [[String:NSObject]]()
var sharks = [[String:NSObject]]()


func sortPlayerIntoThreeTeams(players players:[[String:NSObject]]){
    
    //Create three variables that keep trace of the number of experienced player in each team
    var expDragons = 0
    var expRaptors = 0
    var expSharks = 0
    
    for player in players {
        
        //Check if the player has experience and asign it to a constant
        let experience = player["Experience"] as! Bool
        
        if experience {
            // The player is experimented
            // 1. Check the difference of experienced players in each teams
            // 2. Affect the experienced player in the team with the less experienced players
            // 3. Increment the number of experienced player in teams.
            if expDragons <= expRaptors && expDragons <= expSharks {
                dragons.append(player)
                expDragons += 1
            }else if expRaptors <= expDragons && expRaptors <= expSharks {
                raptors.append(player)
                expRaptors += 1
            } else if expSharks <= expDragons && expSharks <= expRaptors {
                sharks.append(player)
                expSharks += 1
            }
        } else {
            // The player is not experimented
            // Affect the inexperimented player in the team with the less amount of players.
            if dragons.count <= raptors.count && dragons.count <= sharks.count {
                dragons.append(player)
            }else if raptors.count <= dragons.count && raptors.count <= sharks.count {
                raptors.append(player)
            } else if expSharks <= dragons.count && sharks.count <= raptors.count {
                sharks.append(player)
            }
        }
    }
}

sortPlayerIntoThreeTeams(players: players)

dragons
raptors
sharks


//MARK: Part 3

// declaration of the names of teams to avoid typos
let raptorsName = "Raptors"
let dragonsName = "Dragons"
let sharksName = "Sharks"

let league = [dragonsName:dragons,raptorsName:raptors,sharksName:sharks]

func sendLetterToGuardian(league league:[String:[[String:NSObject]]]) -> [String]{
    
    var letters = [String]()
    
    // extraction of the teams from the league
    let raptors = league[raptorsName]!
    let dragons = league[dragonsName]!
    let sharks = league[sharksName]!
    
    // nested function to create the letter
    func createLetter(team team:[[String:NSObject]], teamName:String){
        
        for player in team {
            
            //Extract the playerName and guardian of the player
            let playerName = player["Name"] as! String
            let guardian = player["Guardian"] as! String
            
            //Switch through the names of team to affect the first practice date
            var practiceDate = String()
            switch teamName {
            case raptorsName: practiceDate = "March 18, 1pm"
            case dragonsName: practiceDate = "March 17, 1pm"
            case sharksName: practiceDate = "March 17, 3pm"
            default: break
            }
            
            //Construct the letter by string interpollation
            let letter = "Hi \(guardian), \(playerName) is in the \(teamName) this year! The first practice day is \(practiceDate)."
            
            //append the letter to the array of letters
            letters.append(letter)
        }
    }
    
    //create the letters for each teams
    createLetter(team: raptors, teamName: raptorsName)
    createLetter(team: dragons, teamName: dragonsName)
    createLetter(team: sharks, teamName: sharksName)
    
    return letters
}

let letters = sendLetterToGuardian(league: league)
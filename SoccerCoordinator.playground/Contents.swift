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


//MARK: Part 2 (With extra credit)

// Declaration of the three teams
var dragons = [[String:NSObject]]()
var raptors = [[String:NSObject]]()
var sharks = [[String:NSObject]]()

//There is 3 phases to this function
// Step 1. separate experimented player from non experimented
// Step 2. order player from smallest to tallest
// Step 3. affect the player evenly into three teams
func sortPlayerIntoThreeTeams(players players:[[String:NSObject]]) -> (team1:[[String:NSObject]], team2:[[String:NSObject]], team3:[[String:NSObject]]){
    
    //STEP 1.
    //Create an Array of experimented players and one of inexperimented players
    var playersXp = [[String:NSObject]]()
    var playersNonXp = [[String:NSObject]]()
    
    for player in players {
        //Check if the player has experience and asign it to a constant
        let experience = player["Experience"] as! Bool
        
        if experience {
            // The player is experimented, affect it to the experimented array
            playersXp.append(player)
        } else {
            // The player is Not experimented, affect it to the Non experimented array
            playersNonXp.append(player)
        }
    }
    
    //STEP 2.
    //order the player from smallest to tallest
    func sortPlayers(players: [[String:NSObject]]) -> [[String:NSObject]]{
        
        // create an internal players array for manipulation
        var players = players
        
        // create a variable to keep track of the number of players in order
        var playersInOrder = 0
        
        //While all the players aren't in order, the players are sorted
        repeat {
            // (re)initialize the number of players in order
            playersInOrder = 0
            
            // Loop through all players
            for index in 0..<players.count {
                //extract the currenct player and his height
                let player = players[index]
                let height = player["Height"] as! Int
                
                //Since we swap with the next player, we make sure that we aren't at the end of the array
                if index < players.count - 1 {
                    //extract the next player and his height
                    let nextPlayer = players[index + 1]
                    let nextHeight = nextPlayer["Height"] as! Int
                    
                    //check if the current player is taller than the next
                    if height > nextHeight {
                        // The player is taller, we swap the two players
                        players[index + 1] = player
                        players[index] = nextPlayer
                    } else {
                        //The player and the next player are in good order or the same height
                        playersInOrder += 1
                    }
                }
            }
        } while playersInOrder < players.count - 1
        
        return players
    }
    
    playersXp = sortPlayers(playersXp)
    playersNonXp = sortPlayers(playersNonXp)
    
    //STEP 3.
    var team1 = [[String:NSObject]]()
    var team2 = [[String:NSObject]]()
    var team3 = [[String:NSObject]]()
    
    func affectPlayers(players: [[String:NSObject]]){
        var players = players
        var order = 1
        //affect players one by one into the teams while there is still players to affect.
        repeat {
            // if we affect the player in the same order every time, the second team will have a less average height, and the third even less. To avoid that, the order of affectation is changed every time.
            if order == 1 {
                team1.append(players.removeLast())
                team2.append(players.removeLast())
                team3.append(players.removeLast())
                order = 2
            } else if order == 2 {
                team2.append(players.removeLast())
                team3.append(players.removeLast())
                team1.append(players.removeLast())
                order = 3
            } else {
                team3.append(players.removeLast())
                team2.append(players.removeLast())
                team1.append(players.removeLast())
                order = 1
            }
        } while players.isEmpty == false
    }
    
    affectPlayers(playersXp)
    affectPlayers(playersNonXp)
    
    return (team1, team2, team3)
}



dragons = sortPlayerIntoThreeTeams(players: players).team1
raptors = sortPlayerIntoThreeTeams(players: players).team2
sharks = sortPlayerIntoThreeTeams(players: players).team3


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


//MARK: verification
func checkTheAverageHeight(team1:[[String:NSObject]], team2:[[String:NSObject]], team3:[[String:NSObject]]) -> Double {
    
    func getAverageHeightOfTheTeam(team:[[String:NSObject]]) -> Double{
        var totalHeight = Double()
        for player in team {
            let height = player["Height"] as! Double
            totalHeight += height
        }
        return totalHeight / Double(team.count)
    }
    
    let avgTeam1 = getAverageHeightOfTheTeam(team1)
    let avgTeam2 = getAverageHeightOfTheTeam(team2)
    let avgTeam3 = getAverageHeightOfTheTeam(team3)
    
    func sortTeamAvg(teams:[Double]) -> [Double]{
        var teamsAvgInOrder = 0
        var teams = teams
        repeat {
            teamsAvgInOrder = 0
            for index in 0..<teams.count {
                if index < teams.count - 1 {
                    if teams[index] > teams[index + 1] {
                        // The player is taller, we swap the two players
                        let tempTeam = teams[index + 1]
                        teams[index + 1] = teams[index]
                        teams[index] = tempTeam
                    } else {
                        //The player and the next player are in good order or the same height
                        teamsAvgInOrder += 1
                    }
                }
            }
        } while teamsAvgInOrder < teams.count - 1
        return teams
    }
    
    let sortedAvgTeam = sortTeamAvg([avgTeam1,avgTeam2,avgTeam3])
    
    return sortedAvgTeam[2] - sortedAvgTeam[0]
}

checkTheAverageHeight(raptors, team2: sharks, team3: dragons)










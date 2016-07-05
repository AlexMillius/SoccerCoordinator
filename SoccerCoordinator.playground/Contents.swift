import UIKit

//MARK: Part1

//Declaration of the empty array of player
var players = [[String:NSObject]]()

//Ideally a player should be a class with a name, height, experience and guardian constant. Those constant should be initialised with an init. But since I can't use a class implementation, my array of players is just an array of dictionaries String:NSObject.


//To avoid typo, I create four strings keys and the names of the teams
let name = "Name"
let height = "Height"
let experience = "Experience"
let guardian = "Guardian"
let raptorsName = "Raptors"
let dragonsName = "Dragons"
let sharksName = "Sharks"

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
            //Check the difference of experienced players in each teams and affect the experienced player in the team with the less experienced players. After the affectation in a team, the number of experienced players in the team is incremented.
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

print(dragons)
print(dragons.count)
print("\n")
print(raptors)
print(raptors.count)
print("\n")
print(sharks)
print(sharks.count)


//MARK: Part 3

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
    createLetter(team: dragons, teamName: dragonsName)
    createLetter(team: raptors, teamName: raptorsName)
    createLetter(team: sharks, teamName: sharksName)
    
    return letters
}

let letters = sendLetterToGuardian(league: league)

//MARK: extra credit
func balanceHeight(dragons dragons:[[String:NSObject]], raptors: [[String:NSObject]], sharks: [[String:NSObject]]) -> (dragons:[[String:NSObject]], raptors: [[String:NSObject]], sharks: [[String:NSObject]]){
    
    var tempDragons = [[String:NSObject]]()
    var tempRaptors = [[String:NSObject]]()
    var tempSharks = [[String:NSObject]]()
    
    func getBiggestAndSmallestPlayerWithAvgTeamSize(team team:[[String:NSObject]]) -> (biggest:[String:NSObject], smallest:[String:NSObject], biggestXp:[String:NSObject], smallestXp:[String:NSObject], avgSize:Double, biggestIndex:Int, smallestIndex:Int, biggestIndexXp:Int, smallestIndexXp:Int){
        
        var index = 0
        
        var tempBiggestPlayerHeight = 0
        var tempBiggestPlayerIndex = 0
        var tempSmallestPlayerHeight = 1000
        var tempSmallestPlayerIndex = 0
        var tempSmallestPlayer = [String:NSObject]()
        var tempBiggestPlayer = [String:NSObject]()
        
        var tempBiggestPlayerHeightXp = 0
        var tempBiggestPlayerXpIndex = 0
        var tempSmallestPlayerHeightXp = 1000
        var tempSmallestPlayerXpIndex = 0
        var tempSmallestPlayerXp = [String:NSObject]()
        var tempBiggestPlayerXp = [String:NSObject]()
        
        var tempTotalSize = 0.0
        
        while index < team.count {
            
            let tempPlayer = team[index]
            let tempPlayerHeight = tempPlayer["Height"] as! Int
            let playerHaveXp = tempPlayer["Experience"] as! Bool
            
            if playerHaveXp {
                if  tempPlayerHeight > tempBiggestPlayerHeightXp {
                    tempBiggestPlayerHeightXp = tempPlayer["Height"] as! Int
                    tempBiggestPlayerXp = tempPlayer
                    tempBiggestPlayerXpIndex = index
                }
                
                if  tempPlayerHeight < tempSmallestPlayerHeightXp {
                    tempSmallestPlayerHeightXp = tempPlayerHeight
                    tempSmallestPlayerXp = tempPlayer
                    tempSmallestPlayerIndex = index
                }
            } else {
                if  tempPlayerHeight > tempBiggestPlayerHeight {
                    tempBiggestPlayerHeight = tempPlayer["Height"] as! Int
                    tempBiggestPlayer = tempPlayer
                    tempBiggestPlayerIndex = index
                }
                
                if  tempPlayerHeight < tempSmallestPlayerHeight {
                    tempSmallestPlayerHeight = tempPlayerHeight
                    tempSmallestPlayer = tempPlayer
                    tempSmallestPlayerXpIndex = index
                }
            }
            
            tempTotalSize += Double(tempPlayerHeight)
            
            index += 1
        }
        
        let avgTeamSize = tempTotalSize / Double(team.count)
        
        return (tempBiggestPlayer, tempSmallestPlayer, tempBiggestPlayerXp, tempSmallestPlayerXp, avgTeamSize, tempBiggestPlayerIndex, tempSmallestPlayerIndex, tempBiggestPlayerXpIndex, tempSmallestPlayerXpIndex)
    }
    
    let biggestDragon = getBiggestAndSmallestPlayerWithAvgTeamSize(team: dragons).biggest
    let biggestDragonIndex = getBiggestAndSmallestPlayerWithAvgTeamSize(team: dragons).biggestIndex
    let smallestDragon = getBiggestAndSmallestPlayerWithAvgTeamSize(team: dragons).smallest
    let smallestDragonIndex = getBiggestAndSmallestPlayerWithAvgTeamSize(team: dragons).smallestIndex
    let biggestDragonXp = getBiggestAndSmallestPlayerWithAvgTeamSize(team: dragons).biggestXp
    let biggestDragonXpIndex = getBiggestAndSmallestPlayerWithAvgTeamSize(team: dragons).biggestIndexXp
    let smallestDragonXp = getBiggestAndSmallestPlayerWithAvgTeamSize(team: dragons).smallestXp
    let smallestDragonXpIndex = getBiggestAndSmallestPlayerWithAvgTeamSize(team: dragons).smallestIndexXp
    let avgDragon = getBiggestAndSmallestPlayerWithAvgTeamSize(team: dragons).avgSize

    let biggestRaptor = getBiggestAndSmallestPlayerWithAvgTeamSize(team: raptors).biggest
    let biggestRaptorIndex = getBiggestAndSmallestPlayerWithAvgTeamSize(team: raptors).biggestIndex
    let smallestRaptor = getBiggestAndSmallestPlayerWithAvgTeamSize(team: raptors).smallest
    let smallestRaptorIndex = getBiggestAndSmallestPlayerWithAvgTeamSize(team: raptors).smallestIndex
    let biggestRaptorXp = getBiggestAndSmallestPlayerWithAvgTeamSize(team: raptors).biggestXp
    let biggestRaptorXpIndex = getBiggestAndSmallestPlayerWithAvgTeamSize(team: raptors).biggestIndexXp
    let smallestRaptorXp = getBiggestAndSmallestPlayerWithAvgTeamSize(team: raptors).smallestXp
    let smallestRaptorXpIndex = getBiggestAndSmallestPlayerWithAvgTeamSize(team: raptors).smallestIndexXp
    let avgRaptor = getBiggestAndSmallestPlayerWithAvgTeamSize(team: raptors).avgSize
    
    let biggestShark = getBiggestAndSmallestPlayerWithAvgTeamSize(team: sharks).biggest
    let biggestSharkIndex = getBiggestAndSmallestPlayerWithAvgTeamSize(team: sharks).biggestIndex
    let smallestShark = getBiggestAndSmallestPlayerWithAvgTeamSize(team: sharks).smallest
    let smallestSharkIndex = getBiggestAndSmallestPlayerWithAvgTeamSize(team: sharks).smallestIndex
    let biggestSharkXp = getBiggestAndSmallestPlayerWithAvgTeamSize(team: sharks).biggestXp
    let biggestSharkXpIndex = getBiggestAndSmallestPlayerWithAvgTeamSize(team: sharks).biggestIndexXp
    let smallestSharkXp = getBiggestAndSmallestPlayerWithAvgTeamSize(team: sharks).smallestXp
    let smallestSharkXpIndex = getBiggestAndSmallestPlayerWithAvgTeamSize(team: sharks).smallestIndexXp
    let avgShark = getBiggestAndSmallestPlayerWithAvgTeamSize(team: sharks).avgSize
    
    func swapPlayers(indexBiggest iBig: Int, teamBiggest:[[String:NSObject]], indexSmallest iSmall:Int, teamSmallest:[[String:NSObject]]) -> (teamBiggest:[[String:NSObject]], teamSmallest:[[String:NSObject]]){
        
        var tempBiggestTeam = teamBiggest
        var tempSmallestTeam = teamSmallest
        
        tempSmallestTeam.append(tempBiggestTeam.removeAtIndex(iBig))
        tempBiggestTeam.append(tempSmallestTeam.removeAtIndex(iSmall))
        
        return (tempBiggestTeam, tempSmallestTeam)
    }
    
    if avgDragon > avgRaptor && avgDragon > avgShark {
        //Dragons have the biggest height
        if avgRaptor < avgShark {
            //Raptors have the smallest height
            let tempSwap = swapPlayers(indexBiggest: biggestDragonIndex, teamBiggest: dragons, indexSmallest: smallestRaptorIndex, teamSmallest: raptors)
            tempDragons = tempSwap.teamBiggest
            tempRaptors = tempSwap.teamSmallest
            tempSharks = sharks
        } else {
            //Sharks have the smallest height
            let tempSwap = swapPlayers(indexBiggest: biggestDragonIndex, teamBiggest: dragons, indexSmallest: smallestSharkIndex, teamSmallest: sharks)
            tempDragons = tempSwap.teamBiggest
            tempSharks = tempSwap.teamSmallest
            tempRaptors = raptors
        }
    } else if avgRaptor > avgDragon && avgRaptor > avgShark{
        //Raptors have the biggest height
        if avgDragon < avgShark {
            //Dragons have the smallest height
            let tempSwap = swapPlayers(indexBiggest: biggestRaptorIndex, teamBiggest: raptors, indexSmallest: smallestDragonIndex, teamSmallest: dragons)
            tempRaptors = tempSwap.teamBiggest
            tempDragons = tempSwap.teamSmallest
            tempSharks = sharks
        } else {
            //Sharks have the smallest height
            let tempSwap = swapPlayers(indexBiggest: biggestRaptorIndex, teamBiggest: raptors, indexSmallest: smallestSharkIndex, teamSmallest: sharks)
            tempRaptors = tempSwap.teamBiggest
            tempSharks = tempSwap.teamSmallest
            tempDragons = dragons
        }
        
    } else {
        //Sharks have the biggest height
        if avgRaptor < avgDragon {
            //Raptors have the smallest height
            let tempSwap = swapPlayers(indexBiggest: biggestSharkIndex, teamBiggest: sharks, indexSmallest: smallestRaptorIndex, teamSmallest: raptors)
            tempSharks = tempSwap.teamBiggest
            tempRaptors = tempSwap.teamSmallest
            tempDragons = dragons
        } else {
            //Dragons have the smallest height
            let tempSwap = swapPlayers(indexBiggest: biggestSharkIndex, teamBiggest: sharks, indexSmallest: smallestDragonIndex, teamSmallest: dragons)
            tempSharks = tempSwap.teamBiggest
            tempDragons = tempSwap.teamSmallest
            tempRaptors = raptors
        }
    }
    
    return (tempDragons,tempRaptors,tempSharks)
    
}

let newLeague = balanceHeight(dragons: dragons, raptors: raptors, sharks: sharks)

dragons = newLeague.dragons
dragons.count
raptors = newLeague.raptors
raptors.count
sharks = newLeague.sharks
sharks.count

func printAverageHeightOfTeams(dragons dragons:[[String:NSObject]], raptors: [[String:NSObject]], sharks: [[String:NSObject]]){
    
    var totHeightDragons = 0.0
    var totHeightRaptors = 0.0
    var totHeightSharks = 0.0
    
    for dragon in dragons{
        let tempHeight = dragon["Height"] as! Double
        totHeightDragons += tempHeight
    }
    for raptor in raptors {
        let tempHeight = raptor["Height"] as! Double
        totHeightRaptors += tempHeight
    }
    for shark in sharks {
        let tempHeight = shark["Height"] as! Double
        totHeightSharks += tempHeight
    }
    
    var avgDragons = totHeightDragons / Double(dragons.count)
    var avgRaptors = totHeightRaptors / Double(raptors.count)
    var avgSharks = totHeightSharks / Double(raptors.count)
    
    print(avgDragons)
    print(avgRaptors)
    print(avgSharks)
}

printAverageHeightOfTeams(dragons: dragons, raptors: raptors, sharks: sharks)


//Project 1 for TeamTreeHouse

//Author: Millius Alex

//Instructions for the project at the bottom.

import UIKit

//MARK: Part1

//Declaration of the empty array of player
// a type alias could make it cleaner
var players = [[String:NSObject]]()

//Ideally a player should be a class with a name, height, experience and guardian constant. These constants should be initialised with an init. But since I can't use a class implementation, my array of players is just an array of dictionaries String:NSObject.


//To avoid typo, I create four strings keys
let nameKey = "Name"
let heightKey = "Height"
let experienceKey = "Experience"
let guardianKey = "Guardian"
// declaration of the names of teams to avoid typos
let raptorsName = "Raptors"
let dragonsName = "Dragons"
let sharksName = "Sharks"

// implementation of each individual player
let joeSmith = [nameKey:"Joe Smith",heightKey:42,experienceKey:true,guardianKey:"Jim and Jan Smith"]
let jillTanner = [nameKey:"Jill Tanner",heightKey:36,experienceKey:true,guardianKey:"Clara Tanner"]
let billBon = [nameKey:"Bill Bon",heightKey:43,experienceKey:true,guardianKey:"Sara and Jenny Bon"]
let evaGordon = [nameKey:"Eva Gordon",heightKey:45,experienceKey:false,guardianKey:"Wendy and Mike Gordon"]
let mattGill = [nameKey:"Matt Gill",heightKey:40,experienceKey:false,guardianKey:"Charles and Sylvia Gill"]
let kimmyStein = [nameKey:"Kimmy Stein",heightKey:41,experienceKey:false,guardianKey:"Bill and Hillary Stein"]
let sammyAdams = [nameKey:"Sammy Adams",heightKey:45,experienceKey:false,guardianKey:"Jeff Adams"]
let karlSaygan = [nameKey:"Karl Saygan",heightKey:42,experienceKey:true,guardianKey:"Heather Biedsoe"]
let suzaneGreenberg = [nameKey:"Suzane Greenberg",heightKey:44,experienceKey:true,guardianKey:"Henrietta Dumas"]
let salDali = [nameKey:"Sal Dali",heightKey:41,experienceKey:false,guardianKey:"Gala Dali"]
let joeKavalier = [nameKey:"Joe Kavalier",heightKey:39,experienceKey:false,guardianKey:"Sam and Elaine Kavalier"]
let benFinkeistein = [nameKey:"Ben Finkeistein",heightKey:44,experienceKey:false,guardianKey:"Aaron and Jill Finkeistein"]
let diegoSoto = [nameKey:"Diego Soto",heightKey:41,experienceKey:true,guardianKey:"Robin and Sarika Soto"]
let chloeAlaska = [nameKey:"Chloe Alaska",heightKey:47,experienceKey:false,guardianKey:"David and Jamie Alaska"]
let arnoldWillis = [nameKey:"Arnold Willis",heightKey:43,experienceKey:false,guardianKey:"Claire Willis"]
let philipHelm = [nameKey:"Philip Helm",heightKey:44,experienceKey:true,guardianKey:"Thomas Helm and Eva Jones"]
let lesClay = [nameKey:"Les Clay",heightKey:42,experienceKey:true,guardianKey:"Wynonna Brown"]
let herschelKrustofski = [nameKey:"Herschel Krustofski",heightKey:45,experienceKey:true,guardianKey:"Hyman and Rachel Krustofski"]

//Implementation off all the 18 players into the players array
players = [joeSmith,jillTanner,billBon,evaGordon,mattGill,kimmyStein,sammyAdams,karlSaygan,suzaneGreenberg,salDali,joeKavalier,benFinkeistein,diegoSoto,chloeAlaska,arnoldWillis,philipHelm,lesClay,herschelKrustofski]


//MARK: Part 2 (With extra credit)

// Declaration of the three teams
var dragons = [[String:NSObject]]()
var raptors = [[String:NSObject]]()
var sharks = [[String:NSObject]]()

//There is three phases to this function
// Step 1. Separate experimented players from non experimented
// Step 2. Order player from smallest to tallest
// Step 3. Affect the players evenly into three teams
func sortPlayerIntoThreeTeams(players players:[[String:NSObject]]) -> ([[[String:NSObject]]]){
    
    //STEP 1.
    //Create an Array of experimented and inexperimented players
    var playersXp = [[String:NSObject]]()
    var playersNonXp = [[String:NSObject]]()
    
    //Loop through each player
    for player in players {
        // Check if the player has experience and assign it to the proper array
        if player[experienceKey] as! Bool {
            playersXp.append(player)
        } else {
            playersNonXp.append(player)
        }
    }
    
    //STEP 2.
    //order the player from smallest to tallest
    //of course, .sort on the arrays would be the best practice
    func sortPlayers(players: [[String:NSObject]]) -> [[String:NSObject]]{
        
        // create an internal players array for manipulation (since we can't use inout parameter for this project)
        var players = players
        
        // create a variable to keep track of the number of players in order
        var playersInOrder = 0
        
        //While all the players aren't in order, the players are sorted
        repeat {
            // reinitialize the number of players in order
            playersInOrder = 0
            
            // Loop through all players
            for index in 0..<players.count {
                
                //extract the currenct player and his height
                let player = players[index]
                let currentHeight = player[heightKey] as! Int
                
                //Since we swap with the next player, we make sure that we aren't at the end of the array
                if index < players.count - 1 {
                    //extract the next player and his height
                    let nextPlayer = players[index + 1]
                    let nextHeight = nextPlayer[heightKey] as! Int
                    
                    //check if the current player is taller than the next
                    if currentHeight > nextHeight {
                        // The player is taller, we swap the two players
                        players[index + 1] = player
                        players[index] = nextPlayer
                    } else {
                        //The player and the next player are in right order or the same height
                        playersInOrder += 1
                    }
                } // end of if statement
            } // end of for loop
        } while playersInOrder < players.count - 1
        
        return players
    }
    
    playersXp = sortPlayers(playersXp)
    playersNonXp = sortPlayers(playersNonXp)
    
    //STEP 3.
    //Create three teams variables
    var team1 = [[String:NSObject]]()
    var team2 = [[String:NSObject]]()
    var team3 = [[String:NSObject]]()
    
    func affectPlayers(players: [[String:NSObject]]){
        
        // create an internal players array for manipulation (since we don't "know" inout parameter)
        var players = players
        
        // create a variable to swap between 3 order of appending players
        // (an enum of the 3 appending versions is cleaner)
        var order = 1
        
        // create an index to affect the players from the players array into teams
        var index = 0
        
        repeat {
            // if we affect the player in the same order every time, the second team will have a less average height, and the third even less. To avoid that, the order of affectation is changed every time.
            if order == 1 {
                team1.append(players[index])
                index += 1
                team2.append(players[index])
                index += 1
                team3.append(players[index])
                index += 1
                order = 2
            } else if order == 2 {
                team2.append(players[index])
                index += 1
                team3.append(players[index])
                index += 1
                team1.append(players[index])
                index += 1
                order = 3
            } else {
                team3.append(players[index])
                index += 1
                team2.append(players[index])
                index += 1
                team1.append(players[index])
                index += 1
                order = 1
            }
            //(.removeLast on the players and checking if the array is empty is cleaner but we don't "know" it yet.)
        } while index < players.count
    }
    
    affectPlayers(playersXp)
    affectPlayers(playersNonXp)
    
    //To avoid running the function three times with a return type of a tuple with three teams, the function return an array of teams
    return [team1, team2, team3]
}

let teamsOrdered = sortPlayerIntoThreeTeams(players: players)

dragons = teamsOrdered[0]
raptors = teamsOrdered[1]
sharks = teamsOrdered[2]

let league = [dragonsName:dragons,raptorsName:raptors,sharksName:sharks]


//MARK: Part 3

func sendLetterToGuardian(league league:[String:[[String:NSObject]]]) -> [String]{
    
    //create an array of letters to stock every letter.
    var letters = [String]()
    
    // nested function to create the letter
    func createLetter(team team:[[String:NSObject]], teamName:String){
        
        for player in team {
            
            //Extract the playerName and guardian of the player
            let playerName = player[nameKey] as! String
            let guardian = player[guardianKey] as! String
            
            //Switch through the names of teams to affect the first practice date
            var practiceDate = String()
            switch teamName {
            case dragonsName: practiceDate = "March 17, 1pm"
            case raptorsName: practiceDate = "March 18, 1pm"
            case sharksName: practiceDate = "March 17, 3pm"
            default: break
            }
            
            //Construct the letter by string interpollation
            let letter = "Hi \(guardian), \(playerName) is in the \(teamName) this year! The first practice day is \(practiceDate)."
            
            //append the letter to the array of letters
            letters.append(letter)
        }
    }
    
    // extraction of the teams from the league
    let raptors = league[raptorsName]!
    let dragons = league[dragonsName]!
    let sharks = league[sharksName]!
    
    //create the letters for each teams
    createLetter(team: raptors, teamName: raptorsName)
    createLetter(team: dragons, teamName: dragonsName)
    createLetter(team: sharks, teamName: sharksName)
    
    return letters
}

let letters = sendLetterToGuardian(league: league)




//MARK: verification. Not needed in the project but usefull to check if it's correct
func checkAverageExpectation(team1:[[String:NSObject]], team2:[[String:NSObject]], team3:[[String:NSObject]]) -> Bool {
    
    // loop to each player in a team to calculate the average height of the team
    func getAverageHeightOfTheTeam(team:[[String:NSObject]]) -> Double{
        var totalHeight = Double()
        for player in team {
            let height = player[heightKey] as! Double
            totalHeight += height
        }
        return totalHeight / Double(team.count)
    }
    
    let avgTeam1 = getAverageHeightOfTheTeam(team1)
    let avgTeam2 = getAverageHeightOfTheTeam(team2)
    let avgTeam3 = getAverageHeightOfTheTeam(team3)
    
    //sort teams from the smallest average to the tallest average
    func sortTeamAvg(teams:[Double]) -> [Double]{
        var teamsAvgInOrder = 0
        var teams = teams
        repeat {
            teamsAvgInOrder = 0
            for index in 0..<teams.count {
                if index < teams.count - 1 {
                    if teams[index] > teams[index + 1] {
                        let tempTeam = teams[index + 1]
                        teams[index + 1] = teams[index]
                        teams[index] = tempTeam
                    } else {
                        teamsAvgInOrder += 1
                    }
                }
            }
        } while teamsAvgInOrder < teams.count - 1
        return teams
    }
    
    let sortedAvgTeam = sortTeamAvg([avgTeam1,avgTeam2,avgTeam3])
    
    //calculate the difference between the tallest team and the smallest
    let maxDiff = sortedAvgTeam[2] - sortedAvgTeam[0]
    
    //Check if the difference is inferior to 1.5, has given in the instructions
    return maxDiff < 1.5
}

let averageDiffIsInferiorToOnePointFive = checkAverageExpectation(raptors, team2: sharks, team3: dragons)


//INSTRUCTIONS:
/*You have volunteered to be the Coordinator for your town’s youth soccer league. As part of your job you need to divide the 18 children who have signed up for the league into three even teams - Dragons, Sharks and Raptors. In years’ past, the teams have been unevenly matched, so this year you are doing your best to fix that. For each child, you will have the following information: Name, height (in inches), whether or not they have played soccer before and their guardians’ names.

The project has three major parts. For each part, choose ONLY from the tools we have covered in the courses so far:

Native types and collections to store data (Dictionaries, Arrays, Ints, Strings, etc...)
Accessing, appending and counting Arrays
Accessing Dictionaries and Arrays
Creating control flow
Use of comparison operators
String Interpolation
Use of comments
Please don’t employ more advanced tools we haven’t covered yet, even if they are right for the job. (Yes, that means no classes, structs, tuples or filters on Project 1.) However, if you identify a place where a more advanced tool is appropriate, please mention that in a code comment.

Part 1: We have provided information for the 18 players in the Player Info spreadsheet. Please choose an appropriate data type to store the information for each player. In addition, create an empty collection variable to hold all the players’ data. Once you have decided on what tools to use, manually enter the player data so it can be used in Part 2.
 Part 2: Create logic that can iterate through all 18 players and assign them to teams such that the number of experienced players on each team are the same. Store each team’s players in its own new collection variable for use in Part 3. (Please note: your logic should work correctly regardless of the initial ordering of the players and should work, if we theoretically had more or less than 18 players, so NO MAGIC NUMBERS!)
 
 Also, if you would like to attain an “exceeds expectations” rating for this project, add logic to ensure that each teams’ average height is within 1.5 inches of the others.
 
 Part 3: Create logic that iterates through all three teams of players and generates a personalized letter to the guardians, letting them know which team their child has been placed on and when they should attend their first team team practice. As long as you provide the necessary information (player name, team name, guardians’ names, practice date/time), feel free to have fun with the content of the letter. The team practice dates/times are as follows: Dragons - March 17, 1pm, Sharks - March 17, 3pm, Raptors - March 18, 1pm
 
 When your complete code is run in a playground the letters should be visible in the right hand pane. If the code is run within an actual Xcode Project, the letters should be visible in the console.
 
 As always, meaningful and concise code comments are expected. Your code should be written and refined in an Xcode playground or Xcode project, but be sure to upload it to GitHub, as per the instructions provided in the Soccer Coordinator Video Instruction, linked below.
 
 Good luck and Happy Coding!
 */






import UIKit

//MARK: Part1

//Declaration of the empty array of player. Ideally a player should be a class with a name, height, experience and guardian constant. Those constant should be initialised with an init. But since I can't use a class implementation, my array of players is just an array of dictionaries String:NSObject.
var players = [[Dictionary<String, NSObject>]]()

// implementation of each individual player. There is a high risk of typo with this method. A class would have been safer.
let joeSmith = [["Name":"Joe Smith"],["Height":42],["Experience":true],["Guardian":"Jim and Jan Smith"]]
let jillTanner = [["Name":"Jill Tanner"],["Height":36],["Experience":true],["Guardian":"Clara Tanner"]]
let billBon = [["Name":"Bill Bon"],["Height":43],["Experience":true],["Guardian":"Sara and Jenny Bon"]]
let evaGordon = [["Name":"Eva Gordon"],["Height":45],["Experience":false],["Guardian":"Wendy and Mike Gordon"]]
let mattGill = [["Name":"Matt Gill"],["Height":40],["Experience":false],["Guardian":"Charles and Sylvia Gill"]]
let kimmyStein = [["Name":"Kimmy Stein"],["Height":41],["Experience":false],["Guardian":"Bill and Hillary Stein"]]
let sammyAdams = [["Name":"Sammy Adams"],["Height":45],["Experience":false],["Guardian":"Jeff Adams"]]
let karlSaygan = [["Name":"Karl Saygan"],["Height":42],["Experience":true],["Guardian":"Heather Biedsoe"]]
let suzaneGreenberg = [["Name":"Suzane Greenberg"],["Height":44],["Experience":true],["Guardian":"Henrietta Dumas"]]
let salDali = [["Name":"Sal Dali"],["Height":41],["Experience":false],["Guardian":"Gala Dali"]]
let joeKavalier = [["Name":"Joe Kavalier"],["Height":39],["Experience":false],["Guardian":"Sam and Elaine Kavalier"]]
let benFinkeistein = [["Name":"Ben Finkeistein"],["Height":44],["Experience":false],["Guardian":"Aaron and Jill Finkeistein"]]
let diegoSoto = [["Name":"Diego Soto"],["Height":41],["Experience":true],["Guardian":"Robin and Sarika Soto"]]
let chloeAlaska = [["Name":"Chloe Alaska"],["Height":47],["Experience":false],["Guardian":"David and Jamie Alaska"]]
let arnoldWillis = [["Name":"Arnold Willis"],["Height":43],["Experience":false],["Guardian":"Claire Willis"]]
let philipHelm = [["Name":"Philip Helm"],["Height":44],["Experience":true],["Guardian":"Thomas Helm and Eva Jones"]]
let lesClay = [["Name":"Les Clay"],["Height":42],["Experience":true],["Guardian":"Wynonna Brown"]]
let herschelKrustofski = [["Name":"Herschel Krustofski"],["Height":45],["Experience":true],["Guardian":"Hyman and Rachel Krustofski"]]

//Implementation off all the 18 players into the players array
players = [joeSmith,jillTanner,billBon,evaGordon,mattGill,kimmyStein,sammyAdams,karlSaygan,suzaneGreenberg,salDali,joeKavalier,benFinkeistein,diegoSoto,chloeAlaska,arnoldWillis,philipHelm,lesClay,herschelKrustofski]


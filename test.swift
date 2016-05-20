//
//  ViewController.swift
//  VerbConjugator
//
//  Created by Bhanu Prakash  on 18/05/16.
//  Copyright © 2016 Bhanu. All rights reserved.
//


class ViewController{
enum GroupEnumT: Int {
    case GroupOneEndingEru = 0
    case GroupOneEndingIru
    case GroupTwoEndingU
    case GroupTwoEndingTsu
    case GroupTwoEndingRu
    case GroupTwoEndingBu
    case GroupTwoEndingMu
    case GroupTwoEndingNu
    case GroupTwoEndingKu
    case GroupTwoEndingGu
    case GroupTwoEndingSu
    case GroupIrregularVerbSuru
    case GroupIrregularVerbKuru
}

enum PolitenessLevelEnumT : Int {
    case PolitenessLevelPlain = 0
    case PolitenessLevelPolite
}

enum SentenceSignEnumT : Int {
    case SentenceSignPositive = 0
    case SentenceSignNegative
    case SentenceSignInterrogative
}


enum TenseEnumT : Int {
    case TenseEmpty = 0
    case TensePast
    case TenseNonPast
}


enum MoodEnumT : Int {
    case MoodIndicative = 0
    case MoodVolitional
    case MoodImperative
    case MoodConditional
    case MoodPotential
    case MoodCausative
}


enum AspectEnumT : Int {
    case AspectEmpty = 0
    case AspectProgressive
    case AspectProvisional
    case AspectTara
}

enum GenderEnumT : Int {
    case GenderEmpty = 0
    case GenderNeutral
    case GenderMasculine
    case GenderFeminine
}

enum NumberEnumT : Int {
    case NumberEmpty = 0
    case NumberZero
    case NumberSingular
    case NumberDual
    case NumberPlural
}

enum PersonEnumT : Int {
    case PersonEmpty = 0
    case PersonFirst
    case PersonSecond
    case PersonThird
}

enum VoiceEnumT : Int {
    case VoiceActive = 0
    case VoicePassive
}

enum TextEnumT : Int {
    case TextBaseOne = 0
    case TextBaseTwo
    case TextBaseThree
    case TextBaseFour
    case TextBaseFive
    case TextFormTe
    case TextFormTa
    case TextVerbStem
}


//struct for input
struct VerbInput {
    var rootOfVerb: String
    var group:      GroupEnumT
    // var rootOfVerb="hare"
    // var group=GroupEnumT.GroupTwoEndingTsu
    
    init(_ root: String,_ tempgroup: GroupEnumT){
        self.rootOfVerb=root
        self.group=tempgroup
    }
}

struct  TenseInput {
    var politenessLevel:PolitenessLevelEnumT
    var sentenceSign:   SentenceSignEnumT
    var tense:          TenseEnumT
    var mood:           MoodEnumT
    
    
    init(_ tempPolitenessLevel: PolitenessLevelEnumT,_ tempSentenceSign: SentenceSignEnumT,_ tempTense: TenseEnumT,_ tempMood:MoodEnumT){
        self.politenessLevel=tempPolitenessLevel
        self.sentenceSign=tempSentenceSign
        self.tense=tempTense
        self.mood=tempMood
    }
//   var politenessLevel=PolitenessLevelEnumT.PolitenessLevelPolite
//     var sentenceSign=SentenceSignEnumT.SentenceSignNegative
//     var tense=TenseEnumT.TensePast
//     var mood=MoodEnumT.MoodIndicative
   // var aspect:         AspectEnumT
   // var number:         NumberEnumT
   // var person:         PersonEnumT
   // var voice:          VoiceEnumT
}
/*
//13 x 8 array which stores our static texts
let textTable: [[String]] = [
    ["","","ru","re","you","te","ta","tabe"],
    ["","","ru","re","you","te","ta","mi"],
    ["wa","i","u","e","ou","tte","tta","ai"],
    ["ta","chi","tsu","te","tou","tte","tta","harechi"],
    ["ra","ri","ru","re","rou","tte","tta","wakari"],
    ["ba","bi","bu","be","bou","nde","nda","narabi"],
    ["ma","mi","mu","me","mou","nde","nda","sumi"],
    ["na","ni","nu","ne","nou","nde","nda","shini"],
    ["ka","ki","ku","ke","kou","ite","ita","saki"],
    ["ga","gi","gu","ge","gou","ide","ida","oyogi"],
    ["sa","shi","su","se","sou","shite","shita","hanashi"],
    ["","","","","","","",""],
    ["","","","","","","",""]]
*/


//print(endingpart)
//print(columnIndex)



var groupDict: [GroupEnumT:[String]] = [GroupEnumT.GroupOneEndingEru:["","","ru","re","you","te","ta","tabe"],GroupEnumT.GroupOneEndingIru:["","","ru","re","you","te","ta","mi"],GroupEnumT.GroupTwoEndingU:["wa","i","u","e","ou","tte","tta","ai"],GroupEnumT.GroupTwoEndingTsu:["ta","chi","tsu","te","tou","tte","tta","harechi"],GroupEnumT.GroupTwoEndingRu:["ra","ri","ru","re","rou","tte","tta","wakari"],GroupEnumT.GroupTwoEndingBu: ["ba","bi","bu","be","bou","nde","nda","narabi"],GroupEnumT.GroupTwoEndingMu:["ma","mi","mu","me","mou","nde","nda","sumi"],GroupEnumT.GroupTwoEndingNu:["na","ni","nu","ne","nou","nde","nda","shini"],GroupEnumT.GroupTwoEndingKu:["ka","ki","ku","ke","kou","ite","ita","saki"],GroupEnumT.GroupTwoEndingGu:["ga","gi","gu","ge","gou","ide","ida","oyogi"],GroupEnumT.GroupTwoEndingSu:["sa","shi","su","se","sou","shite","shita","hanashi"]]
//print(groupDict[GroupEnumT.GroupOneEndingEru]!)




func conjugator(verbinput: VerbInput,tenseinput: TenseInput)->String{



    
    let tenseTable = (tenseinput.politenessLevel,  tenseinput.sentenceSign,  tenseinput.tense, tenseinput.mood )
    

    //var firstPart=verbinput.rootOfVerb
    var endingpart: String
    var columnIndex:Int = 0
    
    switch tenseTable {
    
    case ( PolitenessLevelEnumT.PolitenessLevelPolite, SentenceSignEnumT.SentenceSignPositive, TenseEnumT.TenseNonPast, MoodEnumT.MoodIndicative ) :
        endingpart = "masu"
        columnIndex = TextEnumT.TextBaseTwo.rawValue
    case ( PolitenessLevelEnumT.PolitenessLevelPolite, SentenceSignEnumT.SentenceSignNegative, TenseEnumT.TenseNonPast, MoodEnumT.MoodIndicative ) :
        endingpart = "masen"
        columnIndex = TextEnumT.TextBaseTwo.rawValue
    case ( PolitenessLevelEnumT.PolitenessLevelPolite, SentenceSignEnumT.SentenceSignPositive, TenseEnumT.TensePast, MoodEnumT.MoodIndicative ) :
        endingpart = "mashita"
        columnIndex = TextEnumT.TextBaseTwo.rawValue
    case ( PolitenessLevelEnumT.PolitenessLevelPolite, SentenceSignEnumT.SentenceSignNegative, TenseEnumT.TensePast, MoodEnumT.MoodIndicative ) :
        endingpart = "masen deshita"
        columnIndex = TextEnumT.TextBaseTwo.rawValue
    case ( PolitenessLevelEnumT.PolitenessLevelPolite, SentenceSignEnumT.SentenceSignPositive, TenseEnumT.TenseNonPast, _ ) :
        endingpart = "imasu"
        columnIndex = TextEnumT.TextFormTe.rawValue
    case ( PolitenessLevelEnumT.PolitenessLevelPolite, SentenceSignEnumT.SentenceSignNegative, TenseEnumT.TenseNonPast, _ ) :
        endingpart = "imasen"
        columnIndex = TextEnumT.TextFormTe.rawValue
    case ( PolitenessLevelEnumT.PolitenessLevelPolite, SentenceSignEnumT.SentenceSignPositive, TenseEnumT.TenseEmpty , MoodEnumT.MoodVolitional ) :
        endingpart = "mashou"
        columnIndex = TextEnumT.TextBaseTwo.rawValue
    case ( PolitenessLevelEnumT.PolitenessLevelPolite, SentenceSignEnumT.SentenceSignNegative, TenseEnumT.TenseEmpty , MoodEnumT.MoodVolitional ) :
        endingpart = "nai deshou"
        columnIndex = TextEnumT.TextBaseOne.rawValue
    case ( PolitenessLevelEnumT.PolitenessLevelPlain, SentenceSignEnumT.SentenceSignPositive, TenseEnumT.TenseNonPast, MoodEnumT.MoodIndicative ) :
        endingpart = ""
        columnIndex = TextEnumT.TextBaseThree.rawValue
    case ( PolitenessLevelEnumT.PolitenessLevelPlain, SentenceSignEnumT.SentenceSignNegative, TenseEnumT.TenseNonPast, MoodEnumT.MoodIndicative ) :
        endingpart = "nai"
        columnIndex = TextEnumT.TextBaseOne.rawValue
    case ( PolitenessLevelEnumT.PolitenessLevelPlain, SentenceSignEnumT.SentenceSignPositive, TenseEnumT.TensePast, MoodEnumT.MoodIndicative ) :
        endingpart = ""
        columnIndex = TextEnumT.TextFormTa.rawValue
    case ( PolitenessLevelEnumT.PolitenessLevelPlain, SentenceSignEnumT.SentenceSignNegative, TenseEnumT.TensePast, MoodEnumT.MoodIndicative ) :
        endingpart = "nakatta"
        columnIndex = TextEnumT.TextBaseOne.rawValue
    case ( PolitenessLevelEnumT.PolitenessLevelPlain, SentenceSignEnumT.SentenceSignPositive, TenseEnumT.TenseEmpty, MoodEnumT.MoodVolitional ) :
        endingpart = ""
        columnIndex = TextEnumT.TextBaseFive.rawValue
    case ( PolitenessLevelEnumT.PolitenessLevelPlain, SentenceSignEnumT.SentenceSignNegative, TenseEnumT.TenseEmpty, MoodEnumT.MoodVolitional ) :    endingpart = "nai darou"
        columnIndex = TextEnumT.TextBaseOne.rawValue
    default :
        endingpart = "_"

}
    let groupInfo=verbinput.group
    var greyPart: String
    greyPart=groupDict[groupInfo]![columnIndex]
    return verbinput.rootOfVerb + greyPart + endingpart   



}
var sampleVerb=VerbInput("waka",GroupEnumT.GroupTwoEndingRu)
var sampleTense=TenseInput(PolitenessLevelEnumT.PolitenessLevelPlain,SentenceSignEnumT.SentenceSignNegative,TenseEnumT.TensePast,MoodEnumT.MoodIndicative)
}
// var sampleVerb=VerbInput(root:"waka",tempgroup:GroupEnumT.GroupTwoEndingRu)
// var sampleTense=TenseInput(tempPolitenessLevel:PolitenessLevelEnumT.PolitenessLevelPlain,tempSentenceSign:SentenceSignEnumT.SentenceSignNegative,tempTense:TenseEnumT.TensePast,tempMood:MoodEnumT.MoodIndicative)
let viewController=ViewController()
var sampleverb=viewController.sampleVerb
var sampletense=viewController.sampleTense
print(viewController.conjugator(sampleverb,tenseinput: sampletense))

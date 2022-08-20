import Foundation
struct ScoreModel {
    var userScore = 0;
    
    mutating func updateUserScore(_ userGotItRight: Bool) -> Void {
        if userGotItRight {
            userScore += 1;
        }
    }
    mutating func resetScore () -> Void {
        userScore = 0;
    }
}

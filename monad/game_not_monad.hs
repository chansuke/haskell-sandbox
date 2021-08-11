type Card = Int
type Score = Int
type Hand = [Card]
type Stock = [Card]
type Player = String

game :: [Card] -> [(Score, Hand, Player)]
game deck = let
    (taroHand, deck2) = (take 5 deck, drop 5 deck)
    (hanakoHand, deck3) = (take 5 deck2, drop 5 deck2)
    (takashiHand, deck4) = (take 5 deck3, drop 5 deck3)
    (yumiHand, deck5) = (take 5 deck4, drop 5 deck4)

import Control.Monad.Trans.State
import Data.List

type Card = Int --カード
type Score = Int
type Hand = [Card] -- 手札
type Stock = [Card] -- 山札
type Player = String -- プレイヤー

drawCards
    :: Int
    -> State Stock Hand
drawCards n = do
  deck <- get
  put $ drop n deck
  return $ take n deck

gameWithState
    :: State Stock [(Score, Hand, Player)]

gameWithState = do
  taroHand <- drawCards 5
  hanakoHand <- drawCards 5
  takashiHand <- drawCards 5
  yumiHand <- drawCards 5
  return . reverse . sort $
    [ (sum taroHand, taroHand, "Taro")
    , (sum hanakoHand, hanakoHand, "Hanako")
    , (sum takashiHand, takashiHand, "Takashi")
    , (sum yumiHand, yumiHand, "Yumi")
    ]


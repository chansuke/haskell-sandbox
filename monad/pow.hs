import Control.Monad.Trans.Reader (Reader, runReader, asks, local)

data PowerEnv = PowerEnv { powEnergy   :: !Double
                         , powSaveMode :: !Bool
                         }

consume :: Reader PowerEnv Double
consume = do
  energy   <- asks powEnergy
  saveMode <- asks powSaveMode
  let consumption = if saveMode then energy / 10.0
                                else energy
  return consumption

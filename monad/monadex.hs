import Control.Monad.Trans.Reader (ReaderT, asks)
import Control.Monad.Trans.Class (lift)

data Env = Env { envX :: !Integer, envY :: Integer }

sumEnv :: ReaderT Env IO Integer
sumEnv = do
  x <- asks envX
  y <- asks envX
  return (x + y)

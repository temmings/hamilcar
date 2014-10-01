module Move where
    import Control.Applicative
--    import Control.Arrow
--    import Control.Monad
    import Data.Array
--    import qualified Data.ByteString as BS
--    import Data.Char
--    import Data.Function
--    import Data.List
--    import Data.Maybe
--    import Data.Ord
--    import Data.Tuple
--    import Data.Int
--    import Data.Word
--    import System.Environment
--    import System.IO
--    import System.IO.Unsafe
    import Util
    import Piece

    -- MOVE
    data Mv=Drop{dropTo::Pos,dropPc::Pc}|Mv{fr::Pos,to::Pos,mvPc::Pc,cap::Pc,isPro::Bool} deriving(Eq,Ord)
    instance Show Mv where
      show (Drop to pc)= (dropToUSI pc)++(notation to)
      show (Mv fr to pc _ isPro)=notation to++show pc++"("++notation fr++")"++if'(isPro,"+","")
    isCapture=(/=Empty).cap
    mvColor (Drop{dropPc=x})=co x
    mvColor (Mv{mvPc=x})=co x
    dropToUSI=(++"*").show.p8
    mvToUSI (Drop to pc)=dropToUSI pc++posToUSI to
    mvToUSI (Mv fr to _ _ isPro)=posToUSI fr++posToUSI to++if'(isPro,"+","")
    onBdPoss=toPos<$>range((1,1),(9,9)) ::[Pos]
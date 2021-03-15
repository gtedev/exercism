module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North
             | East
             | South
             | West
            --  deriving (Eq, Show, Enum)
             deriving (Eq, Show, Enum)

data Robot = Robot
    { dir:: Bearing
    , coord:: (Integer, Integer) }

getNextDirOrDefault:: Bearing -> Char -> Bearing
getNextDirOrDefault North 'L' =  West
getNextDirOrDefault North 'R' =  East
getNextDirOrDefault East  'L' =  North
getNextDirOrDefault East  'R' =  South
getNextDirOrDefault South 'L' =  East
getNextDirOrDefault South 'R' =  West
getNextDirOrDefault West  'L' =  South
getNextDirOrDefault West  'R' =  North
getNextDirOrDefault dir _  =  dir
-- getNextDirOrDefault dir 'L'  =  pred dir
-- getNextDirOrDefault dir 'R'  =  succ dir
-- getNextDirOrDefault dir _  =  dir

getNextCoordOrDefault:: Bearing -> (Integer, Integer) -> Char -> (Integer, Integer)
getNextCoordOrDefault West  (x,y) 'A' = (x - 1, y    )
getNextCoordOrDefault East  (x,y) 'A' = (x + 1, y    )
getNextCoordOrDefault South (x,y) 'A' = (x    , y - 1)
getNextCoordOrDefault North (x,y) 'A' = (x    , y + 1)
getNextCoordOrDefault _      coord _  = coord

bearing :: Robot -> Bearing
bearing (Robot dir _) = dir

coordinates :: Robot -> (Integer, Integer)
coordinates (Robot _ coord) = coord

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot direction coordinates =
    Robot { dir = direction, coord = coordinates }

nextMove :: Robot -> Char -> Robot
nextMove (Robot dir coord) x =
    let nextDir   = getNextDirOrDefault dir x in
    let nextCoord = getNextCoordOrDefault nextDir coord x in
    Robot { dir = nextDir, coord = nextCoord }

move :: Robot -> String -> Robot
move = foldl nextMove
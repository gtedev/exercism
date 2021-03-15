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

getNextDir:: Bearing -> Char -> Bearing
getNextDir North 'L' =  West
getNextDir North 'R' =  East
getNextDir East  'L' =  North
getNextDir East  'R' =  South
getNextDir South 'L' =  East
getNextDir South 'R' =  West
getNextDir West  'L' =  South
getNextDir West  'R' =  North
getNextDir dir _  =  dir
-- getNextDir dir 'L'  =  pred dir
-- getNextDir dir 'R'  =  succ dir
-- getNextDir dir _  =  dir

getNextCoord:: Bearing -> (Integer, Integer) -> Char -> (Integer, Integer)
getNextCoord West  (x,y) 'A' = (x - 1, y)
getNextCoord East  (x,y) 'A' = (x + 1, y)
getNextCoord South (x,y) 'A' = (x    , y - 1)
getNextCoord North (x,y) 'A' = (x    , y + 1)
getNextCoord _      coord _  = coord

bearing :: Robot -> Bearing
bearing (Robot dir _) = dir

coordinates :: Robot -> (Integer, Integer)
coordinates (Robot _ coord) = coord

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot direction coordinates = 
    Robot { dir = direction, coord = coordinates }

nextMove :: Robot -> Char -> Robot
nextMove (Robot dir coord) x =
    let nextDirOrDefault   = getNextDir dir x in
    let nextCoordOrDefault = getNextCoord nextDirOrDefault coord x in
    Robot { dir = nextDirOrDefault, coord = nextCoordOrDefault }

move :: Robot -> String -> Robot
move robot [] = robot 
move robot (x:xs) = move (nextMove robot x) xs
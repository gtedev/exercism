module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury 
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

getOrbitalConstant:: Planet -> Float
getOrbitalConstant Mercury  = 0.2408467
getOrbitalConstant Venus  = 0.61519726
getOrbitalConstant Earth  = 1.0
getOrbitalConstant Mars  = 1.8808158
getOrbitalConstant Jupiter  = 11.862615
getOrbitalConstant Saturn  = 29.447498
getOrbitalConstant Uranus  = 84.016846 
getOrbitalConstant Neptune  = 164.79132 

orbitalAgeBySecond:: Float -> Float -> Float
orbitalAgeBySecond orbital seconds = ((1/31557600) / orbital) * seconds

ageOn :: Planet -> Float -> Float
ageOn = orbitalAgeBySecond . getOrbitalConstant
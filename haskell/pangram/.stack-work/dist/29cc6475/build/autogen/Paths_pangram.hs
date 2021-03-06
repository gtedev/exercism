{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_pangram (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [2,0,0,12] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\FamilleTE\\Exercism\\haskell\\pangram\\.stack-work\\install\\c4a2eefe\\bin"
libdir     = "C:\\Users\\FamilleTE\\Exercism\\haskell\\pangram\\.stack-work\\install\\c4a2eefe\\lib\\x86_64-windows-ghc-8.8.4\\pangram-2.0.0.12-GlTNNojEMaDdykAAsQi0O"
dynlibdir  = "C:\\Users\\FamilleTE\\Exercism\\haskell\\pangram\\.stack-work\\install\\c4a2eefe\\lib\\x86_64-windows-ghc-8.8.4"
datadir    = "C:\\Users\\FamilleTE\\Exercism\\haskell\\pangram\\.stack-work\\install\\c4a2eefe\\share\\x86_64-windows-ghc-8.8.4\\pangram-2.0.0.12"
libexecdir = "C:\\Users\\FamilleTE\\Exercism\\haskell\\pangram\\.stack-work\\install\\c4a2eefe\\libexec\\x86_64-windows-ghc-8.8.4\\pangram-2.0.0.12"
sysconfdir = "C:\\Users\\FamilleTE\\Exercism\\haskell\\pangram\\.stack-work\\install\\c4a2eefe\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "pangram_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "pangram_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "pangram_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "pangram_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pangram_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "pangram_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)

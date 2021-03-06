{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_rna_transcription (
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
version = Version [1,3,0,10] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\FamilleTE\\Exercism\\haskell\\rna-transcription\\.stack-work\\install\\c4a2eefe\\bin"
libdir     = "C:\\Users\\FamilleTE\\Exercism\\haskell\\rna-transcription\\.stack-work\\install\\c4a2eefe\\lib\\x86_64-windows-ghc-8.8.4\\rna-transcription-1.3.0.10-GDH3VcpAJ64sckI8X7eDG"
dynlibdir  = "C:\\Users\\FamilleTE\\Exercism\\haskell\\rna-transcription\\.stack-work\\install\\c4a2eefe\\lib\\x86_64-windows-ghc-8.8.4"
datadir    = "C:\\Users\\FamilleTE\\Exercism\\haskell\\rna-transcription\\.stack-work\\install\\c4a2eefe\\share\\x86_64-windows-ghc-8.8.4\\rna-transcription-1.3.0.10"
libexecdir = "C:\\Users\\FamilleTE\\Exercism\\haskell\\rna-transcription\\.stack-work\\install\\c4a2eefe\\libexec\\x86_64-windows-ghc-8.8.4\\rna-transcription-1.3.0.10"
sysconfdir = "C:\\Users\\FamilleTE\\Exercism\\haskell\\rna-transcription\\.stack-work\\install\\c4a2eefe\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "rna_transcription_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "rna_transcription_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "rna_transcription_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "rna_transcription_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "rna_transcription_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "rna_transcription_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)

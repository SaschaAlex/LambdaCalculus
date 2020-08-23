{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_untypeLambda (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\AlexAntoineCaron\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\AlexAntoineCaron\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.10.2\\untypeLambda-0.1.0.0-inplace"
dynlibdir  = "C:\\Users\\AlexAntoineCaron\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.10.2"
datadir    = "C:\\Users\\AlexAntoineCaron\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.10.2\\untypeLambda-0.1.0.0"
libexecdir = "C:\\Users\\AlexAntoineCaron\\AppData\\Roaming\\cabal\\untypeLambda-0.1.0.0-inplace\\x86_64-windows-ghc-8.10.2\\untypeLambda-0.1.0.0"
sysconfdir = "C:\\Users\\AlexAntoineCaron\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "untypeLambda_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "untypeLambda_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "untypeLambda_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "untypeLambda_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "untypeLambda_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "untypeLambda_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)

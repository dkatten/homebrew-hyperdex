require 'formula'

class Hyperleveldb < Formula
  homepage 'http://hyperdex.org'
  url 'http://hyperdex.org/src/hyperleveldb-1.0.1.tar.gz'
  sha1 '12ba2b093a4a67f04edaaeaf3f1db7943d0a3147'

  depends_on 'gcc48' => :build
  depends_on 'snappy'

  def install
    cxxstdlib_check :skip

    ENV['CC']="#{HOMEBREW_PREFIX}/bin/gcc-4.8"
    ENV['CXX']="#{HOMEBREW_PREFIX}/bin/g++-4.8"
    ENV['LD']="#{HOMEBREW_PREFIX}/bin/gcc-4.8"

    system "./configure", "--prefix=#{prefix}", "--disable-debug", "CXXFLAGS=-DOS_MACOSX"
    system 'make'
    system 'make', 'install'
  end
end

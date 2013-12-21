require 'formula'

class Replicant < Formula
  homepage 'http://hyperdex.org'
  url 'http://hyperdex.org/src/replicant-0.3.1.tar.gz'
  sha1 'ba8022e40568ebcc6e56e80b7d7119694c18ad01'

  depends_on 'gcc48'
  depends_on 'hyperleveldb'
  depends_on 'sparsehash'
  depends_on 'popt'
  depends_on 'glog'
  depends_on 'busybee'

  def install
    cxxstdlib_check :skip

    ENV['CC']="#{HOMEBREW_PREFIX}/bin/gcc-4.8"
    ENV['CXX']="#{HOMEBREW_PREFIX}/bin/g++-4.8"
    ENV['LD']="#{HOMEBREW_PREFIX}/bin/gcc-4.8"

    system "./configure", "--prefix=#{prefix}", "CXXFLAGS=-DOS_MACOSX",
      "PO6_LIBS=-L#{HOMEBREW_PREFIX}/lib", "PO6_CFLAGS=-I#{HOMEBREW_PREFIX}/include",
      "E_LIBS=\"-L#{HOMEBREW_PREFIX}/lib -le\"", "E_CFLAGS=-I#{HOMEBREW_PREFIX}/include",
      "BUSYBEE_LIBS=\"-L#{HOMEBREW_PREFIX}/lib -lbusybee\"", "BUSYBEE_CFLAGS=-I#{HOMEBREW_PREFIX}/include",
      "HYPERLEVELDB_LIBS=\"-L#{HOMEBREW_PREFIX}/lib -lhyperleveldb\"", "HYPERLEVELDB_CFLAGS=-I#{HOMEBREW_PREFIX}/include"
    system "make install"
  end
end

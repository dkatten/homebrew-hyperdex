require 'formula'

class Busybee < Formula
  homepage 'http://hyperdex.org'
  url 'http://hyperdex.org/src/busybee-0.4.0.tar.gz'
  sha1 '5574a2cdfc196395604633fed584d99b892b53ea'

  depends_on 'gcc48'
  depends_on 'libe'

  def install
    cxxstdlib_check :skip

    ENV['CC']="#{HOMEBREW_PREFIX}/bin/gcc-4.8"
    ENV['CXX']="#{HOMEBREW_PREFIX}/bin/g++-4.8"
    ENV['LD']="#{HOMEBREW_PREFIX}/bin/gcc-4.8"

    system "./configure", "--prefix=#{prefix}", "PO6_LIBS=-L#{HOMEBREW_PREFIX}/lib",
      "PO6_CFLAGS=-I#{HOMEBREW_PREFIX}/include", "E_LIBS=\"-L#{HOMEBREW_PREFIX}/lib -le\"",
      "E_CFLAGS=-I#{HOMEBREW_PREFIX}/include"
    system "make install"
  end
end

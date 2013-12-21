require 'formula'

class Libe < Formula
  homepage 'http://hyperdex.org'
  url 'http://hyperdex.org/src/libe-0.4.1.tar.gz'
  sha1 'e30607fbc4f028c1c9952c677eea72e83b31da96'

  depends_on 'gcc48' => :build
  depends_on 'libpo6'

  def install
    cxxstdlib_check :skip

    ENV['CC']="#{HOMEBREW_PREFIX}/bin/gcc-4.8"
    ENV['CXX']="#{HOMEBREW_PREFIX}/bin/g++-4.8"
    ENV['LD']="#{HOMEBREW_PREFIX}/bin/gcc-4.8"
    
    system "./configure", "--prefix=#{prefix}", "PO6_LIBS=-L#{HOMEBREW_PREFIX}/lib",
      "PO6_CFLAGS=-I#{HOMEBREW_PREFIX}/include"
    system "make install"
  end
end

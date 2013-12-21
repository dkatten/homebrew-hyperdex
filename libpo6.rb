require 'formula'

class Libpo6 < Formula
  homepage 'http://hyperdex.org'
  url 'http://hyperdex.org/src/libpo6-0.4.1.tar.gz'
  sha1 '5e4014a37dd2d37458f3fe2596641f182a7636ca'

  depends_on 'gcc48' => :build

  def install
    cxxstdlib_check :skip

    ENV['CC']="#{HOMEBREW_PREFIX}/bin/gcc-4.8"
    ENV['CXX']="#{HOMEBREW_PREFIX}/bin/g++-4.8"
    ENV['LD']="#{HOMEBREW_PREFIX}/bin/gcc-4.8"
    
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end

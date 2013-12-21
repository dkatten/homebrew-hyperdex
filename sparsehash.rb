require 'formula'

class Sparsehash < Formula
  homepage 'https://code.google.com/p/sparsehash/'
  url 'https://sparsehash.googlecode.com/files/sparsehash-2.0.2.tar.gz'
  sha1 '12c7552400b3e20464b3362286653fc17366643e'

  depends_on 'gcc48'
  depends_on 'glog'
  depends_on 'popt'

  def install
    cxxstdlib_check :skip

    ENV['CC']="#{HOMEBREW_PREFIX}/bin/gcc-4.8"
    ENV['CXX']="#{HOMEBREW_PREFIX}/bin/g++-4.8"
    ENV['LD']="#{HOMEBREW_PREFIX}/bin/gcc-4.8"

    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end
end

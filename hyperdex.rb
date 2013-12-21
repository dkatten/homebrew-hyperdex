require 'formula'

class Hyperdex < Formula
  homepage 'http://hyperdex.org'
  url 'http://hyperdex.org/src/hyperdex-1.0.1.tar.gz'
  sha1 'c8233c0de6b7b41d79f7c3d9a2633a5f754ec989'

  depends_on 'gcc48' => :build
  depends_on 'replicant'
  depends_on 'sparsehash'
  depends_on 'python'
  depends_on 'ruby'

  def patches
    DATA
  end

  def install
    cxxstdlib_check :skip

    ENV['CC']="#{HOMEBREW_PREFIX}/bin/gcc-4.8"
    ENV['CXX']="#{HOMEBREW_PREFIX}/bin/g++-4.8"
    ENV['LD']="#{HOMEBREW_PREFIX}/bin/gcc-4.8"

    system "mkdir osx"
    system "curl -o osx/ieee754.h https://raw.github.com/rescrv/HyperDex/master/osx/ieee754.h"
    system "./configure", "--prefix=#{prefix}", "--enable-java-bindings", "CXXFLAGS=-DOS_MACOSX",
      "PO6_LIBS=-L#{HOMEBREW_PREFIX}/lib", "PO6_CFLAGS=-I#{HOMEBREW_PREFIX}/include",
      "E_LIBS=\"-L#{HOMEBREW_PREFIX}/lib -le\"", "E_CFLAGS=-I#{HOMEBREW_PREFIX}/include",
      "BUSYBEE_LIBS=\"-L#{HOMEBREW_PREFIX}/lib -lbusybee\"", "BUSYBEE_CFLAGS=-I#{HOMEBREW_PREFIX}/include",
      "HYPERLEVELDB_LIBS=\"-L#{HOMEBREW_PREFIX}/lib -lhyperleveldb\"", "HYPERLEVELDB_CFLAGS=-I#{HOMEBREW_PREFIX}/include",
      "REPLICANT_LIBS=\"-L#{HOMEBREW_PREFIX}/lib -lreplicant\"", "REPLICANT_CFLAGS=-I#{HOMEBREW_PREFIX}/include"
    system "make install"
  end
end
__END__
diff --git a/Makefile.am b/Makefile.am
index 79860d0..500971c 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -127,6 +127,7 @@ noinst_HEADERS += common/funcall.h
 noinst_HEADERS += common/hash.h
 noinst_HEADERS += common/hyperspace.h
 noinst_HEADERS += common/ordered_encoding.h
+noinst_HEADERS += common/osx/ieee754.h
 noinst_HEADERS += common/ids.h
 noinst_HEADERS += common/macros.h
 noinst_HEADERS += common/mapper.h

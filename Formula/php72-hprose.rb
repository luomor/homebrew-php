require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Hprose < AbstractPhp72Extension
  init
  desc "High Performance Remote Object Service Engine"
  homepage "https://pecl.php.net/package/hprose"
  url "https://pecl.php.net/get/hprose-1.6.5.tgz"
  sha256 "a453053719dad6352d54543d708d8d09b62de28df7b29fd47b4b5a9fcf8025a7"
  head "https://github.com/hprose/hprose-pecl.git"

  bottle do
    cellar :any_skip_relocation
    rebuild 1
    sha256 "9785a3fd76bd53732b1f4665220bf654fa89a3b5def37dde318915b50ddef1fd" => :high_sierra
    sha256 "998b3ab6af088ec00a29eea3d4385fc7fe82299a451c952739a26de0e842564f" => :sierra
    sha256 "0df72dca943756c1cba47f5065e64b5ab601dd2f53699625165cdd60e3332641" => :el_capitan
  end

  def install
    Dir.chdir "hprose-#{version}" unless build.head?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/hprose.so"
    write_config_file if build.with? "config-file"
  end
end

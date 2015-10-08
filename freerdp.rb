class Freerdp < Formula
  homepage "http://www.freerdp.com/"

  stable do
    url "https://github.com/FreeRDP/FreeRDP/archive/1.1.0-beta1.tar.gz"
    sha256 "c7c7dd6efdc8bbb8e6c545216391badf92776ea7d724c79aaed8f78dbc3ab94e"
  end

  bottle do
    sha1 "361ae059c21eaccfa551b7f4924b2762a6d8d6b1" => :mavericks
    sha1 "8a82974856fa6346e7ff43b7abb6b12dc5e06634" => :mountain_lion
    sha1 "49bc6add9fec028879985d288252287ed00c8434" => :lion
  end

  head do
    url "https://github.com/FreeRDP/FreeRDP.git"
    depends_on :xcode => :build # for "ibtool"
  end

  depends_on :x11
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build

  def install
    cmake_args = std_cmake_args
    cmake_args << "-DWITH_X11=ON" if build.head?
    system "cmake", ".", *cmake_args
    system "make", "install"
  end
end

class Deployah < Formula
  desc "Deploy apps via Helm without Kubernetes or Helm expertise"
  homepage "https://deployah.dev"
  license "Apache-2.0"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.8/deployah-darwin-arm64.tar.gz"
      sha256 "a12469b932286201ca04f9817f33499406bf70cde2ed62d5786e223c4e25c8a4"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.8/deployah-darwin-amd64.tar.gz"
      sha256 "988968e30ec6274c48e972c1d31a249662aeebe9651df37948d5d4340fc090f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.8/deployah-linux-arm64.tar.gz"
      sha256 "f40f78e9f0049b71f43d354d99398681047d06abdb7c2188f8103081172f0110"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.8/deployah-linux-amd64.tar.gz"
      sha256 "6eb16e71542da0ac193c3a7983916ffbc2cf3818598785988683143cd3a200db"
    end
  end

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
  end

  def install
    bin.install "deployah"
    generate_completions_from_executable(bin/"deployah", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deployah --version")
  end
end

class Deployah < Formula
  desc "Deploy apps via Helm without Kubernetes or Helm expertise"
  homepage "https://deployah.dev"
  license "Apache-2.0"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.5.0/deployah-darwin-arm64.tar.gz"
      sha256 "eccd9efafc07ca695a8049783d7c93ec7a76e53b20661e29861401a87f4c5ddd"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.5.0/deployah-darwin-amd64.tar.gz"
      sha256 "1017d2f77564a5a611c9b07d736ea22f0e2260fa9e47678d2d93ec5b81cbce05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.5.0/deployah-linux-arm64.tar.gz"
      sha256 "daeee4fca35ed782a053f98cdc7235c3b625b164ded4c56b540f13f4f3f378a4"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.5.0/deployah-linux-amd64.tar.gz"
      sha256 "697d45928f8c686721229a5cca37206f0cb09bd3e678362687ddd9e5dfda6f6c"
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

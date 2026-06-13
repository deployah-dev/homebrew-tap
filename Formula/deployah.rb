class Deployah < Formula
  desc "Deploy apps via Helm without Kubernetes or Helm expertise"
  homepage "https://deployah.dev"
  license "Apache-2.0"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.9/deployah-darwin-arm64.tar.gz"
      sha256 "a43c678762dcaa068c5b6b858829682046fc50de9c888991b6174ae10668fde6"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.9/deployah-darwin-amd64.tar.gz"
      sha256 "be9fd4d7993c7ffa62c7c9af5a7f115ef74897454e896c7db313593e96488250"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.9/deployah-linux-arm64.tar.gz"
      sha256 "3a4f51ee83d3f61d6a8a1f2878eedbd89514aadff3cff873751ae23032a58639"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.9/deployah-linux-amd64.tar.gz"
      sha256 "e9576aeb73001e5032d3e37129d932c5dae3a8e65beed32b47da19d57e287e14"
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

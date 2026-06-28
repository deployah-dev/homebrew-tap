class Deployah < Formula
  desc "Deploy apps via Helm without Kubernetes or Helm expertise"
  homepage "https://deployah.dev"
  license "Apache-2.0"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.3.0/deployah-darwin-arm64.tar.gz"
      sha256 "b1c274de89e3c02ddfeaec088ab17f6b8ff051b5ba1e19312062567b5dac1eb6"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.3.0/deployah-darwin-amd64.tar.gz"
      sha256 "443819c08661b434ac9a58177ffd4a1590a72d7064b4b2952607bd4ad557cf25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.3.0/deployah-linux-arm64.tar.gz"
      sha256 "7bbe2eade175f5a022b2ec97380601a51aff99c3e7e01537a0ab491d4356cb42"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.3.0/deployah-linux-amd64.tar.gz"
      sha256 "6ae438b9782e0beba5cafbe0114fbbed4c2ca25d6f3d681c4c3ad746f600ef75"
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

class Deployah < Formula
  desc "Deploy apps via Helm without Kubernetes or Helm expertise"
  homepage "https://deployah.dev"
  license "Apache-2.0"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.4/deployah-darwin-arm64.tar.gz"
      sha256 "92ead60fd7f7dff042082255d6f6fed795fd8fa0c42788fcb469bca638be06b4"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.4/deployah-darwin-amd64.tar.gz"
      sha256 "16a9055d825eb3af8139fcb631c3a0e7fdde52ddfe9b49977f16232731292b51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.4/deployah-linux-arm64.tar.gz"
      sha256 "9708726b8f08bca8766139fe8df4ef1775150889f0f68ff75d9b667a9f61f912"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.4/deployah-linux-amd64.tar.gz"
      sha256 "3d9d09bf91b8ba195e184d367ca1cfc0f6942dff088199c25763c029bfe9e9e6"
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

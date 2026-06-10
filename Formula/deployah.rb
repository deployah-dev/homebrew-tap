class Deployah < Formula
  desc "Deploy apps via Helm without Kubernetes or Helm expertise"
  homepage "https://deployah.dev"
  license "Apache-2.0"
  version "0.1.7"

  on_macos do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.7/deployah-darwin-arm64.tar.gz"
      sha256 "b03fe2a6d4eef43797d36dc1dba34cff2ef2b4a673a7a5f9237cb1c1abaf83fb"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.7/deployah-darwin-amd64.tar.gz"
      sha256 "60cc881acce79dfd20563ffc5de84be6387abaac3e2c4613ed604a098975c207"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.7/deployah-linux-arm64.tar.gz"
      sha256 "3a7dca5df28bbdd6968bf7d7897b4a40cc98d14ed8a375064c0e2cc01155777a"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.7/deployah-linux-amd64.tar.gz"
      sha256 "b146f88d4478727bd132a60680969ea03398a0dbb5b18dbeee47d6b813e54c79"
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

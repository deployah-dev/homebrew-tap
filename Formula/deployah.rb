class Deployah < Formula
  desc "Deploy apps via Helm without Kubernetes or Helm expertise"
  homepage "https://deployah.dev"
  license "Apache-2.0"
  version "0.9.0"

  on_macos do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.9.0/deployah-darwin-arm64.tar.gz"
      sha256 "7cffe0ed31f64bef3a41934fe1fc49874f73e77d230a51a5de2ab699a2785c51"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.9.0/deployah-darwin-amd64.tar.gz"
      sha256 "9332e1e4a40e735b9c637b9229a57ae5f9228ff59f5a959fd31a4e5db5aad306"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.9.0/deployah-linux-arm64.tar.gz"
      sha256 "b406567488c474da2aed661cdca386a7e4d74a0d82121190500472840ca48c4a"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.9.0/deployah-linux-amd64.tar.gz"
      sha256 "c3e164c45d2d20b7b2d588568f17feea62039ef714502a24e88fbfbd94927a80"
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

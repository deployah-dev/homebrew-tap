class Deployah < Formula
  desc "Deploy apps via Helm without Kubernetes or Helm expertise"
  homepage "https://deployah.dev"
  license "Apache-2.0"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.2.0/deployah-darwin-arm64.tar.gz"
      sha256 "a2b24559f64c4495f5576d180724ae40d17228f32d43e58b58a2cffabeea375e"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.2.0/deployah-darwin-amd64.tar.gz"
      sha256 "82564efdccb509853b8976cfd3f67f7d5a8e1e627e2858dcfc4efb970d1c696f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.2.0/deployah-linux-arm64.tar.gz"
      sha256 "517f921a7d98cb6f0e69a4f84121f60627cf73abd38d7916d09dd5d2e1a0039b"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.2.0/deployah-linux-amd64.tar.gz"
      sha256 "afda85a7c092620b92fa0e0139a88c2ffc972c6bf9afae79849b0e9adfb4898c"
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

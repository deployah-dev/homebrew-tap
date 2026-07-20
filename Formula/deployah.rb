class Deployah < Formula
  desc "Deploy apps via Helm without Kubernetes or Helm expertise"
  homepage "https://deployah.dev"
  license "Apache-2.0"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.4.0/deployah-darwin-arm64.tar.gz"
      sha256 "58a7aa8320bf6528d9644e0ab047015b31852c11eba3c22a31c69685c8c1dd59"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.4.0/deployah-darwin-amd64.tar.gz"
      sha256 "85be2cd1e185c3235e4c854205ed1e8b7e730319589f0aefc44163d787e3c7a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.4.0/deployah-linux-arm64.tar.gz"
      sha256 "99688e51b18b8425d857b1c052237cf7a9a0b4ebb22ccaaa6ba68cf168644a29"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.4.0/deployah-linux-amd64.tar.gz"
      sha256 "1e8cecab5aa464e65b51e9ba8f691af24ab22f2ff065948dcb30f761222beb84"
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

class Deployah < Formula
  desc "Deploy apps via Helm without Kubernetes or Helm expertise"
  homepage "https://deployah.dev"
  license "Apache-2.0"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.6.0/deployah-darwin-arm64.tar.gz"
      sha256 "b6f0ada9998cefa3844a9f298ebb4b50cc92a6b31694762b1d0fb5f23767b912"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.6.0/deployah-darwin-amd64.tar.gz"
      sha256 "79e5cbaeba967027ebb5603bc70d2c8ef62d8d56bd8b22efefd6a635ebc09681"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.6.0/deployah-linux-arm64.tar.gz"
      sha256 "b45d03072636321723846ce095ae264188e636afce076f1aab32f4db4a331028"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.6.0/deployah-linux-amd64.tar.gz"
      sha256 "823ebd9628f3317fe3a3172a08ba11d539462cfc44bb7c31f520b629f9830a11"
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

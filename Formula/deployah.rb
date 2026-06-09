class Deployah < Formula
  desc "Deploy apps via Helm without Kubernetes or Helm expertise"
  homepage "https://deployah.dev"
  license "Apache-2.0"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.5/deployah-darwin-arm64.tar.gz"
      sha256 "9fb9c452add072b4782152ef07d1d8b219969b5ca8b561fd1e2bb64e8af7a770"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.5/deployah-darwin-amd64.tar.gz"
      sha256 "0f2319094b8d2f29fa30e83f597f2ae4652d8f84db12c39ec192d1eebc4d5f0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.5/deployah-linux-arm64.tar.gz"
      sha256 "89c18843a0705fefccab7d0af9d559ceea79a0bf7ab36578a49e5d39c3e87e61"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.5/deployah-linux-amd64.tar.gz"
      sha256 "b49b6e0509cbfd7b5ba422219dc37c8bab9cdbc3ec0be26da93a69b05e8d363b"
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

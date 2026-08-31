class Deployah < Formula
  desc "Deploy apps via Helm without Kubernetes or Helm expertise"
  homepage "https://deployah.dev"
  license "Apache-2.0"
  version "0.8.0"

  on_macos do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.8.0/deployah-darwin-arm64.tar.gz"
      sha256 "6d01ff7f3d5bbb83378974005c89a39a31a807751211e5a676d884fc73d93a4a"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.8.0/deployah-darwin-amd64.tar.gz"
      sha256 "eb1742a5595e48202e30dd81a66be872f53a23d5244da505cfb05b840d4797fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.8.0/deployah-linux-arm64.tar.gz"
      sha256 "91be12eedcf53a57659fc1f69c1737d9c50088fa42e8075f25141cb272fd0402"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.8.0/deployah-linux-amd64.tar.gz"
      sha256 "2ed90348322e9e3b2694644919c383f1ae1dc28a0a8eb705ed819001620ca71d"
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

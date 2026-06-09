class Deployah < Formula
  desc "Deploy apps via Helm without Kubernetes or Helm expertise"
  homepage "https://deployah.dev"
  license "Apache-2.0"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.6/deployah-darwin-arm64.tar.gz"
      sha256 "5e01bbbd924477dec865fe98c60ff621aa87815924754fb91dd7693acd07b190"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.6/deployah-darwin-amd64.tar.gz"
      sha256 "d711b99945a452160c32969ac7126e4f694ae66a7d4b70d79e2ed1f38676b633"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.6/deployah-linux-arm64.tar.gz"
      sha256 "501cda5d545e0739f47fdc154e08d080667e011f8c3dc4ea8d128499669a9e94"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.1.6/deployah-linux-amd64.tar.gz"
      sha256 "ee7797f25f1b2850b3f38bded80bcc00594f71b2071eb3f2abf6d1b824719aa3"
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

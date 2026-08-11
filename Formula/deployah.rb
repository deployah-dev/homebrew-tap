class Deployah < Formula
  desc "Deploy apps via Helm without Kubernetes or Helm expertise"
  homepage "https://deployah.dev"
  license "Apache-2.0"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.7.0/deployah-darwin-arm64.tar.gz"
      sha256 "69508d589e4216337d95b93b7aeb2f0ebdc225f1e8fcf479688512445e26c70e"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.7.0/deployah-darwin-amd64.tar.gz"
      sha256 "9abc495db3ffd6c00ace08a8bd922df46d6ef90321db2d4848db7cb30549c3e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.7.0/deployah-linux-arm64.tar.gz"
      sha256 "92e5bb018f9169ba1fd086e68fd6bbe6ba6c429507e2d4420b02c948994b40f3"
    end
    on_intel do
      url "https://github.com/deployah-dev/deployah/releases/download/v0.7.0/deployah-linux-amd64.tar.gz"
      sha256 "4a6a03d6d344743f6eb5b238784f8499c23f991dc40dcfd61d2e4e95db07511c"
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

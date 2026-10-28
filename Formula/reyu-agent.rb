class ReyuAgent < Formula
  desc "Spec-driven coding agent CLI"
  homepage "https://reyu.dev"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/SRSWTI/reyu-agent/releases/download/v0.6.3/reyu-agent-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "ffa7a538de99141e95c3e2e05165c7c94e50aad1a91eae40e6aad971313c34f1"
    end
    on_intel do
      url "https://github.com/SRSWTI/reyu-agent/releases/download/v0.6.3/reyu-agent-v0.6.3-x86_64-apple-darwin.tar.gz"
      sha256 "88e4fbc7a923b8188d62b7225af283c45321cb7a74dad07accc82a9352b46c74"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/SRSWTI/reyu-agent/releases/download/v0.6.3/reyu-agent-v0.6.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "229a77bdd2e3ed0b979464f678c769b3bd08e29a42eb149656613ea835ac2c8d"
    else
      url "https://github.com/SRSWTI/reyu-agent/releases/download/v0.6.3/reyu-agent-v0.6.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "818821216ffe4c2591fbf95e9afaeeb1ce865ccc094f462d0a344b67778bc903"
    end
  end

  def install
    bin.install "reyu-agent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/reyu-agent --version")
  end
end

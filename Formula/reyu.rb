# reyu — alias formula, same binary as reyu-agent but the name users type
class Reyu < Formula
  desc "Spec-driven coding agent CLI — you write what the code should do, reyu proves it"
  homepage "https://reyu.dev"
  license :cannot_represent
  version "0.6.3"

  on_macos do
    on_arm do
      url "https://github.com/SRSWTI/reyu-agent/releases/download/v0.6.3/reyu-agent-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "ffa7a538de99141e95c3e2e0516577c94e50aad1a91eae40e6aad971313c34f1"
    end
    on_intel do
      url "https://github.com/SRSWTI/reyu-agent/releases/download/v0.6.3/reyu-agent-v0.6.3-x86_64-apple-darwin.tar.gz"
      sha256 "88e4fbc7a923b8188d62b7225af283c45321cb7a74dad07accc82a9352b46c74"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/SRSWTI/reyu-agent/releases/download/v0.6.3/reyu-agent-v0.6.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "229a77bdd2e3ed0b979464f678c763b3bd08e29a42eb149656613ea835ac6d4d"
    else
      url "https://github.com/SRSWTI/reyu-agent/releases/download/v0.6.3/reyu-agent-v0.6.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "placeholder-aarch64-linux"
    end
  end

  def install
    bin.install "reyu"
    # the rails bundle ships beside the binary
    %w[reyu-checker reyu-checker-go reyu-checker.VERSION reyu-parser.pyz reyu-cli.pyz].each do |f|
      bin.install f if File.exist?(f)
    end
  end

  def caveats
    <<~EOS
      Run `reyu tour` for a 2-minute guided first proof.
      Then `reyu init && reyu map .` in your repo.
    EOS
  end

  test do
    assert_match "reyu", shell_output("#{bin}/reyu --version", 2)
  end
end

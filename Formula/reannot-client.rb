require "formula"

class ReannotClient < Formula
  desc "CLI for MLP eval-dap reannotation"
  homepage "https://bitbucket.org/microblink/mlp-eval-dap-reannotation"
  on_linux do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/reannot-client/v0.0.1/reannot-client-linux-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/reannot-client/v0.0.1/reannot-client-linux-amd64.gz"
    end
  end

  on_macos do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/reannot-client/v0.0.1/reannot-client-darwin-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/reannot-client/v0.0.1/reannot-client-darwin-amd64.gz"
    end
  end

  def install
    if OS.linux?
        if Hardware::CPU.arm?
            system "mv reannot-client-linux-arm64 reannot-client"
        else
            system "mv reannot-client-linux-amd64 reannot-client"
        end
    end
    if OS.mac?
        if Hardware::CPU.arm?
            system "mv reannot-client-darwin-arm64 reannot-client"
        else
            system "mv reannot-client-darwin-amd64 reannot-client"
        end
    end
    bin.install "reannot-client"
  end

  # Homebrew requires tests.
  test do
    assert_match "0.0.1", shell_output("#{bin}/reannot-client -v", 2)
  end

end
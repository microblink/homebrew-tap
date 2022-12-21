require "formula"

class Bundle < Formula
  desc "CLI to work with model bundles"
  homepage "https://bitbucket.org/microblink/bundle"
  on_linux do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/bundle/v0.6.11/bundle-linux-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/bundle/v0.6.11/bundle-linux-amd64.gz"
    end
  end

  on_macos do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/bundle/v0.6.11/bundle-darwin-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/bundle/v0.6.11/bundle-darwin-amd64.gz"
    end
  end

  def install
    if OS.linux?
        if Hardware::CPU.arm?
            system "mv bundle-linux-arm64 bundle"
        else
            system "mv bundle-linux-amd64 bundle"
        end
    end
    if OS.mac?
        if Hardware::CPU.arm?
            system "mv bundle-darwin-arm64 bundle"
        else
            system "mv bundle-darwin-amd64 bundle"
        end
    end
    bin.install "bundle"
  end

  # Homebrew requires tests.
  test do
    assert_match "0.6.11", shell_output("#{bin}/bundle -v", 2)
  end

end
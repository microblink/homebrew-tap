require "formula"

class Bundle < Formula
  desc "CLI to work with model bundles"
  homepage "https://bitbucket.org/microblink/bundle"
  on_linux do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/bundle/v0.4.0/bundle-linux-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/bundle/v0.4.0/bundle-linux-amd64.gz"
    end
  end

  on_macos do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/bundle/v0.4.0/bundle-darwin-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/bundle/v0.4.0/bundle-darwin-amd64.gz"
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
    assert_match "0.4.0", shell_output("#{bin}/bundle -v", 2)
  end

end
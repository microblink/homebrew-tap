require "formula"

class Kirax < Formula
  desc "kirax CLI"
  homepage "https://bitbucket.org/microblink/kirax-controller"
  on_linux do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/kirax/v0.52.1/kirax-linux-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/kirax/v0.52.1/kirax-linux-amd64.gz"
    end
  end

  on_macos do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/kirax/v0.52.1/kirax-darwin-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/kirax/v0.52.1/kirax-darwin-amd64.gz"
    end
  end

  def install
    if OS.linux?
        if Hardware::CPU.arm?
            system "mv kirax-linux-arm64 kirax"
        else
            system "mv kirax-linux-amd64 kirax"
        end
    end
    if OS.mac?
        if Hardware::CPU.arm?
            system "mv kirax-darwin-arm64 kirax"
        else
            system "mv kirax-darwin-amd64 kirax"
        end
    end
    bin.install "kirax"
  end

  # Homebrew requires tests.
  test do
    assert_match "v0.52.1", shell_output("#{bin}/kirax -v", 2)
  end

end

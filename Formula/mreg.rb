require "formula"

class MReg < Formula
  desc "CLI for model registry"
  homepage "https://bitbucket.org/microblink/model-registry"
  on_linux do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/mreg/v0.14.46/mreg-linux-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/mreg/v0.14.46/mreg-linux-amd64.gz"
    end
  end

  on_macos do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/mreg/v0.14.46/mreg-darwin-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/mreg/v0.14.46/mreg-darwin-amd64.gz"
    end
  end

  def install
    if OS.linux?
        if Hardware::CPU.arm?
            system "mv mreg-linux-arm64 mreg"
        else
            system "mv mreg-linux-amd64 mreg"
        end
    end
    if OS.mac?
        if Hardware::CPU.arm?
            system "mv mreg-darwin-arm64 mreg"
        else
            system "mv mreg-darwin-amd64 mreg"
        end
    end
    bin.install "mreg"
  end

  # Homebrew requires tests.
  test do
    assert_match "0.14.46", shell_output("#{bin}/mreg -v", 2)
  end

end
require "formula"

class KiraxAuth < Formula
  desc "CLI for getting kirax tokens"
  homepage "https://bitbucket.org/microblink/mlp-go-auth"
  on_linux do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/kirax-auth/v0.1.0/kirax-auth-linux-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/kirax-auth/v0.1.0/kirax-auth-linux-amd64.gz"
    end
  end

  on_macos do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/kirax-auth/v0.1.0/kirax-auth-darwin-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/kirax-auth/v0.1.0/kirax-auth-darwin-amd64.gz"
    end
  end

  def install
    if OS.linux?
        if Hardware::CPU.arm?
            system "mv kirax-auth-linux-arm64 kirax-auth"
        else
            system "mv kirax-auth-linux-amd64 kirax-auth"
        end
    end
    if OS.mac?
        if Hardware::CPU.arm?
            system "mv kirax-auth-darwin-arm64 kirax-auth"
        else
            system "mv kirax-auth-darwin-amd64 kirax-auth"
        end
    end
    bin.install "kirax-auth"
  end

  # Homebrew requires tests.
  test do
    assert_match "0.1.0", shell_output("#{bin}/kirax-auth -v", 2)
  end

end
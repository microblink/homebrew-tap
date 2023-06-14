require "formula"

class Mproxy < Formula
  desc "model proxy binary distribution"
  homepage "https://bitbucket.org/microblink/mlp-model-proxy"
  on_linux do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/mlp-model-proxy/v0.15.0-rc3/proxy-linux-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/mlp-model-proxy/v0.15.0-rc3/proxy-linux-amd64.gz"
    end
  end

  on_macos do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/mlp-model-proxy/v0.15.0-rc3/proxy-darwin-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/mlp-model-proxy/v0.15.0-rc3/proxy-darwin-amd64.gz"
    end
  end

  def install
    if OS.linux?
        if Hardware::CPU.arm?
            system "mv proxy-linux-arm64 mproxy"
        else
            system "mv proxy-linux-amd64 mproxy"
        end
    end
    if OS.mac?
        if Hardware::CPU.arm?
            system "mv proxy-darwin-arm64 mproxy"
        else
            system "mv proxy-darwin-amd64 mproxy"
        end
    end
    bin.install "mproxy"
  end

  # Homebrew requires tests.
  test do
    assert_match "v0.15.0-rc3", shell_output("#{bin}/mproxy -v", 2)
  end

end

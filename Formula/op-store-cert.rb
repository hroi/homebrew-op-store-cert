class OpStoreCert < Formula
  desc "Store certificate as PEM files in 1Password"
  version "0.1.1"
  on_macos do
    on_arm do
      url "https://github.com/hroi/op-store-cert/releases/download/v0.1.1/op-store-cert-aarch64-apple-darwin.tar.xz"
      sha256 "bd1ff08ace49486b3c01506666ed4493a472c227a93a43fec7fa6153cecb2865"
    end
    on_intel do
      url "https://github.com/hroi/op-store-cert/releases/download/v0.1.1/op-store-cert-x86_64-apple-darwin.tar.xz"
      sha256 "bd6846cd7123083994a237a00061c76013476d4f7612c7006925aec3cb915bc9"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/hroi/op-store-cert/releases/download/v0.1.1/op-store-cert-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4e12808f3f1e4e3c45081e1f37379cfba9fb726f47bb00af867aa630de9da44e"
    end
  end

  def install
    on_macos do
      on_arm do
        bin.install "op-store-cert"
      end
    end
    on_macos do
      on_intel do
        bin.install "op-store-cert"
      end
    end
    on_linux do
      on_intel do
        bin.install "op-store-cert"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end

# The Homebrew formula for hobo, generated from packaging/hobo.rb.in in hobo-vm/hobo, where
# scripts/package.sh fills in the url and sha256 and `make release` commits the result to
# hobo-vm/homebrew-tap as Formula/hobo.rb. Edit the template, not the tap's copy.
class Hobo < Formula
  desc "Named macOS, Linux and Windows VMs on Apple Silicon, built from recipes"
  homepage "https://hobo.gsquared.app/"
  url "https://github.com/hobo-vm/hobo/releases/download/v0.1.0/hobo-0.1.0.tar.gz"
  sha256 "b03594d5841d05479bc1ab28fa7e3bbd6076a8a78370569c1661a2c023633125"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    prefix.install "bin", "share"
    # Creating a VM needs the virtualization entitlement, which an ad-hoc signature can carry.
    system "codesign", "--force", "--sign", "-", "--entitlements", "entitlements.plist",
           "--options", "runtime", bin/"hobo"
  end

  def caveats
    <<~EOS
      Linux guests need qemu-img to convert Ubuntu's cloud images:
        brew install qemu
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/hobo --version").strip
    entitlements = shell_output("codesign -d --entitlements - --xml #{bin}/hobo 2>&1")
    assert_match "com.apple.security.virtualization", entitlements
  end
end

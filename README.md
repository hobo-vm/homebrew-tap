# hobo-vm/homebrew-tap

The Homebrew tap for [hobo](https://github.com/hobo-vm/hobo), a CLI for named macOS, Linux and
Windows VMs on Apple Silicon Macs.

```sh
brew install hobo-vm/tap/hobo
```

hobo needs an Apple Silicon Mac running macOS 27 or later. Its documentation is at
[hobo.gsquared.app](https://hobo.gsquared.app).

## The formula

`Formula/hobo.rb` is generated from `packaging/hobo.rb.in` in
[hobo-vm/hobo](https://github.com/hobo-vm/hobo) and committed here by each release, so changes to
it belong there: a change made here is overwritten by the next release. Report problems in
[hobo's issues](https://github.com/hobo-vm/hobo/issues).

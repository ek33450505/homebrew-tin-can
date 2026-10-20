class TinCan < Formula
  desc "Hand an AI coding session off to a fresh terminal tab"
  homepage "https://github.com/ek33450505/tin-can"
  url "https://github.com/ek33450505/tin-can/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "cdeb3def3bc250b7952eb0e363df2c00ecec8e40b928097c7c47eace3e0d6e1d"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    # bin/tin-can reads its version from ../VERSION relative to the resolved
    # script path, so VERSION must sit at prefix/VERSION next to prefix/bin.
    bin.install "bin/tin-can"
    prefix.install "VERSION"
    prefix.install "LICENSE"
    pkgshare.install "skills", "docs"
    doc.install "README.md", "CHANGELOG.md"
  end

  def caveats
    <<~EOS
      Run tin-can from the repository the handoff is for:
        tin-can --latest             # newest handoff, preferring names with this repo's name
        tin-can --list               # show which handoffs --latest would consider
        tin-can --dry-run <file>     # preview without launching anything

      Inside Claude Code, run it as a shell escape:
        ! tin-can <file>

      Optional Claude Code skill (use this or the plugin below, not both):
        [ -e ~/.claude/skills/tin-can ] || { mkdir -p ~/.claude/skills && ln -s "#{opt_pkgshare}/skills/tin-can" ~/.claude/skills/tin-can; }
      Remove that link before `brew uninstall tin-can`: rm ~/.claude/skills/tin-can

      Or install the Claude Code plugin instead, which bundles the skill and hooks:
        /plugin marketplace add ek33450505/tin-can#v#{version}
        /plugin install tin-can@tin-can

      For other agents, see #{opt_pkgshare}/docs/agents-snippet.md

      Docs: https://github.com/ek33450505/tin-can
    EOS
  end

  test do
    assert_match "tin-can #{version}", shell_output("#{bin}/tin-can --version")

    (testpath/"h.md").write "# h\n\n## KICKOFF\nx\n"
    assert_match(/Read the handoff file at .*h\.md and follow its KICKOFF section/,
                 shell_output("#{bin}/tin-can --dry-run --term print --cwd #{testpath} #{testpath}/h.md"))
  end
end

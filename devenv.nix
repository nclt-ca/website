{ pkgs, ... }:

{
  packages = with pkgs; [
    hugo
    nodejs_22
    go
  ];

  languages.javascript = {
    enable = true;
    package = pkgs.nodejs_22;
  };

  languages.go = {
    enable = true;
  };

  scripts.dev.exec = ''
    hugo server --buildDrafts --buildFuture
  '';

  scripts.build.exec = ''
    hugo --minify
  '';

  scripts.format.exec = ''
    npm run format
  '';

  enterShell = ''
    echo "🏗️  Nelson Community Land Trust - Development Environment"
    echo ""
    echo "Available commands:"
    echo "  dev     - Start Hugo development server"
    echo "  build   - Build the site for production"
    echo "  format  - Format code with Prettier"
    echo ""
    hugo version
    echo "Node $(node --version)"
    echo "Go $(go version | cut -d' ' -f3)"
  '';
}

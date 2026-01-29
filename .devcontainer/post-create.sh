#!/bin/bash
# Post-create script for Master Thesis Development Container

set -e

echo "=== Master Thesis Development Environment Setup ==="

# Initialize and update git submodules
echo "Initializing git submodules..."
git submodule update --init --recursive

# Configure git for better submodule handling
echo "Configuring git for submodules..."
git config --local submodule.recurse true
git config --local diff.submodule log
git config --local status.submodulesummary 1
git config --local push.recurseSubmodules check

# Set up safe directory for git (needed in containers)
git config --global --add safe.directory /workspaces/*

# Create Zotero data directory if needed
mkdir -p "$HOME/.zotero/zotero"

# Display helpful information
echo ""
echo "=== Setup Complete ==="
echo ""
echo "LaTeX Environment:"
echo "  - Full TeX Live distribution installed"
echo "  - latexmk, latexindent, and chktex available"
echo "  - Use LaTeX Workshop extension for building"
echo ""
echo "Git Submodules:"
echo "  - Submodules have been initialized"
echo "  - Git is configured to recurse into submodules automatically"
echo ""
echo "Zotero Integration:"
echo "  - Zotero is installed at /opt/zotero/zotero"
echo "  - To use Better BibTeX citation picker:"
echo "    1. Start Zotero on your local machine"
echo "    2. Install Better BibTeX extension in Zotero"
echo "    3. Enable 'Citation picker' in Better BibTeX preferences"
echo "    4. Update workspace settings with your Zotero server URL"
echo ""
echo "  NOTE: For web-based development (GitHub Codespaces),"
echo "        you may need to run Zotero with Better BibTeX on a"
echo "        publicly accessible server or use port forwarding."
echo ""
echo "Tips:"
echo "  - Build your thesis: Open .tex file and press Ctrl+Alt+B"
echo "  - View PDF: Click the 'View LaTeX PDF' button or Ctrl+Alt+V"
echo "  - Sync references: Configure Zotero URL in workspace settings"
echo ""

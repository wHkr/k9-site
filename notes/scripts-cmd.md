# Personal scripts and commands for general purpose

## After rebuild of container, check versions

The installed versions should all match these values.

```bash
python3 --version && \
pip3 --version && \
git --version && \
gh --version | head -n 1 && \
mkdocs --version && \
pip show mkdocs-material | grep '^Version:'
```

## Save configuration files to GitHub

```bash
git add .devcontainer/Dockerfile .devcontainer/devcontainer.json
git commit -m "Pin development container tool versions"
git push
```

FROM python:3.12.14-slim-bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl gnupg \
    && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | tee /usr/share/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        git=1:2.39.5-0+deb12u2 \
        gh=2.101.0-1 \
        zsh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

RUN cat > /root/.zshrc <<'EOF'
eval "$(starship init zsh)"

alias ls='ls -lah'
alias gco='git commit'
alias mk='mkdocs'
alias cl='clear'
alias zz='. ~/.zshrc'
EOF

RUN pip install --no-cache-dir pip==26.2.1

RUN pip install --no-cache-dir \
    mkdocs==1.6.1 \
    mkdocs-material==9.7.7

WORKDIR /workspace
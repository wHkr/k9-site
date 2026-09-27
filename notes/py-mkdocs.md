# Python

## Correct location

Enter into your `/workspace#` folder. it will be directly after your `cd`.

```bash
cd k9-site
/workspace/(You-are-here)
```

## Run the latest python

```bash
python3 --version
pip3 --version
```

### Update pip - Always

```bash
pip install --uupgrade pip
```

### Pip installs the Python modules

```bash
pip install mkdocs-material && mkdocs serve
```

## mkdocs serves the site

The port is 8000 in containers. this allows to be seen by localhost ONLY both inside VSCode & the container

```bash
mkdocs serve
```

Then open `http://localhost:8000` to preview live as you edit.

## Git

> Only if wanting to deploy to Pages, or have a repo

### Set your global variables -- Tell git who you are

```bash
git config --global user.name "wHkr"
git config --global user.email "aaron.capuchino@email.com"

git config --global --list
```

## Install GH modules for the environment

> `Git` command is a little different, follow the steps below this one

```bash
apt-get update && apt-get install -y curl gnupg \
  && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | tee /usr/share/keyrings/githubcli-archive-keyring.gpg > /dev/null \
  && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && apt-get update && apt-get install -y gh

gh auth login
```

### If you dont have Git, Some containers are NOT built with them

1. Temporary fix

```bash
apt update && apt upgrade # If `sudo` command doesn't exist

apt-get update && apt-get install -y git

git --version
```

;
2. Permanent fix (Dockerfile)

```dockerfile
FROM python:3.12-slim-bookworm

RUN apt-get update && apt-get install -y git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir mkdocs-material

WORKDIR /workspace
```

> Pick GitHub.com → HTTPS → Login with a web browser (not password — GitHub CLI uses a device code + browser flow now, not username/password, which is likely why "password is wrong" happened. GitHub disabled plain password auth for git operations years ago).
>
> It'll give you a one-time code and a URL to open — enter the code there, and it links your terminal session to your account without ever typing a password.

### Initialize -- Tell git to watch this

```bash
cd /workspace/(*You)

git init
git add .
git commit -m "Initial k9 site"
```

### Set the repo location -- Tell git this is where I want to be backed up to

Then create a new repo on GitHub (github.com/new — call it something like k9-site), and connect it:

> `https://github.com/wHkr/k9-site`

```bash
git remote add origin https://github.com/wHkr/k9-site.git
git branch -M main
git push -u origin main
```

### Deploy to GitHub Pages

```bash
mkdocs gh-deploy
```

This builds the site and pushes it to a gh-pages branch automatically — GitHub Pages serves straight from that.

### Enable Pages (If not auto-enabled)

Go to the repo on GitHub → Settings → Pages → confirm source is set to gh-pages branch.

Your site will be live at:

```text
https://[your-username].github.io/k9-site/
```

## Later -- Point the GoDaddy domain at it

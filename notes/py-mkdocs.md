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

For **Local hosting**, this is only for you as you make changes. Remote hosting is `mkdocs gh-deploy`. See below.

```bash
mkdocs serve # Hosting the local site
```

Then open `http://localhost:8000` to preview live as you edit.

## Git

> Only if wanting to deploy to Pages, or have a repo

### Set your global variables -- Tell git who you are

```bash
git config --global user.name "wHkr"
# Go onto github FIRST and get the email in your settings/email tab
# If you dont do this, see below:
git config --global user.email "35435153+wHkr@users.noreply.github.com"

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
git push -u origin main # Only initial nees to set the origin, branch:main all -Upstream
```

#### Issue with initial push

1. Wrong email set after the initial commit was made:

```bash
git commit --amend --reset-author --no-edit
git log -1 --format='%h %an <%ae>'
git push -u origin main

# If GitHub rejects still, its an older local commit, go back further
it log --format='%h %an <%ae>' origin/main..main
```

### Deploy to GitHub Pages -- Hosting the remote site

```bash
mkdocs gh-deploy # Remote Hosting
```

This builds the site and pushes it to a gh-pages branch automatically — GitHub Pages serves straight from that.

### Enable Pages (If not auto-enabled)

Go to the REPO on GitHub → Settings (Gear on repo page) → Pages → confirm source is set to gh-pages branch.

Your site will be live at:

```text
https://whkr.github.io/k9-site/
```

### gh/git -- Extra info/insight

`mkdocs gh-deploy` will create another branch. will throw a error. dont `git pull` like it asks to do. You don't want to merge the generated gh-pages branch back into main.

   1. Took your Markdown/configuration from your working branch (main)

   2. Built the HTML site into /workspace/site

   3. Created/updated gh-pages

   4. Pushed gh-pages to GitHub

   5. GitHub Pages serves that gh-pages branch

Normal worklow looks like this:

```markdoown
edit Markdown
     ↓
git add .
     ↓
git commit
     ↓
git push
     ↓
mkdocs gh-deploy
     ↓
gh-pages updated
     ↓
GitHub Pages updates
```

For example:

```powershell
git add .
git commit -m "Update K9 site"
git push
mkdocs gh-deploy
```

## Later -- Point the GoDaddy domain at it

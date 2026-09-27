# Python

## Correct location

Enter into your `/workspace#` folder. it will be directly after your `cd`.

```bash
cd k9-site
/workspace/(You-are-here)
```

## Building the architecture of the website

This has two parts, you only need one.

1. Using the folder & file diagram, construct the structure and create your code in each one.

2. Use a single script to construct both the structure of the workspace folder, and all code within.

   1. Create a folder labeled `setup.sh` at the root directory. (/k9-site/*You*)

```bash
#!/bin/bash
set -e

mkdir -p docs/services docs/assets/images docs/assets/stylesheets

# mkdocs.yml
cat > mkdocs.yml << 'EOF'
site_name: [Business Name] K9 Services

...

EOF

echo "✅ Site structure created."
echo "Next: pip install mkdocs-material && mkdocs serve"
```

;
    3. Run it

```bash
chmod +x setup.sh
./setup.sh
```

> If bash says it cannot find it, powershell changed the !# at the top, run this instead:
>
> ```bash
> bash.sh
> ```

## Run the latest python

```bash
python3 --version
pip3 --version
```

### Update pip - Always

```bash
pip install --upgrade pip
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

## The flow, once the site's ready

:
    1. Push the MkDocs project to a GitHub repo
:
    2. mkdocs gh-deploy — one command, builds and publishes to GitHub Pages automatically
:
    3. In GoDaddy's DNS settings, add a few DNS records pointing to GitHub Pages (I can give you the exact records when we're there)
:
    3. His .com URL then shows the actual site

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

### Remember deployments -- Local and Remote

1. Not Everywhere -- Local dev server: `mkdocs`

    - Only accessible on your machine, through the port VS Code forwarded (localhost:8000)

    - Not reachable from your phone, another computer, or the internet — it's just for you to preview while building

2. Everywhere -- Deploy to hosting service: `mkdocs gh-serve`

   1. Deploy it (the real goal, since this is for your dad's business):
       - mkdocs gh-deploy → publishes to GitHub Pages, gets a real public URL

       - Then point his GoDaddy domain at it (the DNS step we talked about earlier)

       - Once done, it's live for anyone, anytime — no container needed to view it
   2. Temporary sharing during dev (if you just want to show someone the in-progress site before deploying):

       - VS Code's port forwarding has a "Make Public" option — right-click the forwarded port in the Ports tab → Port Visibility → Public

       - Gives a temporary shareable URL, but only works while your container/VS Code session is actively running

## Later -- Point the GoDaddy domain at it

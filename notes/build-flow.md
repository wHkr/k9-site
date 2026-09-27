# The order of building this site

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

;
4. Pip takes over

```bash
python3 --version # Check for latest versions, ensure you're using them
pip3 --version

pip pip install --uupgrade pip

pip install mkdocs-material && mkdocs serve # Get the Python modules

mkdocs serve # // Run server on port 8000; This can ONLY be seen within the container & VSCode localhost, NOT GH Pages
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

# Remote viewing, containerization vs publishing

## Not Everywhere -- Local dev server via `mkdocs`

    - Only accessible on your machine, through the port VS Code forwarded (localhost:8000)

    - Not reachable from your phone, another computer, or the internet — it's just for you to preview while building

## Everywhere -- Deploy to hosting service

1. Deploy it (the real goal, since this is for your dad's business):
    - mkdocs gh-deploy → publishes to GitHub Pages, gets a real public URL

    - Then point his GoDaddy domain at it (the DNS step we talked about earlier)

    - Once done, it's live for anyone, anytime — no container needed to view it
2. Temporary sharing during dev (if you just want to show someone the in-progress site before deploying):

    - VS Code's port forwarding has a "Make Public" option — right-click the forwarded port in the Ports tab → Port Visibility → Public

    - Gives a temporary shareable URL, but only works while your container/VS Code session is actively running


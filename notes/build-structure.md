# Initial Build

## Current project stack

```markdown
Windows
   ↓
WSL
   ↓
VS Code
   ↓
Docker container
   ↓
Linux environment
   ↓
Git
   ↓
Remote repository
   ↓
MkDocs
   ↓
gh-pages
   ↓
GitHub Pages
   ↓
LIVE SITE
```

## 1. Folder Structure

```markdown
k9-site/
├── mkdocs.yml
├── docs/
│   ├── index.md
│   ├── services/
│   │   ├── obedience.md
│   │   ├── detection.md
│   ├── boarding.md
│   ├── gallery.md
│   ├── about.md
│   ├── contact.md
│   └── assets/
│       └── images/
```

## 2. `mkdocs.yml`

```yaml
site_name: [Business Name] K9 Services
site_description: Professional K9 training, detection, and boarding
site_author: [Dad's Name]

theme:
  name: material
  palette:
    - scheme: default
      primary: indigo
      accent: amber
  features:
    - navigation.tabs
    - navigation.top
    - toc.integrate
    - content.code.copy
  icon:
    logo: material/dog-side

nav:
  - Home: index.md
  - Services:
      - Obedience Training: services/obedience.md
      - Detection Training: services/detection.md
  - Boarding: boarding.md
  - Gallery: gallery.md
  - About: about.md
  - Contact: contact.md

markdown_extensions:
  - attr_list
  - md_in_html
  - toc:
      permalink: true

extra:
  social:
    - icon: fontawesome/solid/phone
      link: "tel:[PHONE NUMBER]"
    - icon: fontawesome/solid/envelope
      link: "mailto:[EMAIL]"
```

## 3. `docs/index.md` (Homepage)

```markdown
# Professional K9 Training & Boarding

Trusted, experienced handling for obedience training, detection work,
and comfortable boarding — right in [your area].

## What We Offer

<div class="grid cards" markdown>

-   :material-paw:{ .lg .middle } **Obedience Training**

    ---

    Foundational subordination and behavior training for dogs of any age.

    [:octicons-arrow-right-24: Learn more](services/obedience.md)

-   :material-shield-search:{ .lg .middle } **Detection Training**

    ---

    Professional-grade drug and explosive detection training.

    [:octicons-arrow-right-24: Learn more](services/detection.md)

-   :material-home-heart:{ .lg .middle } **Boarding**

    ---

    Custom outdoor kennels, seasonally decorated, comfortable and secure.

    [:octicons-arrow-right-24: Learn more](boarding.md)

</div>

---

## Why Choose Us

- [X] years of professional handling experience
- Certified in [certifications, if applicable]
- Custom-built kennels with seasonal touches your dog will love
- [Any other differentiators]

[Get in Touch](contact.md){ .md-button .md-button--primary }
```

## 4. `docs/boarding.md` (your standout feature)

```markdonw
# Boarding

Our dogs don't just stay in kennels — they stay somewhere with character.

## Custom Outdoor Kennels

Each kennel is built for comfort, safety, and space to move — and
throughout the year, we decorate them for the season:

- 🎄 **Christmas** — lights and festive touches throughout December
- 🎃 **Halloween** — themed decorations every October
- [Add other seasons/holidays you do]

<!-- Gallery grid placeholder -->
<div class="grid" markdown>
![Kennel photo 1](assets/images/kennel-1.jpg)
![Kennel photo 2](assets/images/kennel-2.jpg)
![Kennel photo 3](assets/images/kennel-3.jpg)
</div>

See more in the [full gallery](gallery.md).

## What's Included

- [Feeding schedule details]
- [Exercise/walk schedule]
- [Any grooming/extra services]

## Rates

| Length of Stay | Price |
|---|---|
| Per night | $[X] |
| Weekly | $[X] |

[Book Boarding](contact.md){ .md-button .md-button--primary }
```

## 6. `docs/contact.md`

```markdown
# Get in Touch

Have a question about training or want to book boarding? Reach out.

**Phone:** [phone number]
**Email:** [email]
**Location:** [general area/city]

## Business Hours

| Day | Hours |
|---|---|
| Mon–Fri | [hours] |
| Sat | [hours] |
| Sun | [hours] |
```

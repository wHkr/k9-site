#!/bin/bash
set -e

mkdir -p docs/services docs/assets/images docs/assets/stylesheets

# mkdocs.yml
cat > mkdocs.yml << 'EOF'
site_name: [Business Name] K9 Services
site_description: Professional K9 training, detection, and boarding
site_author: [Dad's Name]

theme:
  name: material
  palette:
    - scheme: slate
      primary: black
      accent: yellow
      toggle:
        icon: material/weather-sunny
        name: Switch to light mode
    - scheme: default
      primary: blue grey
      accent: yellow
      toggle:
        icon: material/weather-night
        name: Switch to dark mode
  font:
    text: Roboto
    code: Roboto Mono
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

extra_css:
  - assets/stylesheets/extra.css

extra:
  social:
    - icon: fontawesome/solid/phone
      link: "tel:[PHONE NUMBER]"
    - icon: fontawesome/solid/envelope
      link: "mailto:[EMAIL]"
EOF

# extra.css
cat > docs/assets/stylesheets/extra.css << 'EOF'
:root {
  --md-primary-fg-color: #1a1d21;
  --md-accent-fg-color: #f2c744;
}

[data-md-color-scheme="slate"] {
  --md-default-bg-color: #16181b;
  --md-default-fg-color: #e8e8e8;
  --md-primary-fg-color: #1a1d21;
  --md-typeset-a-color: #f2c744;
}

[data-md-color-scheme="default"] {
  --md-primary-fg-color: #37474f;
  --md-typeset-a-color: #b8860b;
}

.md-button--primary {
  background-color: #f2c744;
  border-color: #f2c744;
  color: #16181b;
  font-weight: 600;
}

.md-button--primary:hover {
  background-color: #ffd700;
  border-color: #ffd700;
}

.grid.cards > ul > li {
  border: 1px solid #3a3d42;
  transition: border-color 0.2s ease;
}

.grid.cards > ul > li:hover {
  border-color: #f2c744;
}
EOF

# index.md
cat > docs/index.md << 'EOF'
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
EOF

# boarding.md
cat > docs/boarding.md << 'EOF'
# Boarding

Our dogs don't just stay in kennels — they stay somewhere with character.

## Custom Outdoor Kennels

Each kennel is built for comfort, safety, and space to move — and
throughout the year, we decorate them for the season:

- 🎄 **Christmas** — lights and festive touches throughout December
- 🎃 **Halloween** — themed decorations every October
- [Add other seasons/holidays you do]

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
EOF

# gallery.md
cat > docs/gallery.md << 'EOF'
# Gallery

## Seasonal Kennel Decor

<div class="grid cards" markdown>

![Christmas kennels](assets/images/christmas-1.jpg)
![Halloween kennels](assets/images/halloween-1.jpg)

</div>

## Training in Action

<div class="grid cards" markdown>

![Training photo 1](assets/images/training-1.jpg)
![Training photo 2](assets/images/training-2.jpg)

</div>
EOF

# about.md
cat > docs/about.md << 'EOF'
# About Us

[Write about your dad's background, experience, and story here.]
EOF

# contact.md
cat > docs/contact.md << 'EOF'
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
EOF

# services/obedience.md
cat > docs/services/obedience.md << 'EOF'
# Obedience Training

Every well-behaved dog starts with a strong foundation. Our obedience
training builds discipline, focus, and reliable behavior — whether
you're starting from scratch or fine-tuning an established dog.

## Program Overview

We work with dogs of all ages and backgrounds, tailoring the approach
to your dog's temperament and your household's needs.

### What's Covered

- Basic commands (sit, stay, come, heel, down)
- Leash manners and loose-leash walking
- Impulse control and distraction training
- Off-leash reliability (for qualifying dogs)
- Behavioral correction (jumping, excessive barking, pulling)

## Training Levels

<div class="grid cards" markdown>

-   **Foundation**

    ---

    Core commands and household manners for puppies and new dogs.

    Duration: [X weeks]

-   **Intermediate**

    ---

    Distraction-proofing, public manners, and leash discipline.

    Duration: [X weeks]

-   **Advanced**

    ---

    Off-leash control and complex command sequences.

    Duration: [X weeks]

</div>

## Our Approach

[A paragraph about training philosophy]

## Rates

| Program | Price |
|---|---|
| Foundation | $[X] |
| Intermediate | $[X] |
| Advanced | $[X] |
| Private sessions | $[X]/session |

[Schedule a Consultation](../contact.md){ .md-button .md-button--primary }
EOF

# services/detection.md
cat > docs/services/detection.md << 'EOF'
# Detection Training

Professional-grade detection training for drug and explosive
identification — trusted work for a serious job.

!!! note
    Detection training is offered for [qualified handlers/agencies/
    private clients — clarify who this service is actually for].

## Areas of Expertise

<div class="grid cards" markdown>

-   :material-alert-decagram:{ .lg .middle } **Narcotics Detection**

    ---

    Training dogs to reliably identify a range of controlled substances.

-   :material-bomb:{ .lg .middle } **Explosives Detection**

    ---

    Bomb and explosive detection training to professional standards.

</div>

## Why Professional Detection Training Matters

[A paragraph on your dad's experience/certifications/background.]

### Training Includes

- Scent discrimination and target odor recognition
- Search pattern training (vehicle, building, open area)
- Alert behavior training
- Handler team training
- Ongoing proficiency maintenance

## Certifications & Experience

- [Any certifications held]
- [Years of experience]
- [Notable work/background]

## Who This Is For

- [Law enforcement / private security / personal clients]
- [Any prerequisites]

## Inquire

Detection training is customized per client and dog. Reach out to
discuss your specific needs.

[Contact Us](../contact.md){ .md-button .md-button--primary }
EOF

echo "✅ Site structure created."
echo "Next: pip install mkdocs-material && mkdocs serve"

Skip to content
Search or jump to…
Pull requests
Issues
Marketplace
Explore
 
@wsbb741 
comwrg
/
FUCK-GFW
Public
Code
Pull requests
1
Actions
Security
Insights
FUCK-GFW/.github/workflows/toc.yml
@HaodongZou
HaodongZou Add custom params to toc-generator
Latest commit e92b822 2 days ago
 History
 1 contributor
11 lines (11 sloc)  237 Bytes
   
on: push
name: TOC Generator
jobs:
  generateTOC:
    name: TOC Generator
    runs-on: ubuntu-latest
    steps:
      - uses: technote-space/toc-generator@v4
        with: 
          TOC_TITLE: "**目录**"
          MAX_HEADER_LEVEL: 2
© 2022 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
Loading complete

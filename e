Skip to content
Search or jump to…
Pull requests
Issues
Marketplace
Explore
 
@wsbb741 
lichess-org
/
lila
Public
Code
Issues
562
Pull requests
15
Discussions
Actions
Projects
8
Wiki
Security
Insights
lila/.github/workflows/assets.yml
@niklasf
niklasf bump actions/upload-artifacts again
Latest commit f74c142 on 4 Mar
 History
 3 contributors
@niklasf@ornicar@brollin
50 lines (48 sloc)  1.32 KB
   
name: Build assets

on:
  push:
    paths:
      - '.github/workflows/assets.yml'
      - 'public/**'
      - 'ui/**'
      - 'package.json'
      - 'yarn.lock'
  pull_request:
    paths:
      - '.github/workflows/assets.yml'
      - 'public/**'
      - 'ui/**'
      - 'package.json'
      - 'yarn.lock'

jobs:
  assets:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          submodules: recursive
      - run: git submodule absorbgitdirs
      - uses: actions/setup-node@v3
        with:
          node-version: '16'
          cache: yarn
      - uses: actions/checkout@v3
        with:
          repository: lichess-org/ab
          ssh-key: ${{ secrets.id_rsa_ab }}
          ref: master
          path: ab
        continue-on-error: true
        id: ab
      - run: yarn link --cwd "$GITHUB_WORKSPACE/ab" && yarn link ab --cwd ui/round
        if: steps.ab.outcome == 'success'
      - run: ./ui/build prod
      - run: cd ui && yarn run test && cd -
      - run: mkdir assets && mv public assets/ && cp LICENSE COPYING.md README.md assets/ && git log -n 1 --pretty=oneline > assets/commit.txt
      - run: cd assets && tar -cvpJf ../assets.tar.xz . && cd -
        env:
          XZ_OPT: '-0'
      - uses: actions/upload-artifact@v3
        with:
          name: lila-assets
          path: assets.tar.xz
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

# Apple Health Export to Metabase
Metabase dashboard for Apple Health data.

## Prerequisites
- make
- xsltproc
- zsh
- docker
- docker-compose
- sqlite3

On MacOS, use `brew install libxslt sqlite docker docker-compose` and `xcode-select --install` to install all prerequisites.

## Usage
- Export Apple Health data
  - Go to the Health app  on your iPhone.
  - Tap your picture or initials at the top right.
  - If you don’t see your picture or initials, tap Summary or Browse at the bottom of the screen, then scroll to the top of the screen.
  - Tap Export All Health Data, then choose a method for sharing your data.
- Copy the *export.xml* file to the root of this project
- Run `make`

# consup gitbook
# node.js v6
#

FROM tenderpro/nodejs

MAINTAINER Alexey Kovrizhkin <lekovr+tpro@gmail.com>

ENV DOCKERFILE_VERSION  171017

# -------------------------------------------------------------------------------
# Gitbook & libs

RUN apt-get update && apt-get install -y \
    xvfb imagemagick  libgl1-mesa-glx libxcomposite1 \
 && rm -rf /var/lib/apt/lists/*


# GitBook from https://www.gitbook.com/
RUN npm install gitbook-cli -g

# Calibre from https://calibre-ebook.com/
RUN wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py \
  | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"

RUN gosu op gitbook fetch

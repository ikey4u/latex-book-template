#! /bin/bash

set -e

# The root directory
texhome=$(kpsewhich -var-value TEXMFHOME)
if [ ! -d $texhome ]; then
    mkdir -p $texhome
fi

# Create the basic directory tree
if [ ! -d $texhome"/tex/latex" ]; then
    mkdir -p $texhome"/tex/latex"
fi
if [ ! -d $texhome"/doc" ]; then
    mkdir $texhome"/doc"
fi

# Create font folder
mkdir -p ~/.local/share/fonts

ptex=$texhome"/tex/latex"
pdoc=$texhome"/doc"

# Install pmat package
mkdir -p $ptex"/pmat"
mkdir -p $pdoc"/pmat"
wget http://mirror.lzu.edu.cn/CTAN/macros/generic/pmat/pmat.sty -O $ptex"/pmat/pmat.sty"
wget http://mirrors.ustc.edu.cn/CTAN/macros/generic/pmat/pmat.pdf -O $pdoc"/pmat/pmat.pdf"

# Install typicons
mkdir -p $ptex"/typicons"
mkdir -p $pdoc"/typicons"
wget http://mirrors.ctan.org/fonts/typicons/typicons.sty -O $ptex"/typicons/typicons.sty"
wget http://mirrors.ctan.org/fonts/typicons/typicons.pdf -O $pdoc"/typicons/typicons.pdf"
if [[ ! -f ~/.local/share/fonts/typicons.ttf ]]; then
    wget http://mirrors.ctan.org/fonts/typicons/typicons.ttf -P ~/.local/share/fonts/
fi

sudo texhash

# tex
#http://qiita.com/ynakayama/items/706ae9e59c1b6fd3e3d2
sudo apt-get install texlive-full
sudo apt-get install texlive-lang-cjk
sudo apt-get install xdvik-ja
sudo apt-get install dvipsk-ja
sudo apt-get install gv
sudo apt-get install texlive-fonts-recommended texlive-fonts-extra

# gcc
sudo apt install g++

# python
sudo apt install python-setuptools
sudo apt install python-pip
sudo apt install python2.7-dev
sudo apt install python3-pip
sudo apt install python3-dev
sudo apt install virtualenv
sudo pip install virtualenvwrapper

# tig
git clone https://github.com/jonas/tig.git
cd tig
./autogen.sh 
./configure --without-ncurse
make prefix=/usr/local
sudo make install prefix=/usr/local

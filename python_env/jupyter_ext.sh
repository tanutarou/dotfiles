# extension
pip3 install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
jupyter notebook --generate-config

# vim-extension
mkdir $(jupyter --data-dir)/nbextensions/usability
cd $(jupyter --data-dir)/nbextensions/usability
git clone https://github.com/lambdalisue/jupyter-vim/binding.git vim_binding
chmod -R go-w vim_binding


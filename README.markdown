# Installation

1. Install ctags:
  ```
  sudo apt-get install exuberant-ctags
  ```

2. Install powerline fonts:
  ```
  git clone https://github.com/powerline/fonts
  cd fonts
  ./install.sh
  ```
  Change terminal to use one of the pre-patched fonts.

3. Remove old vim configs:
  ```
  rm -rf ~/.vim && rm ~/.vimrc
  ```

4. Clone vim configs:
  ```
  git clone https://github.com/thiagov/vimfiles.git ~/.vim
  ```

5. Symlink vim config:
  ```
  ln -s ~/.vim/vimrc ~/.vimrc
  ```

6. Copy config.vim sample:
  ```
  cp ~/.vim/config.vim.example ~/.vim/config.vim
  ```

7. Initialize submodules:
For the complete configuration, use:
  ```
  cd ~/.vim
  ./init-basic-submodule.sh javaSupport typescriptSupport commandTSupport
  ```
In this case, it is necessary to do **all steps** listed below.
If you do not wish `CommandT` (fast file navigation), `tsuquyomi` (for typescript support) or `javacomplete2` (java support),
you can simply remove the corresponding parameters from the command above.

8. Compile CommandT (if using it):
  ```
  cd ~/.vim/bundle/command-t/ruby/command-t
  ruby extconf.rb
  make
  ```
  Note: If you are an RVM or rbenv user, you must build CommandT using the same version of Ruby that Vim itself is linked against. You can find out the version that Vim is linked against by issuing following command inside Vim:
  ```
  :ruby puts "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
  ```
  You can either set your version of Ruby to the output of the above command and then build Command-T, or re-build Vim with a version of Ruby you prefer.

9. Install npm and typescript (if using tsuquyomi):
  ```
  npm -g install typescript
  ```
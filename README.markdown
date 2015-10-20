# Installation

1. Install ctags:
  ```
  sudo apt-get install exuberant-ctags
  ```

2. Remove old vim configs:
  ```
  rm -rf ~/.vim && rm ~/.vimrc
  ```

3. Clone vim configs:
  ```
  git clone https://github.com/thiagov/vimfiles.git ~/.vim
  ```

4. Initialize submodules:
  ```
  git submodule update --init
  ```

5. Symlink vim config:
  ```
  ln -s ~/.vim/vimrc ~/.vimrc
  ```

6. Copy config.vim sample:
  ```
  cp ~/.vim/config.vim.example ~/.vim/config.vim
  ```

7. Compile CommandT:
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

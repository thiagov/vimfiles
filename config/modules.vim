" rails.vim
let g:rails_default_file='config/database.yml'

" Scratch 
let g:scratch_file="~/.vim/scratch"

" TagList 
"let Tlist_Ctags_Cmd='/usr/bin/ctags' " point taglist to ctags
let Tlist_GainFocus_On_ToggleOpen = 1 " Focus on the taglist when its toggled
let Tlist_Close_On_Select = 1 " Close when something's selected
let Tlist_Use_Right_Window = 1 " Project uses the left window
let Tlist_File_Fold_Auto_Close = 1 " Close folds for inactive files
let Tlist_Sort_Type = "name"
let Tlist_Show_Menu = 1
set tags+="tags"
set tags+="tmp/tags"

" Sparkup
let g:sparkup = "~/.vim/bundle/sparkup/bin/sparkup"

" snipMate
source ~/.vim/support/support_functions.vim

" syntastic java
let g:syntastic_java_javac_options='-Xlint -encoding Cp1252'
let g:syntastic_java_javac_config_file_enabled=0
"let g:syntastic_java_javac_custom_classpath_command="ruby ~/.vim/support/output_classpath.rb"

" command-t
let g:CommandTSCMDirectories=".metadata"
let g:CommandTWildIgnore=&wildignore . ",*.class,*/target/*"

" NERDTree
let NERDTreeShowBookmarks=1

" Ctags
set tags=./tags;

" Rooter
let g:rooter_manual_only = 1

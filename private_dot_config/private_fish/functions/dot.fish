function dot --wraps=git --description 'Manages dotfiles'
    git --git-dir=$HOME/.dot --work-tree=$HOME $argv
end

#!/usr/bin/zsh

sudo chown -R localdev:localdev ~/.aws ~/.ssh 
sudo chown localdev:localdev ~/.zshrc

if [[ ! -a ~/.local/share/chezmoi ]]; then
  sh -c "cd ~ && $(curl -fsLS https://raw.githubusercontent.com/prolixalias/chezmoi/main/assets/scripts/install.sh)" -- init --apply git@github.com:prolixalias/dotfiles.git
fi

if [[ -x ~/bin/chezmoi ]]; then
  sudo mv ~/bin/chezmoi /usr/local/bin && sudo rm -rf ~/bin
fi

[[ -x /usr/local/bin/chezmoi ]] && /usr/local/bin/chezmoi init

if [[ -a ~/.config/zsh/.zshrc ]]; then
  [[ -a ~/.zshrc ]] && rm -f ~/.zshrc
fi

# if [[ -x "$(command -v homesick)" ]]; then
#   mkdir -p ~/.homesick/repos/
#   cd ~/.homesick/repos
#   git -c http.sslVerify=false clone --recurse-submodules -j2 git@github.com:prolixalias/dotfiles.git
#   cd $(homesick show_path)
#   git submodule foreach git pull origin main
#   homesick rc --force
#   [[ -a ~/.homesick/repos/dotfiles ]] && homesick link --force
# fi

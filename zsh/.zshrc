#  _____ ____  _   _ 
# |__  // ___|| | | |
#   / / \___ \| |_| |
#  / /_  ___) |  _  |
# /____||____/|_| |_|
#
# Configuração ZSH - Galdino

# Caminho do Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Tema (O 'robbyrussell' é o clássico, mas o 'agnoster' é ótimo para ícones)
ZSH_THEME="robbyrussell"

# Plugins Recomendados (Instale via git nas pastas custom do oh-my-zsh)
# zsh-autosuggestions: Sugere comandos baseados no seu histórico
# zsh-syntax-highlighting: Colore os comandos enquanto você digita
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# --- ALIASES PERSONALIZADOS ---
alias zshconf="subl3 ~/meu-dotfiles/zsh/.zshrc"
alias i3conf="subl3 ~/.config/i3/config"
alias ncmpcpp="ncmpcpp"
alias music="ncmpcpp"
alias fetch="neofetch"
alias ls="ls --color=auto"

# Iniciar Neofetch ao abrir o terminal (Opcional)
# neofetch

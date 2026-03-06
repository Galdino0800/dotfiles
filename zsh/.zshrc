# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#powerlevel10k/powerlevel10k#  _____ ____  _   _ 
# |__  // ___|| | | |
#   / / \___ \| |_| |
#  / /_  ___) |  _  |
# /____||____/|_| |_|
#
# Configuração ZSH - Galdino

# Caminho do Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# TEMA: Mude para "powerlevel10k/powerlevel10k" se já tiver instalado o tema
# Caso contrário, mantenha "robbyrussell" por enquanto.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins (Corretos!)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# --- ALIASES PERSONALIZADOS ---
alias zshconf="subl3 ~/.config/.dotfiles/zsh/.zshrc"
alias i3conf="subl3 ~/.config/.dotfiles/i3/config"
alias polyconf="subl3 ~/.config/.dotfiles/polybar/config.ini"
alias dunstconf="subl3 ~/.config/.dotfiles/dunst/dunstrc"

alias ncmpcpp="ncmpcpp"
alias music="ncmpcpp"
alias fetch="pfetch"

# ==========================================================
# CONFIGURAÇÃO PERSONALIZADA DO PFETCH (Estilo Detalhado)
# ==========================================================

# 1. Escolha o que exibir (Descomente ou remova itens da lista):
# title   = username@hostname
# os      = Sistema (Arch Linux)
# host    = Modelo da Máquina/Placa-mãe
# kernel  = Versão do Kernel
# uptime  = Tempo ligado
# pkgs    = Quantidade de pacotes (Pacman)
# memory  = Uso da RAM
# wm      = Gerenciador de Janelas (i3)
# shell   = Seu shell (zsh)
# editor  = Seu editor padrão (nvim/nano)
# palette = A barra de cores estilo Archcraft
export PF_INFO="ascii title os host kernel uptime pkgs memory wm shell palette"

# 2. Configuração de Cores:
export PF_COL1=4     # Cor dos Ícones (4 = Azul/Ciano)
export PF_COL2=7     # Cor do Texto (7 = Branco/Cinza)
export PF_COL3=1     # Cor do username@hostname (1 = Vermelho/Laranja)

# 3. Logo e Detalhes Visuais:
export PF_ASCII="Arch" # Força o logo do Arch Linux
# export PF_SEP=":"    # Se quiser um separador entre ícone e texto, descomente aqui

# 4. Inicialização:
# Faz com que o pfetch apareça toda vez que o terminal for aberto
#if [ -f /usr/bin/pfetch ]; then
#    pfetch
#fi
# ==========================================================

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

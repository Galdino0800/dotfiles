#!/bin/bash

echo "Iniciando limpeza do sistema..."

# Limpa o cache do Pacman (mantém apenas as últimas 3 versões dos pacotes)
echo "--- Limpando cache do Pacman ---"
sudo pacman -Sc --noconfirm

# Limpa o cache do Yay
echo "--- Limpando cache do Yay ---"
yay -Sc --noconfirm

# Limpa logs do Journald com mais de 2 dias
echo "--- Limpando logs antigos ---"
sudo journalctl --vacuum-time=2d

# Limpa o cache de miniaturas (thumbnails) do usuário
echo "--- Limpando cache de thumbnails ---"
rm -rf ~/.cache/thumbnails/*

echo "Limpeza concluída! Esta janela fechará em 5 segundos."
sleep 5
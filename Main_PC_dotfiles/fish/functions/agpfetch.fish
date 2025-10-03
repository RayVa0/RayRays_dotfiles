function agpfetch --wraps='sh ~/Templates/imagefetch_2.0.sh --no-depth --filename --conf ~/.config/imagefetch1.conf' --wraps='sh ~/Templates/imagefetch_2.1.sh --no-depth --filename --conf ~/.config/imagefetch1.conf' --wraps='sh ~/Templates/imagefetch_2.1.sh --no-depth --filename --conf ~/.config/agpfetch.conf' --wraps='imagefetch_2.1.sh --no-depth --filename --conf ~/.config/agpfetch.conf' --description 'alias agpfetch imagefetch_2.1.sh --no-depth --filename --conf ~/.config/agpfetch.conf'
    imagefetch_2.1.sh --no-depth --filename --conf ~/.config/agpfetch.conf $argv
end

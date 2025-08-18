function agpfetch --wraps='sh ~/Templates/imagefetch_2.0.sh --no-depth --filename --conf ~/.config/imagefetch1.conf' --wraps='sh ~/Templates/imagefetch_2.1.sh --no-depth --filename --conf ~/.config/imagefetch1.conf' --description 'alias agpfetch sh ~/Templates/imagefetch_2.1.sh --no-depth --filename --conf ~/.config/imagefetch1.conf'
  sh ~/Templates/imagefetch_2.1.sh --no-depth --filename --conf ~/.config/imagefetch1.conf $argv
        
end

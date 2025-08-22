function mediafetch --wraps='~/Templates/imagefetch_2.1.sh --conf ~/.config/mediafetch.conf -fr' --wraps='c && ~/Templates/imagefetch_2.1.sh --conf ~/.config/mediafetch.conf -fr' --description 'alias mediafetch c && ~/Templates/imagefetch_2.1.sh --conf ~/.config/mediafetch.conf -fr'
  c && ~/Templates/imagefetch_2.1.sh --conf ~/.config/mediafetch.conf -fr $argv
        
end

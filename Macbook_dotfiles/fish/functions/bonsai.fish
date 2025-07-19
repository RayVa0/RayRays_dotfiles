function bonsai --wraps='cbonsai -l --life=48 --infinite --time=0.1 --wait=0.5 -S -M 7' --wraps='cbonsai -l --life=48 --infinite --time=0.1 --wait=0.5 -S -M 20' --wraps='cbonsai -l --life=48 --infinite --time=0.5 --wait=1 -S -M 7' --wraps='cbonsai -l --life=48 --infinite --time=0.5 --wait=1 -M 7' --description 'alias bonsai cbonsai -l --life=48 --infinite --time=0.5 --wait=1 -M 7'
  cbonsai -l --life=48 --infinite --time=0.5 --wait=1 -M 7 $argv
        
end

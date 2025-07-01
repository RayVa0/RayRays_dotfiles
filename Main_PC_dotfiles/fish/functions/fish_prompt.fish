function fish_prompt
       if test $status -eq 0
              echo (set_color white)(prompt_pwd --full-length-dirs 3) (set_color white)'> ' 
       else
               echo (set_color white)(prompt_pwd --full-length-dirs 3) (set_color ff0000)'> '
       end
end

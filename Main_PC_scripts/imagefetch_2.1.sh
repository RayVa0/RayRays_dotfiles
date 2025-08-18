#!/usr/bin/env bash 

#args=("$@")
#echo ${args[@]}

dependency_check() {
    if [ $1 -eq 0 ]; then
        :
    else
        which chafa > /dev/null 2>&1 
        if [ $? -ne 0 ]; then 
            echo Chafa is not installed, please install it through your package manager.
            exit 1
        fi
    fi
}

args_where() {
    #pass the argument you are trying to match and then the external argumets 
    args=("$@")

    for ((i=1; i<=$#; i++)); do
        if [ "${args[i]}" = "${args[0]}" ]; then
            echo "$i"
            exit 
        fi
    done 
    
    echo -1
}

echo_help() {
    echo Welcome to imagefetch_2.0
    echo Use case: Pick a random image from a certain directory specified in a configuration file and print it to the terminal using chafa
    echo ---
    echo Usage: first create a configuration file, per default imagefetch_2.0 looks at '~/.config/imagefetch.conf'
    echo The configuration file should be a list of directories for the script to pull from formated like this:
    echo '```'
    echo /path/to/dir1
    echo /path/to/dir2
    echo '```'
    echo ---
    echo Flags:
    echo -h --help
    echo -e "\tprints this message"
    echo --conf 
    echo -e "\tspecifies a custom configuration file"
    echo -t --terminal 
    echo -e "\tterminal formating so that any image only takes up 50% of your terminal window"
    echo -f --filename
    echo -e "\tprints the filename"
    echo -fr --from
    echo -e "\tprints the parent directory"
    echo -ex --extra
    echo -e "\tlet's you pass any extra arguments you want into chafa"
    echo --no-depth
    echo -e "\tDont traverse into other directories within the specified directory"
}

pic_check() {
    if [ -z "$pic" ]; then 
            echo WARNING: No Images found in input directory.
            echo for more info pass the -h flag

            if [ $(args_where "--no-depth" "$@") -ne -1 ]; then 
                echo --no-depth has been passed this can cause some configs that were stable to fail
            fi

            if [ $(args_where "--conf" "$@") -ne -1 ]; then 
                echo --conf has been passed chech your configuration file!
            fi

            exit 0
    fi
}

dir_check() {
    if [ -n "$1" ]; then
        echo 1
    else 
        echo -1
    fi

}

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo_help
    exit 0
fi

if [ $# -eq 0 ]; then 
    dir=$(cat ~/.config/imagefetch.conf | shuf -n 1 > /dev/null)
    dir="${dir/#\~/$HOME}"

    if [ $(dir_check "$dir") -eq -1 ]; then
        echo No directory found, check your configuration file
        echo do -h for more

        exit 1
    fi

    pic=$(find "$dir" -type f \( -iname "*.jpg" -o -iname "*.jxl" -o -iname "*.avif" -o -iname "*.png" -o -iname "*.tiff" -o -iname "*.bmp" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n 1)
else
    args_conf=$(args_where "--conf" "$@")
    #echo $args_contain_conf
    if [ $args_conf -ne -1 ]; then
        let "args_conf++"
        conf_dir=$(echo "${!args_conf}")
        dir=$(cat "$conf_dir" | shuf -n 1)
        dir="${dir/#\~/$HOME}"
    else
        dir=$(cat ~/.config/imagefetch.conf | shuf -n 1)
        dir="${dir/#\~/$HOME}"
    fi
fi

if [[ $COLORTERM =~ ^(truecolor|24bit)$ ]]; then
	color="full"
	format=""
else
    color=8
    format="--format symbols"
fi



if [ $# -gt 0 ]; then
    :
else
    pic_check
    chafa --optimize 5 --label off --colors $color $format "$pic"
    dependency_check $?
    exit 0
fi
#why exit here? well to avoid a few cpu cycles parsing arguments

if [ $(args_where "--no-depth" "$@") -ne -1 ]; then
    no_depth="-maxdepth 1"
fi

if [ $(dir_check "$dir") -eq -1 ]; then
    echo No directory found, check your configuration file
    echo do -h for more

    exit 1
fi

pic=$(find "$dir" $no_depth -type f \( -iname "*.jpg" -o -iname "*.jxl" -o -iname "*.avif" -o -iname "*.png" -o -iname "*.tiff" -o -iname "*.bmp" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n 1)   

for arg in "$@"; do 
    case "$arg" in 
    --terminal|-t)
        #necessary if the terminal emulator just started due to window animations etc
        sleep 0.1
        view_Y=$(tput 'lines')
        view_X=$(tput 'cols')
        view_Y=$(expr $view_Y / 2)

        view_size="--view-size=${view_X}x${view_Y}"
      
        ;;
    --filename|-f)
        filename="$(basename "$pic")"
        
        ;;
    --from|-fr)
        from_dir="$(basename "$(dirname "$pic")")"
        
        ;;
    --extra)
        args_extra=$(args_where "--extra" "$@")
        let "args_extra++"
        extra_args_chafa=$(echo "${!args_extra}") 

        ;;
    -ex)
        args_extra=$(args_where "-ex" "$@")
        let "args_extra++"
        extra_args_chafa=$(echo "${!args_extra}")

        ;;
    *)
        case "$arg" in 
        --extra|-ex|--conf|--no-depth) 
                
            ;;
         *)
            case "$prev_arg" in
                --extra|-ex|--conf)
                    ;;
                *)
                    echo WARNING: invalid argument \<$arg\>
                    exit 2
                    ;;
            esac
            ;;
        esac
        ;;
    esac
    prev_arg="$arg"
done


pic_check "$@"
chafa --optimize 5 --label off --colors $color $format $view_size $extra_args_chafa "$pic"
dependency_check $?

if [ -n "$filename" ] && [ -z "$from_dir" ]; then 
    echo You are viewing $filename
elif [ -n "$filename" ]; then
    echo -n You are viewing $filename
fi

if [ -n "$from_dir" ]; then 
    echo " from $from_dir"
fi

exit 0


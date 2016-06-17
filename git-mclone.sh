#!/usr/bin/env bash


cloneRepos(){
    for repo in "$@"; do

        folder=${repo##*/}
        folder=${folder%.*}
        folder=${folder//./_}

        # TODO: detect protocol to use

        $(git clone "$repo" "$folder")
    done

}

main(){
    if [ "$#" -lt 1 ]; then
        exit 1
    fi

    while getopts :d:f:hP:p:v-: opt "$@" ;do
        case "${opt}" in
            D )
                # domain
                ;;
            d )
                # destination
                ;;
            f )
                # specify a file to read repos from
                ;;
            h )
                echo help
                exit 0;;
            -P )
                # force protocol
                ;;
            p )
                # set repo prefix
                ;;
            v )
                exit 0;;

            - )
                exit 0;;
            * )
                echo "unknown option";;
        esac
    done
    shift $((OPTIND-1))

    cloneRepos "$@"

}


main "$@"
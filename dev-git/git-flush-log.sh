git filter-branch -f --commit-filter '
        if [ "$GIT_AUTHOR_EMAIL" = "fengzilijie@qq.com" ];
       then
                GIT_AUTHOR_NAME="lj144030";
                GIT_AUTHOR_EMAIL="lj144030@alibaba-inc.com";
                git commit-tree "$@";
        else
                git commit-tree "$@";
        fi' HEAD

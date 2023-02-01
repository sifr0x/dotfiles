#!/usr/bin/env bash
function gpo {
    local git_branch=$(git branch | awk '/^[*]/{print $2}')
    git push origin ${git_branch}
}

function gpof {
    local git_branch=$(git branch | awk '/^[*]/{print $2}')
    git push --force origin ${git_branch}
}

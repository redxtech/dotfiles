#!/usr/bin/env sh

# function to test for dependencies
testdeps () {
    # loop through all the dependencies passed as arguments
    for _DEP in "$@"; do
        # if the command exists, continue to the next dep
        # otherwise display the error and return a failure
        if command -v "$_DEP" >/dev/null 2>&1; then
            continue
        else
            echo "error: dependency $_DEP not available"
            return 1
        fi
    done

    # if everything worked, return success
    return 0
}


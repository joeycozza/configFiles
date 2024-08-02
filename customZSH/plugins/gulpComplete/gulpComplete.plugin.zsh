#!/usr/bin/env zsh

#
# gulp-autocompletion-zsh
#
# Autocompletion for your gulp.js tasks
#
#
# Grabs all available tasks from the `gulpfile.js` in the current directory.
# using a ripgrep command and some sed to clean up the results
#
function gulp_completion {
    compls=$(rg --no-filename -N -o "gulp\.task\(['][^']*" | sed "s/gulp.task('//g")
    completions=(${=compls})
    compadd -- $completions
}

compdef gulp_completion gulp

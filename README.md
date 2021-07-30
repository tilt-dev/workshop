# Tilt Onboarding Workshop
This repo contains resources to build your very own Tilt onboarding workshop:
 * Slide templates to introduce Tilt
 * Customizable, interactive tutorial generator
 * ~~Free ice cream~~

## Using this repo
:warning: If you **fork** this repo, it will be public!

1. Create a new Git repository
2. Duplicate this project to your new Git repository (adapted from [GitHub docs][duplicate-repo]):
    ```sh
    # create a temporary clone
    git clone --bare https://github.com/tilt-dev/workshop /tmp/tilt-workshop
    # navigate to the temporary clone
    cd /tmp/tilt-workshop
    # mirror push to _your_ repository
    git push --mirror YOUR_NEW_GIT_REPO_URL

    # remove the temporary clone
    cd ~
    rm -rf /tmp/tilt-workshop
    ```
3. Clone your new repo and open in your favorite editor!

[duplicate-repo]: https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/duplicating-a-repository

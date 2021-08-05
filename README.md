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

## Tutorial Generator
This repo includes a Python script to assemble your own interactive Tilt tutorial.

You can run `tilt up` on this repo to try it out.
It will automatically be rebuilt whenever you change an input file in `sample-tutorial/`.

Once you're happy with it, copy `workshop.tiltfile` into your project and add the following to your main `Tiltfile`:
```python
load_dynamic('workshop.tiltfile')
```

Then run `WORKSHOP=1 tilt up` on your project and try it out!

### Requirements
#### Development
To generate the all-in-one tutorial, you'll need Python 3.6+.

#### Running
To run the workshop, you'll need Bash: it should work out of the box on macOS/Linux.
Windows users can use WSL2 (Windows Subsystem for Linux) or a VM.

[duplicate-repo]: https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/duplicating-a-repository

# Tilt Onboarding Workshop
This repo contains resources to build your very own Tilt onboarding workshop:
 * Slide templates to introduce Tilt
 * Customizable, interactive tutorial generator
 * ~~Free ice cream~~
 
## Slide Template
You can [preview][slide-deck-preview] or [make a copy][slide-deck-copy]  of our slide template, which helps you walk new users through Tilt install and set up.

## Tutorial Generator
Introduce your team to Tilt via a brief tutorial tailored to your project that runs _within_ Tilt.
It's meta and awesome.

### As the tutorial author...

This repo includes a tool to assemble your own interactive Tilt tutorial.

You can run `tilt up` on this repo to try it out.
It will automatically be rebuilt whenever you change an input file in `sample-tutorial/`.

Once you're happy with it, copy `workshop.tiltfile` into your project and add the following to your main `Tiltfile`:
```python
load_dynamic('workshop.tiltfile')
```

Then run `WORKSHOP=1 tilt up` on your project and try it out!

### As a workshop attendee...
To run the workshop, you'll need Bash: it should work out of the box on macOS/Linux.
Windows users can use WSL2 (Windows Subsystem for Linux) or a VM.

The workshop is inactive by default so that it does not interfere with day-to-day Tilt usage.
Launch Tilt with `WORKSHOP=1 tilt up` to activate.

## Duplicating this Repo
We recommend creating a copy of this repo so that you can version your custom tutorial.

:warning: If you **fork** this repo, it will be public!

To manually duplicate this repo (either to a private GitHub repo or to an internal repo):
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
[slide-deck-preview]: https://docs.google.com/presentation/d/1kJKilOWis_0tlgIDwA7oHVYhxx3Ebqm32glKv10O7zM/edit
[slide-deck-copy]: https://docs.google.com/presentation/d/1kJKilOWis_0tlgIDwA7oHVYhxx3Ebqm32glKv10O7zM/copy

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

You will need Python 3.6+ (included by default on recent macOS versions and most Linux distributions).

To try out the sample tutorial, you can run `tilt up` on this repo.
It will automatically be rebuilt whenever you change an input file in `sample-tutorial/`.

You can also work in your actual project repo, which makes testing out custom logic much easier.
Add the following to your `Tiltfile`:
```python
if os.getenv('WORKSHOP_DEV'):
    git_ext = load_dynamic('ext://git_resource')
    git_ext['git_checkout']('https://github.com/tilt-dev/workshop.git#main')
    local('if [ ! -d ./tilt-tutorial ]; then cp -R ./.git-sources/workshop/sample-tutorial ./tilt-tutorial; fi')
    local_resource('tutorial-generator',
                   cmd='python3 ./.git-sources/workshop/tutorial-generator/gen.py ./tilt-tutorial',
                   deps=['./tilt-tutorial', './.git-sources/workshop'])
    os.putenv('WORKSHOP', '1')
    watch_file('workshop.tiltfile')
    if os.path.exists('workshop.tiltfile'):
       load_dynamic('workshop.tiltfile')
```
Launch Tilt with `WORKSHOP_DEV=1 tilt up` and it will create a `tilt-tutorial` directory with a copy of the sample tutorial input.
Additionally, new `workshop` and `tutorial-generator` resources will appear.
The workshop will automatically be rebuilt whenever you change an input file in `tilt-tutorial/`.

:information_source: Add `.git-sources` (and optionally `tilt-tutorial` for the input files) to your `.gitignore`.

Once you're happy with it, commit `workshop.tiltfile` to your project's repo and add the following to your main `Tiltfile`:
```python
load_dynamic('workshop.tiltfile')
```

Then run `WORKSHOP=1 tilt up` on your project and try it out!

### As a workshop attendee...
To run the workshop, you'll need Bash: it should work out of the box on macOS/Linux.
Windows users can use WSL2 (Windows Subsystem for Linux) or a VM.

The workshop is inactive by default so that it does not interfere with day-to-day Tilt usage.
Attendees should launch Tilt with `WORKSHOP=1 tilt up` to activate.

## Duplicating this Repo
If you choose to create a copy of this repo so that you can version your custom tutorial, please take care in how you copy it.

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

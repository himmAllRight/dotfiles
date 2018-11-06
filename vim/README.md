# .vim
The Vim section of my [dotfiles](https://github.com/himmAllRight.git) repo.

## Pre-Reqs
Unfortunately, I think I currently have a few pre-reqs that need to be
installed via pip or other means. I'll add that here then. Ideally, I want it
setup so if I *have* to have some pre-reqs... I've easily automated it.

## Install

Clone down my dotfiles repo:

```bash
git clone https://github.com/himmAllRight/dotfiles.git
```

If you have `stow` installed, you can use the dotfiles init method [I wrote
about here](http://ryan.himmelwright.net/post/new-dotfiles/):

```bash
cd dotfiles
stow vim
```

That should be it. The first time you launch vim, Plug *should* install all the
needed plug-ins automatically. If not, run `:PlugInstall`. I recommend closing
out and opening up vim again after Plug finishes installing everything.

That should be it!

## Future

(I *may* pull this out into it's own repo at some point...)

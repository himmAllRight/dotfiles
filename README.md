# Dotfiles
This is my new dotfile setup for my computers (Linux). I used to maintain an older version of this
repo, but over time it got very cluttered and un-organized. I also didn't have a great method of
initializing it on a new system. I would just manually make sym links when I needed to, even though
I knew there are *much* better ways to handle dotfiles.

One day, after seeing [this
post](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html), I
finally decided to sit down and clean up my repo, and organize it in a way so that I could use gnu
stow to handle my dotfiles. 

After organizing it, I decided to just start from scratch with a new repo, and this is that repo.

## Using Stow and dotfiles
If you haven't read it, I would highly suggest reading the post I have linked above. However, I
can provide a quick summary of how my dotfiles are setup. Each application as a subdirectory (ex:
`dotfiles/emacs`) which contains all of the dotfiles/folders associated with that application. I
treat each application directory like my `~`, and fill it with my files. For example, my `vim`
directory has my `.vimrc`, as well as my `.vim/colors/` directory. This is so that when I use
stow, it will properly place them as such in `~`.

When I setup my dotfiles on a new system, or install an application that I have dotfiles for,
setting them up is as easy as typing `stow application-dir` (ex: `stow vim`). GNU Stow then links
my dotfiles under my home dirctory. In my vim example, this means symlinks are created for
`~/.vimrc` and `~/.vim/colors/*`, pointing to their respective locations in `~/dotfiles/vim/`.

This setup is great because I can choose to only initialize certain sub-directories, and it is SO
easy to do so.

In the future I might also make different branches of the repo for each of my computers, so I can
have different configurations setup. In theory, I could also just make different folders (ex
`vim-laptop` and `vim-server`), but I like the branch idea better because it's a little easier for
me to merge changes. We'll see. 

Anyway, that's the new setup. I highly reccomend it :)


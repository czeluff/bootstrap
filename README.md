# Chad's Bootstrap Scripts

## Installation:

```
curl -LO chadzeluff.xyz/setup.sh | sh
```

That's it.

## What is this?

After maintaining a bootstrapping configuration for macOS for so long, I wanted to create one for Arch Linux. This project is based on Luke Smith's LARBS work, https://lukesmith.xyz/larbs.sh.

## What changes have you made?

The most notable differences:

- Removal of the `dialog` package
- Allows the user to `sudo` without passwords, ever
- Wrapped every system call into a function
- Tailored specifically to Arch
- Updates to URLs (obviously)

## Customization

By default, it uses the programs [here in progs.csv](progs.csv) and installs
[my dotfiles repo here](https://github.com/czeluff/dotfiles),
but you can easily change this by either modifying the default variables at the
beginning of the script or giving the script one of these options:

- `-r`: custom dotfiles repository (URL)
- `-p`: custom programs list/dependencies (local file or URL)

### The `progs.csv` list

This will parse the given programs list and install all given programs. Note
that the programs file must be a three column `.csv`.

The first column is a "tag" that determines how the program is installed, ""
(blank) for the main repository, `A` for via the AUR or `G` if the program is a
git repository that is meant to be `make && sudo make install`ed.

The second column is the name of the program in the repository, or the link to
the git repository, and the third comment is a description (should be a verb
phrase) that describes the program. During installation, it will print out
this information in a grammatical sentence. It also doubles as documentation
for people who read the csv or who want to install my dotfiles manually.

Depending on your own build, you may want to tactically order the programs in
your programs file. This will install from the top to the bottom.

If you include commas in your program descriptions, be sure to include double quotes around the whole description to ensure correct parsing.

### The script itself

The script is broken up extensively into functions for easier readability and
trouble-shooting. Most everything should be self-explanatory.

The main work is done by the `installationloop` function, which iterates
through the programs file and determines based on the tag of each program,
which commands to run to install it. You can easily add new methods of
installations and tags as well.

Note that programs from the AUR can only be built by a non-root user. What
I do to bypass this by default is to allow the newly created
user to use `sudo` without a password (so the user won't be prompted for a
password multiple times in installation).

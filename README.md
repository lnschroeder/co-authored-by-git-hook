# git-co-author-hook
A git hook for adding [commit co-authors](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors) using wiki link shortcuts. 

## Usage 

```sh 
git commit -m "feat: awesome feature" -m "[[alice]]" -m "[[bob]]"
``` 

will be committed as

```
feat: awesome feature

Co-authored-by: Alice <alice@example.com>
Co-authored-by: Bob <bob@example.com>
```

## Setup the hook
```sh
# clone this repo
git clone ...

cd /path/to/co-authored-by-git-hook

# create a file `co-authors.env`
touch co-authors.env
```
Add the names and commit email addresses of your colleagues to that file: 
```sh
# co-authors.env
alice="Alice <alice@example.com>"
bob="Bob <bob@example.com>"
```

## Add the hook to a repo
You have to register this git hook for every repo separately:
```sh
cd /path/to/some/repo

# create a symlink to the script (or copy paste it, if you prefer)
ln -s </path/to/co-authored-by-git-hook>/replace-co-author-refs.sh .git/hooks/

# register the script as a 'prepare-commit-msg' git hook
echo -e "\n.git/hooks/replace-co-author-refs.sh" >> .git/hooks/prepare-commit-msg
```

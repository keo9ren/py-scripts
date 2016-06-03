#!/usr/bin/env python 

import argparse
import apt
import subprocess

parser = argparse.ArgumentParser(description='Install vim as your personel c/c++ ide')


parser.add_argument(dest='path',metavar='path', nargs='*',help='gtk,gnome or athena') 

#add possibility for custom path here
parser.add_argument('--vimrc',dest='vimrc',action='store_false',help='Keep your existing vimrc') 
parser.add_argument('--noclang',dest='clang',action='store_false',help='Install with or without clang') 
parser.add_argument('--nolatex',dest='latex',action='store_false',help='Install with or without Latex') 
parser.add_argument('--justclone',dest='justclone',action='store_false',help='Adds only the git repos to your .vim dir') 
parser.add_argument('--nocustomvimrc',dest='vimrc',action='store_false',help='Exchange your vimrc with a custom one') 

args = parser.parse_args()

print(args.path)
print(args.clang)
print(args.latex)
print(args.justclone)
print(args.vimrc)
vim_type = ''
for i in args.path:
    if i == 'gtk' or i == 'gnome ' or i == 'athena':
        vim_type = i
if vim_type == '':
    print('No prober vim type selected')
    print('Quiting execution')
    quit() 
packages_to_install = ['git','exuberant-ctags','curl','vim-' + vim_type]
links_to_set = []
git_repos = ['https://github.com/christophermca/meta5.git','https://github.com/vim-scripts/Conque-GDB.git','https://github.com/scrooloose/nerdtree.git','https://github.com/jistr/vim-nerdtree-tabs.git','https://github.com/vim-scripts/c.vim.git','https://github.com/xolox/vim-misc.git','https://github.com/xolox/vim-easytags.git']

if (args.clang == True):
    #how to determine clang version????
    clangversion = '3.7'
    links_to_set += [('/usr/lib/x86_64-linux-gnu/libclang-3.7.so','/usr/lib/libclang.so'),('/usr/bin/clang-'+clangversion,'/usr/bin/clang'),('/usr/bin/clang++-'+clangversion,'/usr/bin/clang++')]
    packages_to_install += ['clang-' + clangversion,'clang-format-' + clangversion, 'cmake']
    git_repos += ['https://github.com/rhysd/vim-clang-format.git','https://github.com/Valloric/YouCompleteMe.git']

if (args.latex == True):
    subprocess.call(['wget', '-c', 'http://sourceforge.net/projects/vim-latex/files/snapshots/vim-latex-1.8.23-20141116.812-gitd0f31c9.tar.gz',])
    subprocess.call(['tar', '-xvjf', 'vim-latex-1.8.23-20141116.812-gitd0f31c9.tar.gz'])


for i in packages_to_install:
    print(i)
    install(i)

for x,j in links_to_set:
    print(x)
    print(j)
    subprocess.call(['ln','-s',x,j])

subprocess.call(['mkdir', '-p', '~/.vim/autoload', '~/.vim/bundle', '&&',
'curl', '-LSso', '~/.vim/autoload/pathogen.vim', 'https://tpo.pe/pathogen.vim'])


for link in git_repos:
    subprocess.call(['git','clone',link],cwd='~/.vim/bundle')
    if link == 'https://github.com/Valloric/YouCompleteMe.git':
        subprocess.call(['git','submodule','update','--init --recursive'],cwd='~/.vim/bundle')
        subprocess.call(['python','./install.py','--clang-completer'],cwd='~/.vim/bundle')

if args.vimrc == True:
    subprocess.call(['cp','-f','./vimrc','/etc/vim/vimrc'])
    #added custom path here


def install(pkg_name):

    cache = apt.cache.Cache()
    cache.update()

    pkg = cache[pkg_name]

    if pkg.is_installed:
        print("{pkg_name} already installed".format(pkg_name=pkg_name))
    else:
        pkg.mark_install()
    
        try:
            cache.commit()
        except Exception, arg:
            print >> sys.stderr, "Sorry, package installation failed [{err}]"


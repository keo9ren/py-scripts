#!/usr/bin/python3 
# install python-apt
# install python 
import getopt
import os
import os.path
import subprocess
import sys

#import apt

#import git


def main(argv):
    print('Updating your install...')
    install_emacs()
    #rtags_master()
    #misc_install()

#---------------------------------------------------------------------------------------------------

def install_emacs():
    src_path = "/home/keo9ren/.tools/scripts-and-more/emacs/"
    dest_path = "/home/keo9ren/.emacs.d/elisp/"
    initfiles = ['anzu','avy','clangformat','company','customvar','evil','flycheck','helm','indentguide',
                 'magit','rtags','sphinx','spotify','yas']
    for file in initfiles:
        file += 'setup.el'
        file_copy(src_path + file, dest_path + file)
    file_copy(src_path + 'mymodehooks.el', dest_path + 'mymodehooks..el')
    file_copy(src_path + 'style.el', dest_path + 'style.el')
    

def file_copy(source,target):
    subprocess.call(['cp',source,target])
    
#---------------------------------------------------------------------------------------------------
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
        except (Exception) as arg:
            print >> sys.stderr, "Sorry, package installation failed [{err}]"


#---------------------------------------------------------------------------------------------------

def add_repo(name):
    subprocess.call(['add-apt-repository','name'])
    subprocess.call(['apt-get','update'])
    subprocess.call(['apt-get','upgrade'])

#---------------------------------------------------------------------------------------------------

def sym_link(source,target):
    subprocess.call(['ln','-sf',source,target])


#---------------------------------------------------------------------------------------------------

def python_install():
    debian_python_packages = ['python3-pip','python3-git','python-pip','python-jedi', 'python3-jedi', 'python-virtualenv'
                              ,'python-sphinx','python3-sphinx','python2.7-de','python3.5-dev','sphinx-doc'];
    pip_python_packages = ['importchecker','isort']

    for package in debian_python_packages:
        install(package)
    
    subprocess.call(['pip','install' ,'--upgrade' ,'pip'])
    for pac in pip_python_packages:
        subprocess.call(['pip','install',pac])
#---------------------------------------------------------------------------------------------------

def llvm_install(version):
    llvm_packages = ['clang-tidy-' + version ,
                     'clang-' + version,
                     'clang-' + version + '-doc',
                     'libclang-common-' + version + '-dev',
                     'libclang-' + version + '-dev',
                     'libclang1-' +version,
                     'libclang1-' + version + '-dbg',
                     'libllvm-' + version + '-ocaml-dev',
                     'libllvm' + version,
                     'libllvm' + version + '-dbg',
                     'lldb-' + version,
                     'llvm-' + version,
                     'llvm-' + version + '-dev',
                     'llvm-' + version + '-doc',
                     'llvm-' + version + '-examples',
                     'llvm-' + version + '-runtime',
                     'clang-format-' + version,
                     'python-clang-' + version,
                     'lldb-' + version + '-dev',
                     'clang-tidy-' + version]
    for pac in llvm_packages:
        install(pac)
    sym_link('/usr/bin/clang-' + version,'/usr/bin/clang')
    sym_link('/usr/bin/clang++-' + version,'/usr/bin/clang++')
    sym_link('/usr/bin/clang-format-' + version,'/usr/bin/clang-format')
    sym_link('/usr/bin/clang-check-' + version,'/usr/bin/clang-check')
    sym_link('/usr/bin/clang-tidy-' + version,'/usr/bin/clang-tidy')
#---------------------------------------------------------------------------------------------------

def gcc6_install():
    gcc6_packages = ['gcc-6' ,'g++-6']
    add_repo('ppa:ubuntu-toolchain-r/test')
    for pac in gcc6_packages:
        install(pac)
    sym_link('/usr/bin/gcc-6','/usr/bin/gcc');
    sym_link('/usr/bin/g++-6','/usr/bin/g++');

#---------------------------------------------------------------------------------------------------
def spotify_install():
    subprocess.call(['echo','deb','http://repository.spotify.com stable non-free','tee','tee /etc/apt/sources.list.d/spotify.list']);
    subprocess.call(['apt-key','adv','--recv-keys','--keyserver','keyserver.ubuntu.com','D2C19886'])
    subprocess.call(['apt-get','update'])
    subprocess.call(['apt-get','upgrade'])
    install(spotify-client)

#---------------------------------------------------------------------------------------------------

def plasma_install():
    add_repo('ppa:kubuntu-ppa/backports')
    subprocess.call(['apt-get','full-upgrade','-y'])
    
#---------------------------------------------------------------------------------------------------
def misc_install():
    misc_packages = [
        'inkscape',
        'silversearcher-ag',
        'htop',
        'calibre',
        'vim',
        'emacs',
        'konqueror',
        'chromium-browser',
        'bear',
        'libboost-all-dev']
    for pac in misc_packages:
        install(pac)
#---------------------------------------------------------------------------------------------------
def rtags_master():
    #rtags_install()
    rtags_git('https://github.com/Andersbakken/rtags.git','/home/keo9ren/Downloads/rtags')


#---------------------------------------------------------------------------------------------------
def rtags_git(git_url, repo_dir):
    print('rtags_git')
    if  os.path.exists(repo_dir)==False:
        print("Cloning repo")
        Repo.clone_from(git_url, repo_dir)
    repo = git.Repo(repo_dir)
    o = repo.remotes.origin
    o.pull()
    print('Updating Submodules')
    for submodule in repo.submodules:
        submodule.update(init=True)
    print('Creating build dir')
    build_dir = repo_dir + '/build'
    if  os.path.exists(build_dir)==False:
        print('Making build dir')
        os.mkdir(build_dir)
    print("Removing old cmake info")
    subprocess.call(['rm',build_dir + '/CMakeCache.txt'])
    subprocess.call(['rm','-r',build_dir + '/CMakeFiles'])
    print('Building build files')
    subprocess.call(['cmake','-DCMAKE_C_COMPILER=clang','-DCMAKE_CXX_COMPILER=clang++','-GNinja','-DCMAKE_EXPORT_COMPILE_COMMANDS=on','..'],cwd=build_dir)
    print('Build... This may take some time')
    subprocess.call(['ninja'],cwd=build_dir)
    print('Installing...')
    subprocess.call(['ninja','install'],cwd=build_dir)
    print('Initit systemd socket')
    print('mkdirs ...')
    #subprocess.call(['cp', emacs_dir + '/rdm.service','/home/keo9ren/.config/systemd/user/rdm.service'])
    #subprocess.call(['cp', emacs_dir + '/rdm.socket','/home/keo9ren/.config/systemd/user/rdm.socket'])
    #subprocess.call(['sudo','systemctl','--user','enable','rdm.socket'])
    #subprocess.call(['sudo','systemctl','--user','start','rdm.socket'])

#---------------------------------------------------------------------------------------------------
def rtags_install():
    print('Installing Packages')
    rtags_packages = ['ninja-build',
                      'cmake',
                      'autoconf',
                      'iwyu',
                      'git',
                      'gitk',
                      'liblua5.3-dev',
                      'lua5.3',
                      'zlib1g-dev',
                      'libssl-dev',
                      'curl']
#---------------------------------------------------------------------------------------------------
def zsh_install():
    install('zsh')
    subprocess.call(['sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'])
    subprocess.call(['git clone https://github.com/powerline/fonts.git ./install.sh'])

#---------------------------------------------------------------------------------------------------

def latex_install():
    install(texlive)

#---------------------------------------------------------------------------------------------------
def old():
    print("old")
    current_user = 'keo9ren'
    home_path = '/home' + '/' + current_user + '/'
    script_path =  home_path + '.tools/scripts-and-more/'

    # bashrc
    subprocess.call(['rm', home_path + '.bashrc'])
    subprocess.call(['ln','-sf', script_path + '.bashrc',home_path + '.bashrc'])

    # init.el
    subprocess.call(['rm','/home/+ current_user + /.emacs'])
    subprocess.call(['rm','/home/+ current_user + /.emacs.d/init.el'])
    subprocess.call(['rm','/home/+ current_user + /.emacs.d/init.el~'])
    emacs_path = home_path + '.emacs.d/'
    subprocess.call(['ln','-sf', script_path + 'emacs/.emacs', emacs_path + 'init.el'])
    #open sockets
    subprocess.call(['cp','/home/oliver/.tools/scripts-and-more/emacs/rdm.service','/home/oliver/.config/systemd/user/rdm.service'])
    subprocess.call(['cp','/home/oliver/.tools/scripts-and-more/emacs/rdm.socket','/home/oliver/.config/systemd/user/rdm.socket'])
    subprocess.call(['sudo','systemctl','--user','enable','rdm.socket'])
    subprocess.call(['sudo','systemctl','--user','start','rdm.socket'])
    #__ packages to install
    #lua5.3
    #trigger install routine
    #sudo pacman -S python-jedi python2-jedi
if __name__ == "__main__":
    main(sys.argv[1:])

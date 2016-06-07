#!/usr/bin/env python 

import apt
import subprocess

current_user = 'oliver'
home_path = '/home' + '/' + current_user + '/'
script_path =  home_path + '.tools/scripts-and-more/'

# bashrc
subprocess.call(['rm', home_path + '.bashrc'])
subprocess.call(['ln','-sf', script_path + '.bashrc',home_path + '.bashrc'])

# init.el
subprocess.call(['rm','/home/oliver/.emacs'])
subprocess.call(['rm','/home/oliver/.emacs.d/init.el'])
subprocess.call(['rm','/home/oliver/.emacs.d/init.el~'])
emacs_path = home_path + '.emacs.d/'
subprocess.call(['ln','-sf', script_path + 'emacs/.emacs', emacs_path + 'init.el'])
#lua5.3
#open sockets
subprocess.call(['cp','/home/oliver/.tools/scripts-and-more/emacs/rdm.service','/home/oliver/.config/systemd/user/rdm.service'])
subprocess.call(['cp','/home/oliver/.tools/scripts-and-more/emacs/rdm.socket','/home/oliver/.config/systemd/user/rdm.socket'])
subprocess.call(['sudo','systemctl','--user','enable','rdm.socket'])
subprocess.call(['sudo','systemctl','--user','start','rdm.socket'])
# for jedi install python-jedi python3-jedi python-virtual-env


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


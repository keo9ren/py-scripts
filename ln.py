#!/usr/bin/env python 

import apt
import subprocess

current_user = 'oliver'

# bashrc
subprocess.call(['rm','/home/' +current_user + '/.bashrc'])
subprocess.call(['cp','.bashrc','/home/' + current_user + '/.bashrc'])

# init.el
subprocess.call(['rm','/home/oliver/.emacs'])
subprocess.call(['rm','/home/oliver/.emacs.d/init.el'])
subprocess.call(['rm','/home/oliver/.emacs.d/init.el~'])
subprocess.call(['cp','emacs/.emacs','/home/oliver/.emacs.d/init.el'])


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


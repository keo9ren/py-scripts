#!/usr/bin/env python
#_____________________________________________________________________________________
#
#       Filename:  save_ttyusbx.py
#
#    Description:  Saves input from ttyusbx to a file 
#                  Also it can configure the ttyusbx, works STM32f4-discovery board uart
#
#        Version:  1.0
#        Created:  17.11.2015
#       Revision:  none
#
#         Author:  B.Eng. Oliver Kehret, okehret@stud.hs-offenburg.de
#   Organization:  HS Offenburg, Offenburg, Germany
#      Copyright:  Copyright (c) 2015, B.Eng. Oliver Kehret
#
#          Notes:                  
#_____________________________________________________________________________________
import apt
import sys
import getopt
import subprocess
import os
import os.path
import numpy as np

def main(argv): 
    usb = ''
    path = ''
    
    try:
        opts, args = getopt.getopt(argv,"hcu:p:",["usb=","path="])
    except getopt.GetoptError:
        print 'Error'
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print 'usage'
            print './save_timestamps.py'
            print '-u < number of ttyUSB that should be used e.g. 0 > '
            print '-c < configures the specified port, sudo required to configere usage rights >' 
            print '-p--path < destination and name of the output file >'
            sys.exit()
        elif opt in ("-u","--usb"):
            usb = arg
        elif opt == '-c':
            if usb.isdigit() == False:
                print '-u with integer argument required'
            else:
                target = '/dev/ttyUSB' + usb
                print 'Configering your ' + target
                print '... ... ...'
                print 'Your new configuration is ...'
                subprocess.call(['stty','-F',target,'115200'])
                subprocess.call(['stty','-F',target,'ignbrk','-brkint', '-icrnl' ,'-imaxbel'])
                subprocess.call(['stty','-F',target,'-opost', '-onlcr', '-isig', '-icanon', '-iexten', '-echo', '-echoe', '-echok', '-echoctl', '-echoke'])
                subprocess.call(['stty','-F',target])
                subprocess.call(['sudo','chmod','777',target])

        elif opt in ("-p","path"):
            print usb
            if usb.isdigit() == False: 
                print '-u with integer argmument required'
            else:
                path = arg
                callstr = 'cat /dev/ttyUSB' + usb + '>' + path
                subprocess.call([callstr])
 
if __name__ == "__main__":
    main(sys.argv[1:])


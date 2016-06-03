#!/usr/bin/env python 

import argparse
import subprocess

parser = argparse.ArgumentParser(description='')

parser.add_argument('--ip',help='choose a custom ip adress')
parser.add_argument('--adapter',help='choose a custom adapter_name')
parser.add_argument('--netmask',help='choose a custom netmask')

args = parser.parse_args()

adapter_name = 'enx00606e43ad26';
ipv4_addr = '192.168.0.13';
net_mask = '255.255.255.0';

#   subprocess.call(['sudo',
#                   'ip',
#                   'a',
#                   'del',
#                   ipv4_addr + '/' + net_mask,
#                   'dev',
#                   adapter_name
#   ])
subprocess.call(['sudo',
                 'ip',
                 'a',
                 'add',
                 ipv4_addr + '/' + net_mask,
                 'dev',
                 adapter_name
])


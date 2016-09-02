#!/usr/bin/python3 
# Python script to check your C++ apps
# scan-build, framac???
#import os
#import subprocess
#import sys


# cmake -DCMAKE_C_COMPILER=/usr/share/clang/scan-build-3.7/ccc-analyzer -DCMAKE_CXX_COMPILER=/usr/share/clang/scan-build-3.7/c++-analyzer ..
# make clean
# scan-build -enable-checker alpha make -j

def main(argv):
    print('Testing Application')



def scan_build_cmake():
    print('Scan-build-cmake')
    cmake_cmd = 'cmake'
    cmake_c_comp = '-DCMAKE_C_COMPILER='
    cmake_cxx_comp = '-DCMAKE_CXX_COMPILER='
    clang_c = '/usr/share/clang/scan-build-3.7/ccc-analyzer'
    clang_cxx = '/usr/share/clang/scan-build-3.7/c++-analyzer'
    subprocess.call(['cmake',cmake_c_comp + clang_c,cmake_cxx_comp + clang_cxx,'..'])
    build_cmd = 'make'
    loopcount = 40
    subprocess.call([build_cmd,'clean'])
    subprocess.call(['scan-build','-enable-checker alpha','-maxloop ' + loopcount ,build_cmd,'-j'])

if __name__ == "__main__":
    main(sys.argv[1:])

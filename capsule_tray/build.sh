#!/bin/sh
openscad -Dmode=1 -o tray.stl tray.scad
openscad -Dmode=2 -o lid.stl tray.scad 

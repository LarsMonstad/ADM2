# BachProp Implementation script for fast install and scheduling training at cloud server
Contains the code to generate symbolic music with BachProp from Florian Colombo 

Requirements: 
Linux 
Ftp server
Url for dataset which neeeds to be in .rar archive
Only testet on cuda 10.1 at Vast.ai 

#Instructions
Set number of epochs, temperature, url for midifile, ftp settings

See more info at http://artificialdancemusic.com

example - ./install.sh -e 600 -t "0.4" -f "http://ftp.com/batch.rar" -l "ftp://myftpserevr.com" -u "ftpusername" -p "ftppassword" -d "/ftpfolder" -b "experiment number"




# Bachprop Settings
To create a folder in the save directory with generated MIDI files from a trained model on Bach's Chorales:

python BachProp.py ChoralesMusic21 load

To train and save a model on DATASET (provided the midi data are in a midi folder inside a directory named DATASET in the data directory):

python BachProp.py DATASET train



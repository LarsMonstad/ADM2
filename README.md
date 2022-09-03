# BachProp Implementation script for fast install and scheduling training at cloud server
Contains the code to generate symbolic music with BachProp from Florian Colombo 

Requirements: 
Linux 
Ftp server
Url for dataset 

#Instructions
Set number of epochs, temperature, url for midifile,ftp settings,

example - ./install.sh -e 600 -t "0.4" -f "http://ftp.com/batch.rar" -l "ftp://myftpserevr.com" -u "ftpusername" -p "ftppassword" -d "/ftpfolder" -b "experiment number"




# Bachprop Settings
To create a folder in the save directory with generated MIDI files from a trained model on Bach's Chorales:

python BachProp.py ChoralesMusic21 load

To train and save a model on DATASET (provided the midi data are in a midi folder inside a directory named DATASET in the data directory):

python BachProp.py DATASET train



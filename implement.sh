#!/bin/bash
#set number of epochs, temperature, url for midifile,ftp settings,
#example - ./install.sh -e 600 -t "0.4" -f "http://ftp.com/batch.rar" -l "ftp://myftpserevr.com" -u "ftpusername" -p "ftppassword" -d "/ftpfolder" -b "experiment number"
while getopts e:t:f:l:u:p:d:b: flag
do
    case "${flag}" in
        e) epochnumber=${OPTARG};;
        t) tempnumber=${OPTARG};;
        f) file=${OPTARG};;
        l) ftpurl=${OPTARG};;
        u) ftpu=${OPTARG};;
        p) ftppw=${OPTARG};;
        d) ftpfolder=${OPTARG};;
        b) expnr=${OPTARG};;		
    esac
done
#start install of everything
apt update
for x in python3-pip git unrar unzip wget rar ncftp sed
do
	apt install -y $x
done 
alias python==python3;alias pip==pip3
python3 -m pip install --upgrade pip
pip3 install tensorflow==2.2.0
for y in mido keras git+https://github.com/louisabraham/python3-midi h5py tqdm
do
	pip install $y
done
pip list
sleep 5
#git clone https://github.com/FlorianColombo/BachProp
cd data/
mkdir -p B7/midi 
wget $file -O Batch7.rar
unrar e Batch7.rar B7/midi/
cd ../src/

#Remove gpu processing temporarily
sed -i '6 a os.environ["CUDA_VISIBLE_DEVICES"] = "-1"' BachProp.py
head BachProp.py
#Setting epoch number
var1="    def trainModel(self, epochs=$epochnumber, validation_split=0.1):"
sed -i "407s|^.*$|$var1|" BachProp.py 
#Setting temperature
var2="    def generate(self, note_len=1000, until_all_ended=True, temperature=$tempnumber, seed=None):"
sed -i "641s|^.*$|$var2|" BachProp.py 
sleep 10
#Training
python3 BachProp.py B7 train
cd ../save
#create a rar file
rar a ${expnr}.rar B7
# upload the file into ftp 
ncftpput -u $ftpu -p $ftppw $ftpurl $ftpfolder ${expnr}.rar
sleep 20

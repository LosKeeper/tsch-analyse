CsmaMake(){
    # Compile csma folder
    cd csma && make clean && make
    cd ..
}

CsmaExperimentLaunchCoordSender1(){
    # Run csma experiment with 1 sender and 1 coordinator
    iotlab-profile addm3 -n power_monitor_coord -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender1 -voltage -current -power -period 8244 -avg 4 > /dev/null
    cd csma/build/iotlab/m3 && iotlab-experiment submit -n csma-1send-1coord -d 5 -l strasbourg,m3,1,coordinator.iotlab,power_monitor_coord -l strasbourg,m3,2,sender.iotlab,power_monitor_sender1 > /dev/null
    iotlab-experiment wait > /dev/null
    id=$(iotlab-experiment get -p | grep id | cut -d' ' -f6 | cut -d',' -f1)
    echo "Experiment with 1 sender and 1 coordinator launched with id : " $id
    cd ../../../..
    return $id
}

CsmaMake
CsmaExperimentLaunchCoordSender1
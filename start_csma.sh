CsmaMake(){
    # Compile csma folder
    cd csma && make clean && make
    cd ..
}

CsmaExperimentLaunchCoordSender1(){
    # Run csma experiment with 1 sender and 1 coordinator
    iotlab-profile addm3 -n power_monitor_coord -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender1 -voltage -current -power -period 8244 -avg 4 > /dev/null
    cd csma/build/iotlab/m3 
    expId=`iotlab-experiment submit -n csma-1send-1coord-power -d 5 -l strasbourg,m3,1,coordinator.iotlab,power_monitor_coord -l strasbourg,m3,2,sender.iotlab,power_monitor_sender1 | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $expID > /dev/null
    echo "Experiment with 1 sender and 1 coordinator launched with id : " $id
    cd ../../../..
    return $expId
}

CsmaExperimentLaunchCoordSender1Radio(){
    # Run CSMA experiment with 1 sender and 1 coordinator    
    iotlab-profile addm3 -n radio_monitor_coord -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender1 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    cd csma/build/iotlab/m3 
    expId=`iotlab-experiment submit -n csma-1send-1coord-radio -d 5 -l strasbourg,m3,1,coordinator.iotlab,radio_monitor_coord -l strasbourg,m3,2,sender.iotlab,radio_monitor_sender1 | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $expID > /dev/null
    echo "Experiment with 1 sender and 1 coordinator launched with id : " $id
    cd ../../../..
    return $expId
}

CsmaExperimentLaunchCoordSender1Log(){
    # Run CSMA experiment with 1 sender and 1 coordinator
    cd csma/build/iotlab/m3
    idExp=`iotlab-experiment submit -n csma-1send-1coord-log -d 5 -l strasbourg,m3,1,coordinator.iotlab -l strasbourg,m3,2,sender.iotlab | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $idExp > /dev/null
    echo "Experiment with 1 sender and 1 coordinator launched with id for log : " $idExp
    cd ../../../..
    serial_aggregator -i $idExp > assets/$idExp.log
    return $idExp
}

CsmaExperimentLaunchCoordSender2(){
    # Run csma experiment with 2 sender and 1 coordinator
    iotlab-profile addm3 -n power_monitor_coord -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender1 -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender2 -voltage -current -power -period 8244 -avg 4 > /dev/null
    cd csma/build/iotlab/m3
    expId=`iotlab-experiment submit -n csma-2send-1coord-power -d 5 -l strasbourg,m3,1,coordinator.iotlab,power_monitor_coord -l strasbourg,m3,2,sender.iotlab,power_monitor_sender1 -l strasbourg,m3,3,sender.iotlab,power_monitor_sender2 | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $expID > /dev/null
    echo "Experiment with 2 sender and 1 coordinator launched with id : " $id
    cd ../../../..
    return $expId
}

CsmaExperimentLaunchCoordSender2Radio(){
    # Run CSMA experiment with 2 sender and 1 coordinator    
    iotlab-profile addm3 -n radio_monitor_coord -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender1 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender2 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    cd csma/build/iotlab/m3 
    expId=`iotlab-experiment submit -n csma-2send-1coord-radio -d 5 -l strasbourg,m3,1,coordinator.iotlab,radio_monitor_coord -l strasbourg,m3,2,sender.iotlab,radio_monitor_sender1 -l strasbourg,m3,3,sender.iotlab,radio_monitor_sender2 | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $expID > /dev/null
    echo "Experiment with 2 sender and 1 coordinator launched with id : " $id
    cd ../../../..
    return $expId
}

CsmaExperimentLaunchCoordSender2Log(){
    # Run CSMA experiment with 2 sender and 1 coordinator
    cd csma/build/iotlab/m3
    idExp=`iotlab-experiment submit -n csma-2send-1coord-log -d 5 -l strasbourg,m3,1,coordinator.iotlab -l strasbourg,m3,2,sender.iotlab -l strasbourg,m3,3,sender.iotlab | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $idExp > /dev/null
    echo "Experiment with 2 sender and 1 coordinator launched with id for log : " $idExp
    cd ../../../..
    serial_aggregator -i $idExp > assets/$idExp.log
    return $idExp
}

CsmaExperimentLaunchCoordSender10(){
    # Run CSMA experiment with 10 sender and 1 coordinator
    iotlab-profile addm3 -n power_monitor_coord -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender1 -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender2 -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender3 -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender4 -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender5 -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender6 -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender7 -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender8 -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender9 -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender10 -voltage -current -power -period 8244 -avg 4 > /dev/null
    cd csma/build/iotlab/m3
    idExp=`iotlab-experiment submit -n csma-10send-1coord-power -d 5 -l strasbourg,m3,1,coordinator.iotlab,power_monitor_coord -l strasbourg,m3,2,sender.iotlab,power_monitor_sender1 -l strasbourg,m3,3,sender.iotlab,power_monitor_sender2 -l strasbourg,m3,4,sender.iotlab,power_monitor_sender3 -l strasbourg,m3,5,sender.iotlab,power_monitor_sender4 -l strasbourg,m3,6,sender.iotlab,power_monitor_sender5 -l strasbourg,m3,7,sender.iotlab,power_monitor_sender6 -l strasbourg,m3,8,sender.iotlab,power_monitor_sender7 -l strasbourg,m3,9,sender.iotlab,power_monitor_sender8 -l strasbourg,m3,10,sender.iotlab,power_monitor_sender9 -l strasbourg,m3,11,sender.iotlab,power_monitor_sender10 | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $idExp > /dev/null
    echo "Experiment with 10 sender and 1 coordinator launched with id : " $idExp
    cd ../../../..
    return $idExp
}

CsmaExperimentLaunchCoordSender10Radio(){
    iotlab-profile addm3 -n radio_monitor_coord -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender1 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender2 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender3 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender4 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender5 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender6 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender7 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender8 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender9 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender10 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    cd csma/build/iotlab/m3
    idExp=`iotlab-experiment submit -n csma-10send-1coord-radio -d 5 -l strasbourg,m3,1,coordinator.iotlab,radio_monitor_coord -l strasbourg,m3,2,sender.iotlab,radio_monitor_sender1 -l strasbourg,m3,3,sender.iotlab,radio_monitor_sender2 -l strasbourg,m3,4,sender.iotlab,radio_monitor_sender3 -l strasbourg,m3,5,sender.iotlab,radio_monitor_sender4 -l strasbourg,m3,6,sender.iotlab,radio_monitor_sender5 -l strasbourg,m3,7,sender.iotlab,radio_monitor_sender6 -l strasbourg,m3,8,sender.iotlab,radio_monitor_sender7 -l strasbourg,m3,9,sender.iotlab,radio_monitor_sender8 -l strasbourg,m3,10,sender.iotlab,radio_monitor_sender9 -l strasbourg,m3,11,sender.iotlab,radio_monitor_sender10 | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $idExp > /dev/null
    echo "Experiment with 10 sender and 1 coordinator launched with id : " $idExp
    cd ../../../..
    return $idExp
}

CsmaExperimentLaunchCoordSender10Log(){
    cd csma/build/iotlab/m3
    idExp=`iotlab-experiment submit -n csma-10send-1coord-log -d 5 -l strasbourg,m3,1,coordinator.iotlab -l strasbourg,m3,2,sender.iotlab -l strasbourg,m3,3,sender.iotlab -l strasbourg,m3,4,sender.iotlab -l strasbourg,m3,5,sender.iotlab -l strasbourg,m3,6,sender.iotlab -l strasbourg,m3,7,sender.iotlab -l strasbourg,m3,8,sender.iotlab -l strasbourg,m3,9,sender.iotlab -l strasbourg,m3,10,sender.iotlab -l strasbourg,m3,11,sender.iotlab | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $idExp > /dev/null
    echo "Experiment with 10 sender and 1 coordinator launched with id : " $idExp
    cd ../../../..
    return $idExp
}

CsmaMake
CsmaExperimentLaunchCoordSender1
CsmaExperimentLaunchCoordSender1Radio
CsmaExperimentLaunchCoordSender1Log
CsmaExperimentLaunchCoordSender2
CsmaExperimentLaunchCoordSender2Radio
CsmaExperimentLaunchCoordSender2Log
CsmaExperimentLaunchCoordSender10
CsmaExperimentLaunchCoordSender10Radio
CsmaExperimentLaunchCoordSender10Log

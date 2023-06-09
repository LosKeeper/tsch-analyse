tschOcherstraMake(){
    # Compile TSCH-Orchestra folder
    cd tsch-orchestra && make clean && make
    cd ..
}

tschOrchestraExperimentLaunchCoordSender1(){
    # Run TSCH-Orchestra experiment with 1 sender and 1 coordinator
    iotlab-profile addm3 -n power_monitor_coord -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender1 -voltage -current -power -period 8244 -avg 4 > /dev/null
    cd tsch-orchestra/build/iotlab/m3
    expId=`iotlab-experiment submit -n tsch-orchestra-1send-1coord -d 5 -l strasbourg,m3,1,coordinator.iotlab,power_monitor_coord -l strasbourg,m3,2,sender.iotlab,power_monitor_sender1 | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $expId > /dev/null
    echo "Experiment with 1 sender and 1 coordinator launched with id : " $expId
    cd ../../../..
    return $expId
}

tschOrchestraExperimentLaunchCoordSender1Radio(){
    # Run TSCH-Orchestra experiment with 1 sender and 1 coordinator
    iotlab-profile addm3 -n radio_monitor_coord -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender1 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    cd tsch-orchestra/build/iotlab/m3
    expId=`iotlab-experiment submit -n tsch-orchestra-1send-1coord-radio -d 5 -l strasbourg,m3,1,coordinator.iotlab,radio_monitor_coord -l strasbourg,m3,2,sender.iotlab,radio_monitor_sender1 | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $expId > /dev/null
    echo "Experiment with 1 sender and 1 coordinator launched with id for radio : " $expId
    cd ../../../..
    return $expId
}

tschOrchestraExperimentLaunchCoordSender1Log(){
    # Run TSCH-Orchestra experiment with 1 sender and 1 coordinator
    cd tsch-orchestra/build/iotlab/m3
    idExp=`iotlab-experiment submit -n tsch-orchestra-1send-1coord-log -d 5 -l strasbourg,m3,1,coordinator.iotlab -l strasbourg,m3,2,sender.iotlab | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $idExp > /dev/null
    echo "Experiment with 1 sender and 1 coordinator launched with id for log : " $idExp
    cd ../../../..
    serial_aggregator -i $idExp > assets/$idExp.log
    return $idExp
}

tschOrchestraExperimentLaunchCoordSender1Sniffer(){
    # Run TSCH-Orchestra experiment with 1 sender and 1 coordinator
    iotlab-profile addm3 -n sniffer_coord -sniffer -channels 11 > /dev/null
    iotlab-profile addm3 -n sniffer_sender1 -sniffer -channels 11 > /dev/null
    cd tsch-orchestra/build/iotlab/m3 
    expId=`iotlab-experiment submit -n tsch-orchestra-1send-1coord-sniffer -d 5 -l strasbourg,m3,1,coordinator.iotlab,sniffer_coord -l strasbourg,m3,2,sender.iotlab,sniffer_sender1 | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $expId > /dev/null
    echo "Experiment with 1 sender and 1 coordinator launched with id for sniffer : " $expId
    cd ../../../..
    return $expId
}

tschOrchestraExperimentLaunchCoordSender2(){
    # Run TSCH-Orchestra experiment with 2 senders and 1 coordinator
    iotlab-profile addm3 -n power_monitor_coord -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender1 -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender2 -voltage -current -power -period 8244 -avg 4 > /dev/null
    cd tsch-orchestra/build/iotlab/m3
    expId=`iotlab-experiment submit -n tsch-orchestra-2send-1coord -d 5 -l strasbourg,m3,1,coordinator.iotlab,power_monitor_coord -l strasbourg,m3,2,sender.iotlab,power_monitor_sender1 -l strasbourg,m3,3,sender.iotlab,power_monitor_sender2 | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $expId > /dev/null
    echo "Experiment with 2 senders and 1 coordinator launched with id : " $expId
    cd ../../../..
    return $expId
}

tschOrchestraExperimentLaunchCoordSender2Log(){
    # Run TSCH-Orchestra experiment with 2 senders and 1 coordinator
    cd tsch-orchestra/build/iotlab/m3
    idExp=`iotlab-experiment submit -n tsch-orchestra-2send-1coord-log -d 5 -l strasbourg,m3,1,coordinator.iotlab -l strasbourg,m3,2,sender.iotlab -l strasbourg,m3,3,sender.iotlab | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $idExp > /dev/null
    echo "Experiment with 2 senders and 1 coordinator launched with id for log : " $idExp
    cd ../../../..
    serial_aggregator -i $idExp > assets/$idExp.log
    return $idExp
}

tschOrchestraExperimentLaunchCoordSender2Radio(){
    # Run TSCH-Orchestra experiment with 2 senders and 1 coordinator
    iotlab-profile addm3 -n radio_monitor_coord -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender1 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender2 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    cd tsch-orchestra/build/iotlab/m3
    expId=`iotlab-experiment submit -n tsch-orchestra-2send-1coord-radio -d 5 -l strasbourg,m3,1,coordinator.iotlab,radio_monitor_coord -l strasbourg,m3,2,sender.iotlab,radio_monitor_sender1 -l strasbourg,m3,3,sender.iotlab,radio_monitor_sender2 | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $expId > /dev/null
    echo "Experiment with 2 senders and 1 coordinator launched with id for radio : " $expId
    cd ../../../..
    return $expId
}

tschOrchestraExperimentLaunchCoordSender2Sniffer(){
    # Run TSCH-Orchestra experiment with 2 senders and 1 coordinator
    iotlab-profile addm3 -n sniffer_coord -sniffer -channels 11 > /dev/null
    iotlab-profile addm3 -n sniffer_sender1 -sniffer -channels 11 > /dev/null
    iotlab-profile addm3 -n sniffer_sender2 -sniffer -channels 11 > /dev/null
    cd tsch-orchestra/build/iotlab/m3
    expId=`iotlab-experiment submit -n tsch-orchestra-2send-1coord-sniffer -d 5 -l strasbourg,m3,1,coordinator.iotlab,sniffer_coord -l strasbourg,m3,2,sender.iotlab,sniffer_sender1 -l strasbourg,m3,3,sender.iotlab,sniffer_sender2 | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $expId > /dev/null
    echo "Experiment with 2 senders and 1 coordinator launched with id for sniffer : " $expId
    cd ../../../..
    return $expId
}

tschOrchestraExperimentLaunchCoordSender10(){
    # Run TSCH-Orchestra experiment with 10 senders and 1 coordinator
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
    cd tsch-orchestra/build/iotlab/m3
    expId=`iotlab-experiment submit -n tsch-orchestra-10send-1coord -d 5 -l strasbourg,m3,1,coordinator.iotlab,power_monitor_coord -l strasbourg,m3,2,sender.iotlab,power_monitor_sender1 -l strasbourg,m3,3,sender.iotlab,power_monitor_sender2 -l strasbourg,m3,4,sender.iotlab,power_monitor_sender3 -l strasbourg,m3,5,sender.iotlab,power_monitor_sender4 -l strasbourg,m3,6,sender.iotlab,power_monitor_sender5 -l strasbourg,m3,7,sender.iotlab,power_monitor_sender6 -l strasbourg,m3,8,sender.iotlab,power_monitor_sender7 -l strasbourg,m3,9,sender.iotlab,power_monitor_sender8 -l strasbourg,m3,10,sender.iotlab,power_monitor_sender9 -l strasbourg,m3,11,sender.iotlab,power_monitor_sender10 | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $expId > /dev/null
    echo "Experiment with 10 senders and 1 coordinator launched with id : " $expId
    cd ../../../..
    return $expId
}

tschOrchestraExperimentLaunchCoordSender10Log(){
    cd tsch-orchestra/build/iotlab/m3 
    idExp=`iotlab-experiment submit -n tsch-orchestra-10send-1coord-log -d 5 -l strasbourg,m3,1,coordinator.iotlab -l strasbourg,m3,2,sender.iotlab -l strasbourg,m3,3,sender.iotlab -l strasbourg,m3,4,sender.iotlab -l strasbourg,m3,5,sender.iotlab -l strasbourg,m3,6,sender.iotlab -l strasbourg,m3,7,sender.iotlab -l strasbourg,m3,8,sender.iotlab -l strasbourg,m3,9,sender.iotlab -l strasbourg,m3,10,sender.iotlab -l strasbourg,m3,11,sender.iotlab | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $idExp > /dev/null
    echo "Experiment with 10 senders and 1 coordinator launched with id for log : " $idExp
    cd ../../../..
    serial_aggregator -i $idExp > assets/$idExp.log
    return $idExp
}

tschOrchestraExperimentLaunchCoordSender10Radio(){
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
    cd tsch-orchestra/build/iotlab/m3
    expId=`iotlab-experiment submit -n tsch-orchestra-10send-1coord-radio -d 5 -l strasbourg,m3,1,coordinator.iotlab,radio_monitor_coord -l strasbourg,m3,2,sender.iotlab,radio_monitor_sender1 -l strasbourg,m3,3,sender.iotlab,radio_monitor_sender2 -l strasbourg,m3,4,sender.iotlab,radio_monitor_sender3 -l strasbourg,m3,5,sender.iotlab,radio_monitor_sender4 -l strasbourg,m3,6,sender.iotlab,radio_monitor_sender5 -l strasbourg,m3,7,sender.iotlab,radio_monitor_sender6 -l strasbourg,m3,8,sender.iotlab,radio_monitor_sender7 -l strasbourg,m3,9,sender.iotlab,radio_monitor_sender8 -l strasbourg,m3,10,sender.iotlab,radio_monitor_sender9 -l strasbourg,m3,11,sender.iotlab,radio_monitor_sender10 | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $expId> /dev/null
    echo "Experiment with 10 senders and 1 coordinator launched with id for radio : " $expId
    cd ../../../..
    return $expId
}

tschOrchestraExperimentLaunchCoordSender10Sniffer(){
    iotlab-profile addm3 -n sniffer_coord -sniffer -channels 11 > /dev/null
    iotlab-profile addm3 -n sniffer_sender1 -sniffer -channels 11 > /dev/null
    iotlab-profile addm3 -n sniffer_sender2 -sniffer -channels 11 > /dev/null
    iotlab-profile addm3 -n sniffer_sender3 -sniffer -channels 11 > /dev/null
    iotlab-profile addm3 -n sniffer_sender4 -sniffer -channels 11 > /dev/null
    iotlab-profile addm3 -n sniffer_sender5 -sniffer -channels 11 > /dev/null
    iotlab-profile addm3 -n sniffer_sender6 -sniffer -channels 11 > /dev/null
    iotlab-profile addm3 -n sniffer_sender7 -sniffer -channels 11 > /dev/null
    iotlab-profile addm3 -n sniffer_sender8 -sniffer -channels 11 > /dev/null
    iotlab-profile addm3 -n sniffer_sender9 -sniffer -channels 11 > /dev/null
    iotlab-profile addm3 -n sniffer_sender10 -sniffer -channels 11 > /dev/null
    cd tsch-orchestra/build/iotlab/m3
    expId=`iotlab-experiment submit -n tsch-orchestra-10send-1coord-sniffer -d 5 -l strasbourg,m3,1,coordinator.iotlab,sniffer_coord -l strasbourg,m3,2,sender.iotlab,sniffer_sender1 -l strasbourg,m3,3,sender.iotlab,sniffer_sender2 -l strasbourg,m3,4,sender.iotlab,sniffer_sender3 -l strasbourg,m3,5,sender.iotlab,sniffer_sender4 -l strasbourg,m3,6,sender.iotlab,sniffer_sender5 -l strasbourg,m3,7,sender.iotlab,sniffer_sender6 -l strasbourg,m3,8,sender.iotlab,sniffer_sender7 -l strasbourg,m3,9,sender.iotlab,sniffer_sender8 -l strasbourg,m3,10,sender.iotlab,sniffer_sender9 -l strasbourg,m3,11,sender.iotlab,sniffer_sender10 | grep "id" | cut -d' ' -f6 | cut -d' ' -f1`
    iotlab-experiment wait -i $expId > /dev/null
    echo "Experiment with 10 senders and 1 coordinator launched with id for sniffer : " $expId
    cd ../../../..
    return $expId
}

tschOcherstraMake
tschOrchestraExperimentLaunchCoordSender1
tschOrchestraExperimentLaunchCoordSender1Radio
tschOrchestraExperimentLaunchCoordSender1Sniffer
tschOrchestraExperimentLaunchCoordSender1Log
tschOrchestraExperimentLaunchCoordSender2
tschOrchestraExperimentLaunchCoordSender2Radio
tschOrchestraExperimentLaunchCoordSender2Sniffer
tschOrchestraExperimentLaunchCoordSender2Log
tschOrchestraExperimentLaunchCoordSender10
tschOrchestraExperimentLaunchCoordSender10Radio
tschOrchestraExperimentLaunchCoordSender10Sniffer
tschOrchestraExperimentLaunchCoordSender10Log
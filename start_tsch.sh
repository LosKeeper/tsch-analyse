tschOcherstraMake(){
    # Compile TSCH-Orchestra folder
    cd tsch-orchestra && make
    cd ..
}

tschOrchestraExperimentLaunchCoordSender1(){
    # Run TSCH-Orchestra experiment with 1 sender and 1 coordinator
    iotlab-profile addm3 -n power_monitor_coord -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender1 -voltage -current -power -period 8244 -avg 4 > /dev/null
    cd tsch-orchestra/build/iotlab/m3 && iotlab-experiment submit -n tsch-orchestra-1send-1coord -d 5 -l strasbourg,m3,1,coordinator.iotlab,power_monitor_coord -l strasbourg,m3,2,sender.iotlab,power_monitor_sender1 > /dev/null
    iotlab-experiment wait > /dev/null
    id=$(iotlab-experiment get -p | grep id | cut -d' ' -f6 | cut -d',' -f1)
    echo "Experiment with 1 sender and 1 coordinator launched with id : " $id
    cd ../../../..
    return $id
}

tschOrchestraExperimentLaunchCoordSender1Radio(){
    # Run TSCH-Orchestra experiment with 1 sender and 1 coordinator
    iotlab-profile addm3 -n radio_monitor_coord -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender1 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    cd tsch-orchestra/build/iotlab/m3 && iotlab-experiment submit -n tsch-orchestra-1send-1coord-radio -d 5 -l strasbourg,m3,1,coordinator.iotlab,radio_monitor_coord -l strasbourg,m3,2,sender.iotlab,radio_monitor_sender1 > /dev/null
    iotlab-experiment wait > /dev/null
    id=$(iotlab-experiment get -p | grep id | cut -d' ' -f6 | cut -d',' -f1)
    echo "Experiment with 1 sender and 1 coordinator launched with id for radio : " $id
    cd ../../../..
    return $id
}

tschOrchestraExperimentLaunchCoordSender2(){
    # Run TSCH-Orchestra experiment with 2 senders and 1 coordinator
    iotlab-profile addm3 -n power_monitor_coord -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender1 -voltage -current -power -period 8244 -avg 4 > /dev/null
    iotlab-profile addm3 -n power_monitor_sender2 -voltage -current -power -period 8244 -avg 4 > /dev/null
    cd tsch-orchestra/build/iotlab/m3 && iotlab-experiment submit -n tsch-orchestra-2send-1coord -d 5 -l strasbourg,m3,1,coordinator.iotlab,power_monitor_coord -l strasbourg,m3,2,sender.iotlab,power_monitor_sender1 -l strasbourg,m3,3,sender.iotlab,power_monitor_sender2 > /dev/null
    iotlab-experiment wait > /dev/null
    id=$(iotlab-experiment get -p | grep id | cut -d' ' -f6 | cut -d',' -f1)
    echo "Experiment with 2 senders and 1 coordinator launched with id : " $id
    cd ../../../..
    return $id
}

tschOrchestraExperimentLaunchCoordSender2Radio(){
    # Run TSCH-Orchestra experiment with 2 senders and 1 coordinator
    iotlab-profile addm3 -n radio_monitor_coord -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender1 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    iotlab-profile addm3 -n radio_monitor_sender2 -rssi -channels 11 14 -rperiod 1 -num 1 > /dev/null
    cd tsch-orchestra/build/iotlab/m3 && iotlab-experiment submit -n tsch-orchestra-2send-1coord-radio -d 5 -l strasbourg,m3,1,coordinator.iotlab,radio_monitor_coord -l strasbourg,m3,2,sender.iotlab,radio_monitor_sender1 -l strasbourg,m3,3,sender.iotlab,radio_monitor_sender2 > /dev/null
    iotlab-experiment wait > /dev/null
    id=$(iotlab-experiment get -p | grep id | cut -d' ' -f6 | cut -d',' -f1)
    echo "Experiment with 2 senders and 1 coordinator launched with id for radio : " $id
    cd ../../../..
    return $id
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
    cd tsch-orchestra/build/iotlab/m3 && iotlab-experiment submit -n tsch-orchestra-10send-1coord -d 5 -l strasbourg,m3,1,coordinator.iotlab,power_monitor_coord -l strasbourg,m3,2,sender.iotlab,power_monitor_sender1 -l strasbourg,m3,3,sender.iotlab,power_monitor_sender2 -l strasbourg,m3,4,sender.iotlab,power_monitor_sender3 -l strasbourg,m3,5,sender.iotlab,power_monitor_sender4 -l strasbourg,m3,6,sender.iotlab,power_monitor_sender5 -l strasbourg,m3,7,sender.iotlab,power_monitor_sender6 -l strasbourg,m3,8,sender.iotlab,power_monitor_sender7 -l strasbourg,m3,9,sender.iotlab,power_monitor_sender8 -l strasbourg,m3,10,sender.iotlab,power_monitor_sender9 -l strasbourg,m3,11,sender.iotlab,power_monitor_sender10 > /dev/null
    iotlab-experiment wait > /dev/null
    id=$(iotlab-experiment get -p | grep id | cut -d' ' -f6 | cut -d',' -f1)
    echo "Experiment with 10 senders and 1 coordinator launched with id : " $id
    cd ../../../..
    return $id
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
    cd tsch-orchestra/build/iotlab/m3 && iotlab-experiment submit -n tsch-orchestra-10send-1coord-radio -d 5 -l strasbourg,m3,1,coordinator.iotlab,radio_monitor_coord -l strasbourg,m3,2,sender.iotlab,radio_monitor_sender1 -l strasbourg,m3,3,sender.iotlab,radio_monitor_sender2 -l strasbourg,m3,4,sender.iotlab,radio_monitor_sender3 -l strasbourg,m3,5,sender.iotlab,radio_monitor_sender4 -l strasbourg,m3,6,sender.iotlab,radio_monitor_sender5 -l strasbourg,m3,7,sender.iotlab,radio_monitor_sender6 -l strasbourg,m3,8,sender.iotlab,radio_monitor_sender7 -l strasbourg,m3,9,sender.iotlab,radio_monitor_sender8 -l strasbourg,m3,10,sender.iotlab,radio_monitor_sender9 -l strasbourg,m3,11,sender.iotlab,radio_monitor_sender10 > /dev/null
    iotlab-experiment wait > /dev/null
    id=$(iotlab-experiment get -p | grep id | cut -d' ' -f6 | cut -d',' -f1)
    echo "Experiment with 10 senders and 1 coordinator launched with id for radio : " $id
}

plotConsumption(){
    # Get TSCH-Orchestra experiment
    id=$1
    # plot all the consumption
    for i in {1..$2}
        pathi=~/.iot-lab/$id/consumption/m3_$i.oml
        plot_oml_consum -p -i $pathi
    done
}

plotRadio(){
    # Get TSCH-Orchestra experiment
    id=$1
    # plot all the radio
    for i in {1..$2}
        pathi=~/.iot-lab/$id/radio/m3_$i.oml
        plot_oml_radio -a -i $pathi
    done
}

tschOcherstraMake
tschOrchestraExperimentLaunchCoordSender1Radio
tschOrchestraExperimentLaunchCoordSender2Radio
tschOrchestraExperimentLaunchCoordSender10Radio

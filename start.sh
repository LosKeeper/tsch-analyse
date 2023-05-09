tschOcherstraMake(){
    # Compile TSCH-Orchestra folder
    cd tsch-orchestra && make
    cd ..
}

tschOrchestraExperimentLaunchCoordSender(){
    # Run TSCH-Orchestra experiment with 1 sender and 1 coordinator
    iotlab-profile addm3 -n power_monitor_coord -voltage -current -power -period 8244 -avg 4
    iotlab-profile addm3 -n power_monitor_sender1 -voltage -current -power -period 8244 -avg 4
    cd tsch-orchestra/build/iotlab/m3 && iotlab-experiment submit -n tsch-orchestra-1send-1coord -d 5 -l strasbourg,m3,1,coordinator.iotlab,power_monitor_coord -l strasbourg,m3,2,sender.iotlab,power_monitor_sender1
    iotlab-experiment wait
    id=$(iotlab-experiment get -p | grep id | cut -d' ' -f6 | cut -d',' -f1)
    echo "Experiment with 1 sender and 1 coordinator launched with id : " $id
    cd ../../../..
    return $id
}

tschOrchestraExperimentLaunchCoordSender2(){
    # Run TSCH-Orchestra experiment with 2 senders and 1 coordinator
    iotlab-profile addm3 -n power_monitor_coord -voltage -current -power -period 8244 -avg 4
    iotlab-profile addm3 -n power_monitor_sender1 -voltage -current -power -period 8244 -avg 4
    iotlab-profile addm3 -n power_monitor_sender2 -voltage -current -power -period 8244 -avg 4
    cd tsch-orchestra/build/iotlab/m3 && iotlab-experiment submit -n tsch-orchestra-2send-1coord -d 5 -l strasbourg,m3,1,coordinator.iotlab,power_monitor_coord -l strasbourg,m3,2,sender.iotlab,power_monitor_sender1 -l strasbourg,m3,3,sender.iotlab,power_monitor_sender2
    iotlab-experiment wait
    id=$(iotlab-experiment get -p | grep id | cut -d' ' -f6 | cut -d',' -f1)
    echo "Experiment with 2 senders and 1 coordinator launched with id : " $id
    cd ../../../..
    return $id
}

tschOrchestraExperimentLaunchCoordSender10(){
    # Run TSCH-Orchestra experiment with 10 senders and 1 coordinator
    iotlab-profile addm3 -n power_monitor_coord -voltage -current -power -period 8244 -avg 4
    iotlab-profile addm3 -n power_monitor_sender1 -voltage -current -power -period 8244 -avg 4
    iotlab-profile addm3 -n power_monitor_sender2 -voltage -current -power -period 8244 -avg 4
    iotlab-profile addm3 -n power_monitor_sender3 -voltage -current -power -period 8244 -avg 4
    iotlab-profile addm3 -n power_monitor_sender4 -voltage -current -power -period 8244 -avg 4
    iotlab-profile addm3 -n power_monitor_sender5 -voltage -current -power -period 8244 -avg 4
    iotlab-profile addm3 -n power_monitor_sender6 -voltage -current -power -period 8244 -avg 4
    iotlab-profile addm3 -n power_monitor_sender7 -voltage -current -power -period 8244 -avg 4
    iotlab-profile addm3 -n power_monitor_sender8 -voltage -current -power -period 8244 -avg 4
    iotlab-profile addm3 -n power_monitor_sender9 -voltage -current -power -period 8244 -avg 4
    iotlab-profile addm3 -n power_monitor_sender10 -voltage -current -power -period 8244 -avg 4
    cd tsch-orchestra/build/iotlab/m3 && iotlab-experiment submit -n tsch-orchestra-10send-1coord -d 5 -l strasbourg,m3,1,coordinator.iotlab,power_monitor_coord -l strasbourg,m3,2,sender.iotlab,power_monitor_sender1 -l strasbourg,m3,3,sender.iotlab,power_monitor_sender2 -l strasbourg,m3,4,sender.iotlab,power_monitor_sender3 -l strasbourg,m3,5,sender.iotlab,power_monitor_sender4 -l strasbourg,m3,6,sender.iotlab,power_monitor_sender5 -l strasbourg,m3,7,sender.iotlab,power_monitor_sender6 -l strasbourg,m3,8,sender.iotlab,power_monitor_sender7 -l strasbourg,m3,9,sender.iotlab,power_monitor_sender8 -l strasbourg,m3,10,sender.iotlab,power_monitor_sender9 -l strasbourg,m3,11,sender.iotlab,power_monitor_sender10
    iotlab-experiment wait
    id=$(iotlab-experiment get -p | grep id | cut -d' ' -f6 | cut -d',' -f1)
    echo "Experiment with 10 senders and 1 coordinator launched with id : " $id
    cd ../../../..
    return $id
}

plotConsumption(){
    # Get TSCH-Orchestra experiment
    id=$1
    path1="~/.iot-lab/$id/consumption/m3_1.oml"
    echo "Path 1 : " $path1
    path2="~/.iot-lab/$id/consumption/m3_2.oml"
    echo "Path 2 : " $path2
    plot_oml_consum -p -i $path1
    plot_oml_consum -p -i $path2
    echo "Plotting consumption"
    cat $path1
    cat $path2
}

plotRadio(){
    # Get TSCH-Orchestra experiment
    id=$1
    path1="~/.iot-lab/$id/radio/m3_1.oml"
    exho "Path 1 : " $path1
    path2="~/.iot-lab/$id/radio/m3_2.oml"
    echo "Path 2 : " $path2
    plot_oml_radio -a -i $path1
    plot_oml_radio -a -i $path2
    echo "Plotting radio"
    cat $path1
    cat $path2
}

tschOcherstraMake
tschOrchestraExperimentLaunchCoordSender1
tschOrchestraExperimentLaunchCoordSender2
tschOrchestraExperimentLaunchCoordSender10
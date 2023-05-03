tschOcherstraMake(){
    # Compile TSCH-Orchestra folder
    cd tsch-orchestra && make
    cd ..
}

tschOrchestraExperimentLaunch(){
    # Run TSCH-Orchestra experiment
    iotlab-profile addm3 -n power_monitor_coord -voltage -current -power -period 8244 -avg 4
    iotlab-profile addm3 -n power_monitor_sender -voltage -current -power -period 8244 -avg 4
    cd tsch-orchestra/build/iotlab/m3 && iotlab-experiment submit -n tsch-orchestra -d 10 -l strasbourg,m3,1,coordinator.iotlab,power_monitor_coord -l strasbourg,m3,2,sender.iotlab,power_monitor_sender
    iotlab-experiment wait
    local id=$(iotlab-experiment get -p | grep id | cut -d' ' -f6 | cut -d',' -f1)
    echo "Experiment launched with id : " $id
    cd ../../../..
    return $id
}

plotConsumption(){
    # Get TSCH-Orchestra experiment
    id=$1
    path1="~/.iot-lab/$id/consumption/m3_1.oml"
    path2="~/.iot-lab/$id/consumption/m3_2.oml"
    plot_oml_consum -p -i $path1
    plot_oml_consum -p -i $path2
}

plotRadio(){
    # Get TSCH-Orchestra experiment
    id=$1
    path1="~/.iot-lab/$id/radio/m3_1.oml"
    path2="~/.iot-lab/$id/radio/m3_2.oml"
    plot_oml_radio -a -i $path1
    plot_oml_radio -a -i $path2
}

tschOcherstraMake
expId=$(tschOrchestraExperimentLaunch)
# Wait for the experiment to be launched and finished
sleep 120
plotConsumption $expId
plotRadio $expId
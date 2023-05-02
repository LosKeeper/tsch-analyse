tschOcherstraMake(){
    # Compile TSCH-Orchestra folder
    cd tsch-orchestra && make
    cd ..
}

tschOrchestraExperimentLaunch(){
    # Run TSCH-Orchestra experiment
    cd tsch-orchestra/build/iotlab/m3 && iotlab-experiment submit -n tsch-orchestra -d 20 -l strasbourg,m3,1,coordinator.iotlab -l strasbourg,m3,2,sender.iotlab
    iotlab-experiment wait
    local id=$(iotlab-experiment get -p | grep id | cut -d' ' -f6 | cut -d',' -f1)
    echo $id
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
id=$(tschOrchestraExperimentLaunch)
plotConsumption $id
plotRadio $id
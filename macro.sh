# Functions used directly in the terminal using .bashrc

alias cd_dir="cd ~/iot-lab/parts/iot-lab-contiki-ng/contiki-ng/examples/tsch-analyse"

plotConsumption(){
    # $1: id of the experiment
    # $2: number of nodes
    id=$1
    # plot all the consumption
    for i in {1..$2}
    do
        pathi=~/.iot-lab/$id/consumption/m3_$i.oml
        plot_oml_consum -p -i $pathi
    done
}

plotRadio(){
    # $1: id of the experiment
    # $2: number of nodes
    id=$1
    # plot all the radio
    for i in {1..$2}
    do
        pathi=~/.iot-lab/$id/radio/m3_$i.oml
        plot_oml_radio -a -i $pathi
    done
}
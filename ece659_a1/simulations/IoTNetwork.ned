package ece659_a1.simulations;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.aodv.AodvRouter;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.common.IntegratedVisualizer;

network IoTNetwork
{
    parameters:
        int numHosts = default(25);
        @display("bgb=500,500");

    submodules:
        visualizer: IntegratedVisualizer {
            @display("p=50,50");
        }

        configurator: Ipv4NetworkConfigurator {
            @display("p=50,100");
        }

        radioMedium: Ieee80211ScalarRadioMedium {
            @display("p=50,150");
        }

        host[numHosts]: AodvRouter {
            @display("p=100,200;r=,,#707070");
        }
}
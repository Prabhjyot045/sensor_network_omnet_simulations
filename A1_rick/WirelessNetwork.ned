package a1;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.contract.INetworkNode;
import inet.physicallayer.wireless.common.contract.packetlevel.IRadioMedium;
import inet.visualizer.contract.IIntegratedVisualizer;

network WirelessNetwork
{
    parameters:
        int numHosts;
        @display("bgb=500,500");
    submodules:
        visualizer: <default("IntegratedCanvasVisualizer")> like IIntegratedVisualizer {
            @display("p=100,50");
        }
        // The Configurator assigns IP addresses (10.0.0.x) to your nodes
        configurator: Ipv4NetworkConfigurator {
            @display("p=100,200");
        }
        radioMedium: <default("Ieee80211ScalarRadioMedium")> like IRadioMedium {
            @display("p=100,100");
        }
        // Updated Host Definition: Uses INetworkNode defaulting to AodvRouter
        host[numHosts]: <default("AodvRouter")> like INetworkNode {
            @display("p=250,250");
        }
}

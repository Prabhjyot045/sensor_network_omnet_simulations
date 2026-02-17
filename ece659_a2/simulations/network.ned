//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

package ece659_a2.simulations;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.ManetRouter;
import inet.physicallayer.wireless.common.medium.RadioMedium;

network SensorNetwork
{
    parameters:
        int numSensors = default(120);
        double areaX @unit(m) = default(400m);
        double areaY @unit(m) = default(400m);
        double sinkX @unit(m) = default(200m);
        double sinkY @unit(m) = default(200m);
    submodules:
        radioMedium: RadioMedium {
            @display("p=100,60");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=100,120");
        }
        sink: ManetRouter {
            parameters:
                @display("p=350,120;i=device/server");
                mobility.typename = "StationaryMobility";
                mobility.initialX = parent.sinkX;
                mobility.initialY = parent.sinkY;
                mobility.initialZ = 0m;
        }
        sensor[numSensors]: ManetRouter {
            parameters:
                @display("p=200,220;i=device/wifilaptop");
                mobility.typename = "RandomWaypointMobility";
                mobility.constraintAreaMinX = 0m;
                mobility.constraintAreaMinY = 0m;
                mobility.constraintAreaMaxX = parent.areaX;
                mobility.constraintAreaMaxY = parent.areaY;
                mobility.constraintAreaMinZ = 0m;
                mobility.constraintAreaMaxZ = 0m;
                mobility.speed = 0mps;
                mobility.waitTime = 0s;
        }
}


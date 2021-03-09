
// Copyright (C) 2013-2018 University of Amsterdam
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
// You should have received a copy of the GNU Affero General Public
// License along with this program.  If not, see
// <http://www.gnu.org/licenses/>.
//

import QtQuick 									2.8
import QtQuick.Layouts 							1.3
import JASP.Controls 							1.0
import JASP.Widgets 							1.0

Form 
{
	usesJaspResults:							true
	columns:									2

        VariablesForm
        {
            AvailableVariablesList { name: "rsmVariablesList" }
            AssignedVariablesList  { name: "rsmVariables";	        title: qsTr("Predictors (Two)");	suggestedColumns: ["scale"]   }
            AssignedVariablesList  { name: "rsmResponseVariables";	title: qsTr("Response (One)");  suggestedColumns: ["scale"]   }
            AssignedVariablesList  { name: "rsmBlocks";	            title: qsTr("Blocks (One)");    suggestedColumns: ["nominal"]   }
        }
		
		GroupBox
		{
			title: 							qsTr("Additional options")

            CheckBox
            {
                name:                       "showDesign";label:            qsTr("Suggest Central Composite Designs")
                IntegerField
                {
                    name:                       "factorResponse"
                    label:                      "Number of factors"
                    defaultValue:               2
                    min:                        2
                    max:                        50
                }

                IntegerField
                {
                    name:						"responseSurfaceCenter"
                    label:						qsTr("Number of center points in each cube block")
                    defaultValue:				3
                    min:						1
                    max:						50
                }

                IntegerField
                {
                    name:						"responseSurfaceBlocks"
                    label:						qsTr("Number of cube blocks that comprise one rep of cube portion")
                    defaultValue:				3
                    min:						1
                    max:						50
                }

                IntegerField
                {
                    name:						"responseSurfaceCenterPointStar"
                    label:						qsTr("Number of center points in each star block")
                    defaultValue:				3
                    min:						1
                    max:						50
                }

                IntegerField
                {
                    name:						"responseSurfaceReplicationStar"
                    label:						qsTr("Number of replications of each within-block star point")
                    defaultValue:				3
                    min:						1
                    max:						50
                }



            }

            CheckBox
            {
                    name:                      "contour";label:   qsTr("Contour plots")
                    IntegerField
                    {
                        name:						"firstVar"
                        label:						qsTr("Divide the first variable by step")
                        defaultValue:				5
                        min:						1
                        max:						50
                    }


                    IntegerField
                    {
                        name:						"secondVar"
                        label:						qsTr("Divide the second variable by step")
                        defaultValue:				5
                        min:						1
                        max:						50
                    }

            }

        }

	Item 
	{
		Layout.preferredHeight: 				generateDesign.height
		Layout.fillWidth: 						true
		Layout.columnSpan:						2

		Button 
		{
			id: 								generateDesign
			anchors.right:						parent.right
			anchors.bottom:						parent.bottom
			text: 								qsTr("<b>Create Design</b>")
			// onClicked: 							form.exportResults()
		}
	}
}

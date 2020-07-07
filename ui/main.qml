import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    visible: true
    id: window
    width: 300
    height: 300

    Material.theme: Material.Dark
    Material.accent: Material.Blue

    Column {
        anchors.centerIn: parent

        RadioButton {
            text: qsTr("small")
            }

        RadioButton {
            text: qsTr("Medium")
            checked: true
            }

        RadioButton {
            text: qsTr("High")
            }

        Button {
            text: qsTr("Click Here")
            objectName: "my_button"
            Material.background: Material.BlueGrey
            signal messageRequired
            onClicked: messageRequired()
            }

    }

}

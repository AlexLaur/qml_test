import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    visible: true
    id: window
    // visibility: Qt.WindowFullScreen
    width: 400
    height: 600

    Material.theme: Material.Dark
    Material.primary: Material.DeepOrange
    Material.accent: Material.LightBlue

    menuBar: ToolBar {

        RowLayout {
            width: parent.width

            ToolButton {
                id: fileButton
                icon.source: 'icons/menu.png'
                onClicked: menu.open()

                Menu {
                    id: menu

                    MenuItem {
                        text: 'New...'
                        onClicked: console.log('New !')
                    }

                    MenuItem {
                        text: 'Open...'
                        onClicked: console.log('Open !')
                    }

                    MenuItem {
                        text: 'Save'
                        onClicked: console.log('Save !')
                    }
                }
            }

            ToolButton {
                objectName: 'menu_profile'
                anchors.right: parent.right
            }
        }
    }

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
            signal messageRequired
            onClicked: messageRequired()
            }
    }
}

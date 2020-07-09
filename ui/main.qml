import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.15

ApplicationWindow {
    visible: true
    id: window
    // visibility: Qt.WindowFullScreen
    width: 600
    height: 400

    Material.theme: Material.Dark
    Material.primary: Material.LightBlue
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

    GridLayout {
        anchors.fill: parent
        anchors.margins: 20
        rowSpacing: 20
        columnSpacing: 20
        flow:  width > height ? GridLayout.LeftToRight : GridLayout.TopToBottom

        ColumnLayout{
            Layout.fillWidth: true
            Layout.fillHeight: true

            RadioButton {
                text: qsTr('Medium')
                checked: true
            }

            RadioButton {
                text: qsTr('Medium')
                checked: true
            }

            RadioButton {
                text: qsTr('High')
            }

            Button {
                text: qsTr('Click Here')
                objectName: 'my_button'
                signal messageRequired
                onClicked: messageRequired()
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Video {
                id: video
                width : 800
                height : 600
                source: ''

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        video.play()
                    }
                }

                focus: true
                Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
                Keys.onLeftPressed: video.seek(video.position - 5000)
                Keys.onRightPressed: video.seek(video.position + 5000)
            }
        }
    }
}

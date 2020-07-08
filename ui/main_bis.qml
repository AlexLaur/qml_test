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

    Column{
        anchors.centerIn: parent

        TextField {
            id: login
            width:300
            objectName: 'txf_login'
            placeholderText: qsTr('Login')
            }

        TextField {
            id: password
            width:300
            objectName: 'txf_password'
            placeholderText: qsTr('Password')
            echoMode: TextInput.Password
            }

        RowLayout {

            Button {
                text: qsTr('Test 1')
                objectName: 'my_button_1'
                }

            Button {
                text: qsTr('Test 2')
                objectName: 'my_button_2'
                onClicked: {
                    py_MainApp.test2(login.text, password.text)
                    result.text = result_val
                    console.log(result_val)
                    }
                }

            Button {
                text: qsTr('Test 3')
                objectName: 'my_button_3'
                onClicked: {
                    console.log(py_MainApp.test3(login.text, password.text))
                    }
                }
        }
        RowLayout {

            Label {
                id: result
                objectName: 'result_label'
                text : 'RESULT'
                }
        }
    }
}

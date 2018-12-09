import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property bool switched : false

    Pane {
        id: colorPane
        width: 400
        height: width
        Material.background: switched ? Material.Teal : Material.Red
        Material.elevation: 3

        MouseArea {
            anchors.centerIn: parent
            width: parent.width
            height: width
            onClicked: {
                switched = !switched
            }
        }
    }
    Item {
        focus: true
        Keys.enabled: true
        Keys.onPressed: {
            if(event.key == Qt.Key_Escape) {
                console.log("escaping")
                close()
            } else {
                console.log(event.text)
                switched = !switched
            }
            event.accepted = true
        }
    }
}

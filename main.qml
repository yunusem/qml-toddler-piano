import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtMultimedia 5.5

ApplicationWindow {
    visible: true
    width: Screen.width
    height: Screen.height
    title: qsTr("Toddler Piano")
    flags: Qt.WindowStaysOnTopHint
    property var colorList: ["#9C27B0","#3F51B5","#00BCD4","#009688","#FF5722","#795548","#9E9E9E"]
    property int rng: 1
    color: "#000000"

    Pane {
        id: colorPane
        width: parent.width / 2
        height: parent.height / 2
        anchors.centerIn: parent
        Material.background: colorList[rng]
        Material.elevation: 3

        MouseArea {
            anchors.centerIn: parent
            width: parent.width
            height: width
            onClicked: {
                rng = generate()
            }
        }
    }

    SoundEffect {
        id: nota_do
        source: "sounds/do.wav"
    }
    SoundEffect {
        id: nota_re
        source: "sounds/re.wav"
    }
    SoundEffect {
        id: nota_mi
        source: "sounds/mi.wav"
    }
    SoundEffect {
        id: nota_fa
        source: "sounds/fa.wav"
    }
    SoundEffect {
        id: nota_sol
        source: "sounds/sol.wav"
    }
    SoundEffect {
        id: nota_la
        source: "sounds/la.wav"
    }
    SoundEffect {
        id: nota_si
        source: "sounds/si.wav"
    }

    Item {
        focus: true
        Keys.enabled: true
        Keys.onPressed: {

            switch (event.key){
            case Qt.Key_3: rng = 1; break
            case Qt.Key_4: rng = 2; break
            case Qt.Key_5: rng = 3; break
            case Qt.Key_6: rng = 4; break
            case Qt.Key_7: rng = 5; break
            case Qt.Key_8: rng = 6; break
            case Qt.Key_9: rng = 7; break
            default: rng = generate()
            }


            playNote(rng)
            event.accepted = true
        }
    }

    // between 1-7
    function playNote(note) {
        switch (note)
        {
        case 1:if(!nota_do.playing); nota_do.play(); break
        case 2:if(!nota_re.playing); nota_re.play(); break
        case 3:if(!nota_mi.playing); nota_mi.play(); break
        case 4:if(!nota_fa.playing); nota_fa.play(); break
        case 5:if(!nota_sol.playing); nota_sol.play(); break
        case 6:if(!nota_la.playing); nota_la.play(); break
        case 7:if(!nota_si.playing); nota_si.play(); break
        }
    }

    function generate() {
        return Math.floor(Math.random() * 7) + 1
    }
}

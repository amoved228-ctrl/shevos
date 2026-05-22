import QtQuick 2.15
import calamares.slideshow 1.0

Presentation {
    id: presentation
    Slide {
        Text {
            anchors.centerIn: parent
            text: "ShevOS устанавливается...\nHyprland, русский язык, NetworkManager и nmtui уже включены."
            color: "white"
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
        }
    }
}

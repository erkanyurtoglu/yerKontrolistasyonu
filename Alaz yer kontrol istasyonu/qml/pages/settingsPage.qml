import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"

Item {
    Rectangle {

        // Sol kenar çubuğu ayarlar sayfası 
        id: rectangle
        color: "black" //Sayfa rengi
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Text {
            // Sayfadaki metin yazısı 
            id: text1
            x: 440
            y: 305
            color: "#ffffff" //Metin yazısı rengi
            text: qsTr("GELİŞTİRME AŞAMASINDA")
            anchors.verticalCenter: parent.verticalCenter  // Dikeyde metnin konumunu belirlem
            font.pixelSize: 30  // Metnin piksel boyutunu belirleme
            horizontalAlignment: Text.AlignHCenter  // Metnin yatay hizalamasını ortala
            verticalAlignment: Text.AlignVCenter    // Metnin dikey hizalamasını ortala
            font.weight: Font.Thin  // Metnin font kalınlığını ayarla
            font.family: "Arial"    // Metnin kullanacağı font ailesini belirleme
            anchors.horizontalCenter: parent.horizontalCenter
        }



    }

    Connections{    // Bileşenin arka plandaki işlevselliğe bağlanmasını sağlar. 
        target:backend

    }

}


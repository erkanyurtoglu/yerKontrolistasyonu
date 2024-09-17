import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"
import QtPositioning 5.14
import QtGraphicalEffects 1.0

Item {

    Rectangle {
        id: main_area   // Ana ekran 
        color: 'black'   // Ana ekran arka plan rengi
        anchors.fill: parent    //bileşeni ebeveyn bileşenin boyutlarına ve konumuna tam olarak doldurur.


        Flow {
            //Kutucukların çerçeve içindeki kenar boşlukları ayarlanır
            id: flow_area 
            anchors.fill: parent // Bileşen, ebeveyn bileşenin tamamını kaplayacak şekilde boyutlanır ve hizalanır.
            clip: false // Bileşenin içeriğinin sınırlarını aşmasına izin verilir.
            layoutDirection: Qt.LeftToRight // İçindeki öğeler soldan sağa doğru düzenlenir.
            anchors.rightMargin: 10 // Sağ kenar, ebeveyn bileşenden 10 birim uzaklıkta olacak şekilde ayarlanır.
            anchors.leftMargin: 30 // Sol kenar, ebeveyn bileşenden 10 birim uzaklıkta olacak şekilde ayarlanır.
            anchors.topMargin: 0 // Üst kenar, ebeveyn bileşenden 10 birim uzaklıkta olacak şekilde ayarlanır.
            transformOrigin: Item.Center // Dönüşüm orijini bileşenin merkezi olacak şekilde ayarlanır.
            flow: Flow.LeftToRight // İçindeki öğeler soldan sağa doğru sıralanır.
            anchors.bottomMargin: 80 // Alt kenar, ebeveyn bileşenden 80 birim uzaklıkta olacak şekilde ayarlanır.
            spacing: 21 // Öğeler arasındaki boşluk 21 birim olarak ayarlanır.

            Rectangle {
                id: airspeed  // Air speed ekranı
                width: 385
                height: 360
                radius: 25 //çerçeve radius ayarı
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#999999" // Gradyan üst kısmı
                    }

                    GradientStop {
                        position: 1
                        color: "#0D0D0D"  // Gradyan alt kısmı
                    }
                }
                clip: false  // İçeriğin ebeveyn bileşenin sınırlarını aşmasına izin verir.

                Rectangle {
                    id: indicator_area   //Air Speed gösterge arka planı
                    color: "#00000000"   // Bileşenin arka plan rengi tamamen saydam (#00000000).
                    anchors.left: parent.left   // Bileşenin sol kenarı ebeveyn bileşenin sol kenarına hizalanır.
                    anchors.right: parent.right   // Bileşenin sağ kenarı ebeveyn bileşenin sağ kenarına hizalanır.
                    anchors.top: parent.top   // Bileşenin üst kenarı ebeveyn bileşenin üst kenarına hizalanır.
                    anchors.bottom: parent.bottom   // Bileşenin alt kenarı ebeveyn bileşenin alt kenarına hizalanır.
                    anchors.bottomMargin: 10   // Bileşenin alt kenarının ebeveyn bileşenden 10 birim uzaklıkta olmasını sağlar.
                    anchors.rightMargin: 0   // Bileşenin sağ kenarının ebeveyn bileşenden 0 birim uzaklıkta olmasını sağlar.
                    anchors.leftMargin: 0   // Bileşenin sol kenarının ebeveyn bileşenden 0 birim uzaklıkta olmasını sağlar.
                    anchors.topMargin: 10   // Bileşenin üst kenarının ebeveyn bileşenden 10 birim uzaklıkta olmasını sağlar.



                    Image {
                        // Air Speed gösterge sayıların olduğu kısım
                        id: asi_case
                        anchors.fill: parent    // Resmin boyutunu ve konumunu ebeveyn bileşenin boyutlarına uyacak şekilde ayarlar.
                        source: "../../images/svg_images/ais/ais_case_v12.png"  // Resmin kaynağını belirler.
                        fillMode: Image.PreserveAspectFit   // Resmi, orijinal oranlarını koruyarak ebeveyn bileşene sığacak şekilde ölçekler.
                    }

                    Image {
                        // Air Speed gösterge içindeki çubuk
                        id: asi_hand
                        anchors.fill: parent // Resmin boyutunu ve konumunu ebeveyn bileşenin boyutlarına uyacak şekilde ayarlar.
                        source: "../../images/svg_images/ais/ais_hand_v4.png" // Resmin kaynağını belirler.
                        rotation: 0 // Resmin döndürme açısını belirler (burada 0 derece).
                        fillMode: Image.PreserveAspectFit // Resmi, orijinal oranlarını koruyarak ebeveyn bileşene sığacak şekilde ölçekler.

                    }

                    Text {
                        // Hızın yazı ile yazdığı kısım
                        id: asi_text
                        x: 157 // Metnin yatay pozisyonunu belirler.
                        y: 256 // Metnin dikey pozisyonunu belirler.
                        width: 67 // Metnin genişliğini belirler.
                        height: 28 // Metnin yüksekliğini belirler.
                        color: "#000000" // Metin rengini belirler (siyah).
                        text: qsTr("0") // Metin içeriğini belirler ve çeviri için işaretli.
                        font.pixelSize: 20 // Metnin piksel boyutunu belirler.
                        horizontalAlignment: Text.AlignHCenter // Metnin yatay hizalamasını ortalar.
                        verticalAlignment: Text.AlignVCenter // Metnin dikey hizalamasını ortalar.
                        font.bold: true // Metni kalın yapar.
                        minimumPixelSize: 12 // Metnin en küçük piksel boyutunu belirler.
                        font.weight: Font.Black // Metnin kalınlığını belirler (koyu).
                        font.family: "Arial" // Metnin kullanacağı font ailesini belirler.
                    }


                }


            }

            Rectangle {
                // Attidude gösterge arka planı
                id: attitude_direction
                width: 385
                height: 360
                radius: 40
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#999999"    // Gradyan üst kısmı
                    }

                    GradientStop {
                        position: 1
                        color: "#0D0D0D"    // Gradyan alt kısmı
                    }
                }

                Rectangle {
                    id: indicator_area1
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 15
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 15



                    Image {
                        id: adi_back
                        anchors.fill: parent
                        source: "../../images/svg_images/adi/adi_back_v8.png"
                        fillMode: Image.PreserveAspectFit
                    }



                    Rectangle {
                        id: rectangle
                        width: 320
                        height: 320
                        color: "#00000000"
                        anchors.verticalCenter: parent.verticalCenter
                        clip: true
                        anchors.horizontalCenter: parent.horizontalCenter

                        Image {

                            // Attitude orta kısım
                            id: adi_inner
                            x: 0
                            y: 0
                            width: 320
                            height: 320
                            opacity: 0.9
                            anchors.verticalCenter: parent.verticalCenter
                            source: "../../images/svg_images/adi/adi_face_big_v7.png"
                            anchors.verticalCenterOffset: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                            // degisecek deger
                            fillMode: Image.PreserveAspectFit
                        }
                    }

                    Image {
                        // Attitude dış çizgi kısmı
                        id: adi_outer
                        anchors.fill: parent
                        source: "../../images/svg_images/adi/adi_ring_v6.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        //Attitude orta çizgi çubuğu
                        id: adi_case
                        anchors.fill: parent
                        source: "../../images/svg_images/adi/adi_case_v15.png"
                        clip: true
                        fillMode: Image.PreserveAspectFit
                    }





                }
            }

            Rectangle {
                // Altimeter gösterge arka planı
                id: altimeter
                width: 385
                height: 360
                radius: 40
                border.width: 0
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#999999" // Gradyan üst kısım
                    }

                    GradientStop {
                        position: 1
                        color: "#0D0D0D" // Gradyan alt kısım
                    }
                }

                Rectangle {
                    id: indicator_area2
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    anchors.rightMargin: 0
                    anchors.topMargin: 15
                    anchors.leftMargin: 0

                    Image {
                        // Altimeter gösterge iç rengi
                        id: bg_circle2
                        x: -812
                        y: 381
                        width: 315
                        height: 322
                        anchors.verticalCenter: parent.verticalCenter
                        source: "../../images/svg_images/bg_circle1.png"
                        anchors.horizontalCenter: parent.horizontalCenter
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        // Altimeter gösterge dış sayıların olduğu kısım
                        id: alt_case
                        anchors.fill: parent
                        source: "../../images/svg_images/alt/alt_case_v4.png"
                        fillMode: Image.PreserveAspectFit
                    }


                    Text {
                        // M'nin sayı ile yazılan kısmı
                        id: alt_text
                        x: 171
                        y: 235
                        width: 65
                        height: 28
                        text: qsTr("0")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Black
                        font.family: "Arial"
                        anchors.verticalCenterOffset: 80
                        anchors.horizontalCenterOffset: -1
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    // Altimeter Speed gösterge içindeki çubuk

                    Image {
                        id: alt_needle_mini
                        anchors.fill: parent
                        source: "../../images/svg_images/alt/alt_hand_v3.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Rectangle {
                // Turn coordinator gösterge arka plan rengi
                id: turn_coordinator
                width: 385
                height: 360
                radius: 40
                border.width: 0
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#999999"
                    }

                    GradientStop {
                        position: 1
                        color: "#0D0D0D"
                    }
                }

                Rectangle {
                    id: indicator_area3
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 15



                    Image {
                        // Turn coordinatör gösterge iç rengi
                        id: bg_circle1
                        x: 44
                        y: -364
                        width: 385
                        height: 330
                        anchors.verticalCenter: parent.verticalCenter
                        source: "../../images/svg_images/bg_circle.png"
                        anchors.horizontalCenter: parent.horizontalCenter
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        // Turn coordinatör gösterge içindeki iha resmi
                        id: tc_plane
                        anchors.fill: parent
                        source: "../../images/svg_images/tc/iharesim1.png"
                        rotation: 0
                        fillMode: Image.PreserveAspectFit
                    }
                    Image {
                        // Turn coordinatör gösterge R-L, çizgilerin olduğu kısım 
                        id: tc_case
                        anchors.fill: parent
                        source: "../../images/svg_images/tc/tc_case_v3.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        // Turn coordinatör göstergede nokta olan kısım
                        id: tc_ball
                        y: 58
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../../images/svg_images/tc/tc_ball_v2.png"
                        anchors.horizontalCenterOffset: 0  // degisecek deger
                        anchors.horizontalCenter: parent.horizontalCenter
                        // degisecek parametre
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        // L & R kısmındaki çubuk çizgileri
                        id: tc_cubuk
                        anchors.fill: parent
                        source: "../../images/svg_images/tc/tc_face_v3.png"
                        fillMode: Image.PreserveAspectFit
                    }

                }
            }

            Rectangle {
                // Horizontal situation gösterge arka plan rengi
                id: horizontal_situation
                width: 385
                height: 360
                radius: 40
                border.width: 0
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#999999" // Gradyan üst kısım
                    }

                    GradientStop {
                        position: 1
                        color: "#0D0D0D"    //Gradyan alt kısım
                    }
                }

                Rectangle {
                    id: indicator_area4
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    anchors.rightMargin: 0
                    anchors.topMargin: 15
                    anchors.leftMargin: 0



                    Image {
                        // Horizontal situation sayılar ve dış çizgiler
                        id: hsi_face
                        anchors.fill: parent
                        source: "../../images/svg_images/hsi/hsi_face_v5.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        // Horizontal situation sayılar gösterge içi resim
                        id: hsi_case
                        anchors.fill: parent
                        source: "../../images/svg_images/hsi/iharesim2.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        // Horizontal situation görsel dış yuvarlak
                        id: hsi_cover
                        anchors.fill: parent
                        source: "../../images/svg_images/hsi/hsi_case_v3.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Rectangle {
                // Vertical Speed gösterge arka plan rengi
                id: vertical_speed_indicator_area
                width: 385
                height: 360
                radius: 40
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#999999"
                    }

                    GradientStop {
                        position: 1
                        color: "#0D0D0D"
                    }
                }

                Rectangle {
                    id: indicator_area5
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 15

                    Image {
                        // Vertical Speed iç rengi
                        id: bg_circle3
                        x: -812
                        y: 0
                        width: 385
                        height: 330
                        anchors.verticalCenter: parent.verticalCenter
                        source: "../../images/svg_images/bg_circle.png"
                        anchors.horizontalCenter: parent.horizontalCenter
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        // Vertical Speed sayılar ve dış çerçeve
                        id: vsi_case
                        anchors.fill: parent
                        source: "../../images/svg_images/vsi/vsi_case_v3.png"
                        fillMode: Image.PreserveAspectFit
                    }


                    Text {
                        // M'nin sayı ile yazılan kısmı
                        id: vsi_text
                        x: 159
                        y: -150
                        width: 65
                        height: 26
                        text: qsTr("0")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.verticalCenterOffset: 93
                        font.weight: Font.Black
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.horizontalCenterOffset: 0
                        font.family: "Arial"
                    }

                    Image {
                        // Vertical Speed gösterge içindeki çubuk
                        id: vsi_hand
                        anchors.fill: parent
                        source: "../../images/svg_images/vsi/vsi_hand_v3.png"
                        rotation: 0
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
        }

        Rectangle {
            // En alt arm vs değerlerin olduğu yerin arka planı
            id: bottom_area
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: flow_area.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 0

            Row {
                id: row_bottom
                anchors.fill: parent
                spacing: 10
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 5

                Rectangle {
                    // arm değerinin yazdığı yerin arka plan rengi
                    id: arm_box
                    width: 100
                    height: 45
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#8B0000"
                        }

                        GradientStop {
                            position: 1
                            color: "#000000"
                        }
                    }

                    Text {
                        //arm değerinin yazdığı yerin yazı ayarları
                        id: arm_text
                        height: 50
                        color: "#FFFFFF"
                        text: qsTr("ARM")
                        anchors.fill: parent
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Medium
                        font.family: "Arial"
                    }
                }

                Rectangle {
                    // uçuş modu değerinin yazdığı yerin arka plan rengi
                    id: mode_box
                    width: 310
                    height: 45
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#8B0000"
                        }

                        GradientStop {
                            position: 1
                            color: "#000000"
                        }
                    }
                    Text {
                        //uçuş modu değerinin yazdığı yerin yazı ayarları
                        id: flight_mode_text
                        color: "#FFFFFF"
                        text: qsTr("-")
                        anchors.left: mode.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 10
                        anchors.leftMargin: 10
                        font.family: "Arial"
                        font.weight: Font.Medium
                    }

                    Text {
                        // Uçuş modu yazısının renk ayarları
                        id: mode
                        width: 97
                        color: "#FFFFFF"
                        text: qsTr("Uçuş Modu")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        anchors.topMargin: 5
                        anchors.leftMargin: 15
                        font.family: "Arial"
                        font.weight: Font.Medium
                    }

                    Text {
                        // Flight Mode yazısının renk ayarları
                        id: mode1
                        width: 97
                        color: "#FFFFFF"
                        text: qsTr("Flight Mode")
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignBottom
                        anchors.bottomMargin: 5
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }
                }

                Rectangle {
                    // Batarya değerinin yazdığı yerin arka plan rengi
                    id: battery_box
                    width: 150
                    height: 45
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#8B0000"
                        }

                        GradientStop {
                            position: 1
                            color: "#000000"
                        }
                    }
                    Text {
                        //Batarya değerinin yazdığı yerin yazı ayarları
                        id: battery_text
                        color: "#FFFFFF"
                        text: qsTr("-")
                        anchors.left: bat.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 10
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 10
                    }

                    Text {
                        //Batarya yazısının renk ayarları
                        id: bat
                        width: 67
                        color: "#FFFFFF"
                        text: qsTr("Batarya")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        anchors.topMargin: 5
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }

                    Text {
                        //Battery yazısının renk ayarları
                        id: mode2
                        x: -305
                        y: 24
                        width: 97
                        color: "#FFFFFF"
                        text: qsTr("Battery")
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignBottom
                        font.family: "Arial"
                        anchors.bottomMargin: 5
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }
                }

                Rectangle {
                    // Uydu değerinin yazdığı yerin arka plan rengi
                    id: sat_box
                    width: 120
                    height: 45
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#8B0000"
                        }

                        GradientStop {
                            position: 1
                            color: "#000000"
                        }
                    }
                    Text {
                        //Uydu değerinin yazdığı yerin yazı ayarları
                        id: sat_text
                        width: 104
                        color: "#FFFFFF"
                        text: qsTr("-")
                        anchors.left: sat.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 10
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 10
                    }

                    Text {
                        //Uydu yazısının renk ayarları
                        id: sat
                        width: 46
                        color: "#FFFFFF"
                        text: qsTr("Uydu")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        anchors.topMargin: 5
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }

                    Text {
                        //Uydu yazısının renk ayarları
                        id: mode3
                        x: -305
                        y: 24
                        width: 97
                        color: "#FFFFFF"
                        text: qsTr("Satellite")
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignBottom
                        font.family: "Arial"
                        anchors.bottomMargin: 5
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }
                }

                Rectangle {
                    // Enlem değerinin yazdığı yerin arka plan rengi
                    id: gps_lat_box
                    width: 230
                    height: 45
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#8B0000"
                        }

                        GradientStop {
                            position: 1
                            color: "#000000"
                        }
                    }
                    Text {
                        //Enlem değerinin yazdığı yerin yazı ayarları
                        id: lat
                        width: 64
                        color: "#FFFFFF"
                        text: qsTr("Enlem")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        anchors.topMargin: 5
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }

                    Text {
                        //Enlem değerinin yazdığı yerin yazı ayarları
                        id: lat_text
                        color: "#FFFFFF"
                        text: qsTr("-")
                        anchors.left: lat.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 10
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 10
                    }

                    Text {
                        //Enlem değerinin yazdığı yerin yazı ayarları
                        id: mode4
                        x: -305
                        y: 24
                        width: 97
                        color: "#FFFFFF"
                        text: qsTr("Latitude")
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignBottom
                        font.family: "Arial"
                        anchors.bottomMargin: 5
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }

                }

                Rectangle {
                    // Boylam değerinin yazdığı yerin arka plan rengi
                    id: gps_lon_box
                    width: 230
                    height: 45
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#8B0000"
                        }

                        GradientStop {
                            position: 1
                            color: "#000000"
                        }
                    }
                    Text {
                        //Boylam değerinin yazdığı yerin yazı ayarları
                        id: lon
                        width: 64
                        color: "#FFFFFF"
                        text: qsTr("Boylam")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        anchors.topMargin: 5
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }

                    Text {
                        //Boylam değerinin yazdığı yerin yazı ayarları
                        id: lon_text
                        color: "#FFFFFF"
                        text: qsTr("-")
                        anchors.left: lon.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 10
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 10
                    }

                    Text {
                        //Boylam değerinin yazdığı yerin yazı ayarları
                        id: mode5
                        x: -305
                        y: 24
                        width: 97
                        color: "#FFFFFF"
                        text: qsTr("Longitude")
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignBottom
                        font.family: "Arial"
                        anchors.bottomMargin: 5
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }

                }
            }
        }




    }

    // ARKA YUZ BAGLANTILARI

    Connections{
        target: backend

        // ALT DEGERLER ---------------------------------------------------------

        // ARM
        function onChangeArm(value){
            if(value){
                arm_text.color = "#0be881"
            }
            else if(!value){
                arm_text.color = "#ff3f34"
            }
        }

        // Ucus modu
        function onChangeFlightMode(value){
            flight_mode_text.text = value
        }

        // Uydu sayisi
        function onChangeSatNum(value){
            sat_text.text = value
        }

        // Batarya
        function onChangeBattery(value){
            battery_text.text = value
        }

        // GPS Lat
        function onChangeLat(value){
            lat_text.text = value
        }

        // GPS Lon
        function onChangeLon(value){
            lon_text.text = value
        }



        // ------------------------------------------------------------------------

        // YAW - Dronekit
        function onChangeYawValue(value){
            hsi_face.rotation = value
            // yaw_value.text = value
        }


        // PITCH - Dronekit
        function onChangePitchValue(value){
            // Attitude Direction Indicator
            adi_inner.anchors.verticalCenterOffset = value
        }

        // ROLL - Dronekit
        function onChangeRollValue(value){

            // Turn Coordinator
            tc_plane.rotation = value
            // roll_value.text = value

            // Attitude Direction Indicator
            adi_inner.rotation = value
            adi_outer.rotation = value

        }

        // TURN COORDINATOR BALL
        function onChangeTcBall(value){
            tc_ball.anchors.horizontalCenterOffset = value
        }

        // AIRSPEED VALUE - Dronekit
        function onChangeAisValue(value){
            asi_hand.rotation = value

        }
        function onChangeAisTextValue(text){
            asi_text.text = text

        }



        // HEADING - Dronekit

        function onChangeHeadingValue(value){
            hsi_face.rotation = value
            // heading_value.text = value
        }

        // ALTITUDE (ALTIMETTR) - Dronekit

        function onChangeAltitudeValue(value){
            alt_needle_mini.rotation = value
        }

        function onChangeAltText(value){
            alt_text.text = value
        }

        // VERTICAL SPEED - Dronekit

        function onChangeVerticalSpeedValue(value){
            vsi_hand.rotation = value
        }

        function onChangeVerticalSpeedText(value){
            vsi_text.text = value
        }


    }



}


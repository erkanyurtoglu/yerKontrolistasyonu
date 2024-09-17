import QtQuick 2.15 // QtQuick modülü, QML dilinde temel öğeleri ve özellikleri sağlar.
import QtQuick.Window 2.15 // QtQuick.Window modülü, pencere oluşturma ve yönetme işlevlerini sağlar.
import QtQuick.Controls 2.15  // QtQuick.Controls modülü, kullanıcı arabirimi bileşenlerini oluşturmayı ve özelleştirmeyi sağlar.
import QtGraphicalEffects 1.15  // QtGraphicalEffects modülü, grafik efektleri ve görsel işlemleri sağlar.
import QtQuick.Dialogs 1.3  // QtQuick.Dialogs modülü, standart iletişim kutuları ve diğer kullanıcı arayüzü bileşenlerini sağlar.
import "controls"  // "controls" adlı özel bir klasörden QML bileşenlerini içe aktarır.

Window {
    id: mainWindow //Dış büyük pencere
    width: 1350  // Pencerenin varsayılan genişliği.
    height: 1025  // Pencerenin varsayılan yüksekliği.
    minimumWidth: 1000  // Pencerenin minimum genişliği.
    minimumHeight: 680  // Pencerenin minimum yüksekliği.
    visible: true   // Pencerenin görünürlüğü.
    color: "#00000000"  // Pencerenin arka plan rengi.
    title: qsTr("Appa Dashboard v1")  // Pencerenin başlığı. qsTr, yerelleştirilmiş metin işlevidir.

    // Windows pencere cubugu kaldirma
    flags: Qt.Window | Qt.FramelessWindowHint

    // Propeties
    property int windowStatus: 0
    property int windowMargin: 10

    // Internal functions
    QtObject{
        id: internal

        function resetResizeBorders(){ // Yeniden boyutlandırma işaretlerinin görünürlüğü yeniden etkinleştirilir.
            resizeLeft.visible = true    // Sol yeniden boyutlandırma işareti görünür hale getirilir.
            resizeRight.visible = true   // Sağ yeniden boyutlandırma işareti görünür hale getirilir.
            resizeBottom.visible = true  // Alt yeniden boyutlandırma işareti görünür hale getirilir.
            resizeWindow.visible = true  // Köşeden yeniden boyutlandırma işareti görünür hale getirilir.
        }

        // Aşağıdaki fonksiyon, pencerenin durumuna bağlı olarak maksimuma veya normal boyuta getirilmesini sağlar.
        function maximizeRestore(){

            if (windowStatus == 0){
                // Pencere maksimum boyuta getirilir
                mainWindow.showMaximized()
                // Pencere durumu güncellenir
                windowStatus = 1
                // Pencere kenar boşlukları sıfırlanır
                windowMargin = 0
                // Yeniden boyutlandırma işaretlerinin görünürlüğü kapatılır
                resizeLeft.visible = false     // Sol yeniden boyutlandırma işareti gizlenir
                resizeRight.visible = false    // Sağ yeniden boyutlandırma işareti gizlenir
                resizeBottom.visible = false   // Alt yeniden boyutlandırma işareti gizlenir
                resizeWindow.visible = false   // Köşeden yeniden boyutlandırma işareti gizlenir
                // Maksimize/Normal boyut değiştirme düğmesinin ikonu yeniden boyutlandırma işaretine dönüştürülür
                buttonMaxRes.btnIconSource = "../images/svg_images/restore_icon.svg"
            } 
            
            else {
                // Pencere normal boyuta getirilir
                mainWindow.showNormal()
                // Pencere durumu güncellenir
                windowStatus = 0
                // Pencere kenar boşlukları yeniden ayarlanır
                windowMargin = 10
                // Yeniden boyutlandırma işaretlerinin görünürlüğü etkinleştirilir
                internal.resetResizeBorders()
                // Maksimize/Normal boyut değiştirme düğmesinin ikonu maksimize işaretine dönüştürülür
                buttonMaxRes.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }


        // Aşağıdaki fonksiyon, pencerenin maksimize edilmiş olup olmadığını kontrol eder.
        // Eğer pencere maksimize edilmişse, pencereyi normal boyuta getirir ve yeniden boyutlandırma işaretlerini görünür yapar.
        function ifMaximizedWindowRestore() {
            if (windowStatus == 1) {  // Eğer pencere maksimize edilmişse
                mainWindow.showNormal()  // Pencereyi normal boyuta getirir.
                windowStatus = 0  // Pencere durumunu (maksimize edilmiş değil) günceller.
                windowMargin = 10  // Pencerenin kenar boşluklarını yeniden ayarlar.
                // Yeniden boyutlandırma işaretlerini görünür yapar.
                internal.resetResizeBorders()
                // Maksimize/geri yükle butonunun simgesini değiştirir.
                buttonMaxRes.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        // Aşağıdaki fonksiyon, pencerenin kenar boşluklarını ve yeniden boyutlandırma işaretlerini yeniden ayarlar.
        function restoreMargins() {
            windowStatus = 0  // Pencere durumunu (maksimize edilmiş değil) günceller.
            windowMargin = 10  // Pencerenin kenar boşluklarını yeniden ayarlar.
            // Yeniden boyutlandırma işaretlerini görünür yapar.
            internal.resetResizeBorders()
            // Maksimize/geri yükle butonunun simgesini değiştirir.
            buttonMaxRes.btnIconSource = "../images/svg_images/maximize_icon.svg"
        }
    }    




    Rectangle {
        id: bg  
        color: "#485460"  // Arkaplan rengi, gri tonlarına yakın bir mavi olarak ayarlanır.
        radius: 0  // Köşe yuvarlama yarıçapı, 0 olduğu için dikdörtgenin köşeleri keskindir.
        border.color: "#1e272e"  // Dış çerçeve Kenarlık rengi, koyu bir mavi tonu olarak ayarlanır.
        border.width: 2  // Kenarlık kalınlığı, 2 birim olarak ayarlanır.
        anchors.fill: parent  // Öğenin tamamı ebeveynine (genellikle bir başka öğe) göre boyutlandırılır.
        anchors.rightMargin: windowMargin  // Sağ kenar boşluğu, windowMargin değişkenine bağlı olarak ayarlanır.
        anchors.leftMargin: windowMargin  // Sol kenar boşluğu, windowMargin değişkenine bağlı olarak ayarlanır.
        anchors.bottomMargin: windowMargin  // Alt kenar boşluğu, windowMargin değişkenine bağlı olarak ayarlanır.
        anchors.topMargin: windowMargin  // Üst kenar boşluğu, windowMargin değişkenine bağlı olarak ayarlanır.
        
        z: 1  // Yığın içindeki düzen sırasını belirler. Z değeri büyük olan öğeler, z değeri küçük olanların üstünde görünür.

        Rectangle {  // Dikdörtgen oluşturur
            id: appContainer // Öğenin benzersiz tanımlayıcısı
            color: "#00000000" // Arka plan rengini belirler (şeffaf)
            radius: 0 // Köşelerin yuvarlaklığını belirler (köşeler düz)
            border.color: "#00000000" // Kenarlık rengini belirler (şeffaf)
            border.width: 0 // Kenarlık kalınlığını belirler (sıfır)
            anchors.fill: parent // Öğeyi, ebeveyninin tamamını kaplayacak şekilde yerleştirir
            anchors.rightMargin: 1 // Sağ marjı 1 birim olarak ayarlar
            anchors.leftMargin: 1 // Sol marjı 1 birim olarak ayarlar
            anchors.bottomMargin: 1 // Alt marjı 1 birim olarak ayarlar
            anchors.topMargin: 1 // Üst marjı 1 birim olarak ayarlar

            Rectangle {// Üst kenar çubuğu logonun geleceği yer
                id: topBar 
                height: 150 
                color: "black" // Arka plan rengini belirler (şeffaf)
                anchors.left: leftBar.right // Sol kenarını, sol kenardaki diğer bir öğenin sağ kenarına hizalar
                anchors.right: parent.right // Sağ kenarını ebeveyninin sağ kenarına hizalar
                anchors.top: parent.top // Üst kenarını ebeveyninin üst kenarına hizalar
                anchors.rightMargin: 0 // Sağ kenarının marjını ayarlar
                anchors.leftMargin: 0 // Sol kenarının marjını ayarlar
                anchors.topMargin: 0 // Üst kenarının marjını ayarla

                Rectangle { // Üst kenar çubuğu Alaz yazısı yeri
                    id: titleBar 
                    height: 110
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
                    border.color: "#00000000" // Kenarlık rengini belirler (şeffaf)
                    anchors.left: parent.left // Sol kenarını ebeveyninin sol kenarına hizalar
                    anchors.right: parent.right // Sağ kenarını ebeveyninin sağ kenarına hizalar
                    anchors.top: parent.top // Üst kenarını ebeveyninin üst kenarına hizalar
                    anchors.rightMargin: 0 // Sağ kenarının marjını ayarlar

                    DragHandler { // Sürükleme işleyicisi oluşturur
                        onActiveChanged: { // Etkinlik değiştiğinde
                            if (active) { // Etkinse
                                mainWindow.startSystemMove() // Pencereyi sürükleme işlemini başlatır
                                internal.ifMaximizedWindowRestore() // Pencereyi maksimum boyutta ise eski boyutuna döndürür
                            }
                        }
                    }


                    Label { // Metin etiketi oluşturur
                        id: lableTitle // Öğenin benzersiz tanımlayıcısı
                        color: "white" // Metin rengini ayarlar
                        text: qsTr("Alaz Takımı İHA Uçuş Arayüzü - Flight Dashboard") // Metin içeriğini ayarlar
                        anchors.left: parent.left // Sol kenarını ebeveyninin sol kenarına hizalar
                        anchors.top: parent.top // Üst kenarını ebeveyninin üst kenarına hizalar
                        anchors.bottom: parent.bottom // Alt kenarını ebeveyninin alt kenarına hizalar
                        verticalAlignment: Text.AlignVCenter // Dikey hizalamayı ortalar
                        font.bold: true // Kalın yazı tipi kullanır
                        font.pointSize: 15 // Yazı tipi boyutunu ayarlar
                        font.family: "Arial" // Yazı tipi ailesini ayarlar
                        anchors.leftMargin: 10 // Sol kenarının marjını ayarlar
                    }



                }

                Row {   // Yatay düzen oluşturur
                    id: rowButtons
                    x: 710  // Yatay pozisyonunu ayarlar
                    width: 518  // Genişliğini ayarlar
                    height: 35  // Yüksekliğini ayarlar
                    anchors.right: parent.right  // Sağ kenarını ebeveyninin sağ kenarına hizalar
                    anchors.top: parent.top   // Üst kenarını ebeveyninin üst kenarına hizalar
                    layoutDirection: Qt.RightToLeft  // Yerleşim yönünü sağdan sola doğru ayarlar
                    anchors.rightMargin: 0  // Sağ kenarının marjını ayarlar
                    anchors.topMargin: 0   // Üst kenarının marjını ayarlar

                    
                    TopBarButton {
                        id: buttonClose // Ekranı Kapatma Tuşu
                        btnColorDefault: "#272935"  //Tuş rengi
                        btnColorMouseOver: "#181e34"    //Fare tuşun üzerinde rengi
                        btnColorClicked: "#f53b57"  //Tuş basıldığında rengi
                        btnIconSource: "../images/svg_images/close_icon.svg"    //Tuş resmi

                        onClicked: mainWindow.close()   //Tuşa basıldığında pencereyi kapat
                    }
                    
                    
                    TopBarButton {
                        id: buttonMaxRes    // Ekranı Büyütme-Küçültme Tuşu
                        btnColorDefault: "#272935"  //Tuş rengi
                        btnColorMouseOver: "#181e34"    //Fare tuşun üzerinde rengi
                        btnColorClicked: "#0fbcf9"  //Tuş basıldığında rengi
                        btnIconSource: "../images/svg_images/maximize_icon.svg"   //Tuş resmi
                        onClicked: internal.maximizeRestore()   //Tuşa basıldığında pencereyi büyüt
                    }

                    
                    TopBarButton {
                        id: buttonMinimize  //Ekranı Aşağı İndirme Tuşu
                        btnColorDefault: "#272935"  //Tuş rengi
                        btnColorMouseOver: "#181e34"    //Fare tuşun üzerinde rengi
                        btnColorClicked: "#0fbcf9"  //Tuş basıldığında rengi
                        btnIconSource: "../images/svg_images/minimize_icon.svg"   //Tuş resmi

                        onClicked: {
                            mainWindow.showMinimized()  // Pencereyi aşağıya küçültür
                            internal.restoreMargins()   // Pencereyi eski haline getirir
                        }
                    }



                    CustomButton {
                        id: buttonConnect   // Bağlantı yapma butonudur.
                        width: 180  // Buton genişliği
                        height: 35  // Buton yükseklği
                        text: "BAĞLAN"  // Buton yazısı
                        colorDefault: "#FF0000"  //Buton rengi
                        font.letterSpacing: 1.5  //Buton yazı karakter boyutu
                        colorPressed: "#98374e"  //Butona basıldığında rengi
                        colorMouseOver: "#d44d6d"  //Fare butonun üzerinde rengi
                        font.italic: false  //Buton yazısı italik ya da normal olarak ayarlar
                        font.weight: Font.Medium   //yazı tipinin kalınlığını belirler
                        font.bold: true   //Metin kalınlığına izin verir
                        font.pointSize: 10   //Font boyutunu ayarlar
                        font.family: "Arial"   //Metnin yazı tipini belirler

                        onClicked: {
                            backend.getComPort(cb_com.displayText)   //Backend isimli bir nesnenin getComPort fonksiyonunu çağırır.
                            backend.getBaudRate(cb_baud.displayText)    //Backend isimli bir nesnenin getBaudRate fonksiyonunu çağırır.

                        }
                    }


                    ComboBoxBaud {
                        id: cb_baud //veri iletim hızı ComboBox
                        width: 100  //ComboBox genişliği
                        height: 35  //ComboBox yüksekliği
                        colorDefault: "#666666"  //veri iletim hızı ComboBox rengi
                        colorPressed: "black"  //veri iletim hızı ComboBox tuşa basıldığında rengi
                        colorMouseOver: "white"   //veri iletim hızı ComboBox fare üzerinde rengi
                         
                    }

                    ComboBoxComPort {
                        id: cb_com  // COM port ComboBox
                        height: 35  //ComboBox yüksekliği
                        colorDefault: "black"  //COM port ComboBox rengi
                        colorPressed: "#2f323d" //COM port ComboBox tuşa basıldığında rengi
                        colorMouseOver: "white"  //COM port ComboBox fare üzerinde rengi
                        

                    }
                    AnimatedImage {
                        id: loadingConnect //Bağlantı yükleme dairesi
                        width: 20
                        height: 20
                        visible: false
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: cb_com.left
                        source: "../images/loading.gif"
                        anchors.rightMargin: 10
                    }

                }

             

            }



            Rectangle {
                id: leftBar // Sol kenar çubuğu
                x: 0
                y: 60
                width: 50
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
                anchors.left: parent.left   // Öğe, ebeveyninin sol kenarına hizalanır.
                anchors.top: parent.top   // Öğe, ebeveyninin üst kenarına hizalanır.
                anchors.bottom: parent.bottom   // Öğe, ebeveyninin alt kenarına hizalanır.
                anchors.bottomMargin: 0   // Alt kenarın marjı, 0 birim olarak ayarlanır.
                anchors.topMargin: 0    // Üst kenarın marjı, 0 birim olarak ayarlanır.
                anchors.leftMargin: 0   // Sol kenarın marjı, 0 birim olarak ayarlanır.

                Column {
                    id: columnMenu
                    anchors.fill: parent    // Öğe, ebeveyninin tamamını doldurur.
                    anchors.bottomMargin: 30    // Alt kenarın marjı, 30 birim olarak ayarlanır.
                    anchors.topMargin: 60   // Üst kenarın marjı, 60 birim olarak ayarlanır.

                    LeftMenuBtn {
                        id: buttonHome  // Sol kenar çubuğu ev simgesi butonu
                        btnColorMouseOver: "#999999"  // Fare üzerine geldiğinde arka plan rengi.
                        activeMenuColor: "#FFFFFF"  // Aktif menü rengi.
                        btnColorDefault: "black"  // Butonun varsayılan arka plan rengi.
                        activeMenuColorRight: "#FFFFFF"  // Aktif menü rengi (sağ kenar).
                        iconWidth: 16  // Simge genişliği.
                        iconHeight: 16  // Simge yüksekliği.
                        btnIconSource: "../images/svg_images/home_icon.svg"  // Butonun simgesinin dosya yolu.
                        isActiveMenu: true  // Butonun etkin menü olup olmadığını belirleyen bir bayrak.
                        onClicked: {  // Butona tıklandığında yapılacak işlev.
                            buttonHome.isActiveMenu = true  // Butonun etkin menü olduğunu işaretleyin.
                            buttonSettings.isActiveMenu = false  // Ayarlar düğmesinin etkin menü olmadığını işaretleyin.
                            stackView.push(Qt.resolvedUrl("pages/homePage.qml"))  // Yığın görünümüne bir sayfa ekleyin.

                        }
                    }

                    LeftMenuBtn {
                        id: buttonSettings //Sol kenar çubuğu ayarlar simgesi butonu
                        btnColorMouseOver: "#999999" // Fare üzerine geldiğinde arka plan rengi
                        activeMenuColor: "#FFFFFF" // Aktif menü rengi sol kenar
                        btnColorDefault: "black" // Düğmenin varsayılan arka plan rengi
                        activeMenuColorRight: "#FFFFFF" // Aktif menü rengi (sağ kenar)
                        iconWidth: 16 // Simge genişliği
                        btnIconSource: "../images/svg_images/settings_icon.svg" // Düğmenin simgesinin dosya yolu
                        iconHeight: 16 // Simge yüksekliği
                        // Butona tıklandığında yapılacak işlev
                        onClicked: {
                            buttonHome.isActiveMenu = false // Ana sayfa düğmesinin etkin menü olmadığını işaretleyin
                            buttonSettings.isActiveMenu = true // Ayarlar düğmesinin etkin menü olduğunu işaretleyin
                            stackView.push(Qt.resolvedUrl("pages/settingsPage.qml")) // Yığın görünümüne bir sayfa ekleyin
                        }
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000" // Arka plan rengi (şeffaf)
                border.color: "#00000000" // Kenarlık rengi (şeffaf)
                anchors.left: leftBar.right // Sol kenarı sol çubuğa bağlar
                anchors.right: parent.right // Sağ kenarı ebeveynin sağ kenarına bağlar
                anchors.top: topBar.bottom // Üst kenarı üst çubuğa bağlar
                anchors.bottom: parent.bottom // Alt kenarı ebeveynin alt kenarına bağlar
                clip: true // İçeriği sınırlar
                anchors.leftMargin: 0 // Sol kenar boşluğu
                anchors.topMargin: 0 // Üst kenar boşluğu

                StackView { // Yığın görünümü öğesi
                    id: stackView // Yığın görünümünün benzersiz tanımlayıcısı
                    anchors.fill: parent // Yığın görünümünü içeriğin boyutuna bağlar
                    initialItem: Qt.resolvedUrl("pages/homePage.qml") // İlk öğe olarak ev sayfasını yükle
                }
            }


        }
    }

    DropShadow { // Pencere dışın DropShadow (gölge) efekti
        anchors.fill: bg // Efektin boyutu bg öğesinin boyutuna bağlanır
        horizontalOffset: 0 // Yatay ofset (x ekseni) değeri
        verticalOffset: 0 // Dikey ofset (y ekseni) değeri
        radius: 10 // Gölge efektinin yumuşaklık yarıçapı
        samples: 16 // Gölge efektinin örnek sayısı
        color: "#80000000" // Gölge rengi, 0.5 opaklıkta koyu gri
        source: bg // Gölgeyi oluşturmak için kullanılan kaynak öğesi
        z: 0 // Öğenin z konumu (yerleştirme derinliği)
    }

    MouseArea { // Fare etkileşimlerini algılamak için kullanılan bir alan
        id: resizeLeft // Öğenin benzersiz tanımlayıcısı
        width: 10 // Alanın genişliği
        anchors.left: parent.left // Alanı, ebeveyninin sol kenarına hizalar
        anchors.top: parent.top // Alanı, ebeveyninin üst kenarına hizalar
        anchors.bottom: parent.bottom // Alanı, ebeveyninin alt kenarına hizalar
        anchors.leftMargin: 0 // Sol kenarın marjı
        anchors.bottomMargin: 10 // Alt kenarın marjı
        anchors.topMargin: 10 // Üst kenarın marjı
        cursorShape: Qt.SizeHorCursor // Fare imlecinin şekli, yatay boyutlandırma için ayarlanmış

        DragHandler { // Sürükleme işlemi için kullanılan bir işleyici
            target: null // Hedef öğe, burada belirtilmemiş (null)
            onActiveChanged: { // Etkinlik durumu değiştiğinde çalışacak olan işlev
                if (active) { // Eğer etkinlik aktifse
                    mainWindow.startSystemResize(Qt.LeftEdge) // Ana pencereyi sol kenardan boyutlandırmaya başlatır
                }
            }
        }
    }

    MouseArea { // Fare etkileşimlerini algılamak için kullanılan bir alan
        id: resizeRight // Öğenin benzersiz tanımlayıcısı
        width: 10 // Alanın genişliği
        anchors.right: parent.right // Alanı, ebeveyninin sağ kenarına hizalar
        anchors.top: parent.top // Alanı, ebeveyninin üst kenarına hizalar
        anchors.bottom: parent.bottom // Alanı, ebeveyninin alt kenarına hizalar
        anchors.rightMargin: 0 // Sağ kenarın marjı
        anchors.bottomMargin: 10 // Alt kenarın marjı
        anchors.topMargin: 10 // Üst kenarın marjı
        cursorShape: Qt.SizeHorCursor // Fare imlecinin şekli, yatay boyutlandırma için ayarlanmış

        DragHandler { // Sürükleme işlemi için kullanılan bir işleyici
            target: null // Hedef öğe, burada belirtilmemiş (null)
            onActiveChanged: { // Etkinlik durumu değiştiğinde çalışacak olan işlev
                if (active) { // Eğer etkinlik aktifse
                    mainWindow.startSystemResize(Qt.RightEdge) // Ana pencereyi sağ kenardan boyutlandırmaya başlatır
                }
            }
        }
    }



    MouseArea { // Fare etkileşimlerini algılamak için kullanılan bir alan
        id: resizeWindow // Alanın benzersiz tanımlayıcısı
        x: 947 // Alanın yatay konumu
        y: 640 // Alanın dikey konumu
        width: 25 // Alanın genişliği
        height: 25 // Alanın yüksekliği
        opacity: 0.5 // Alanın opaklığı
        anchors.right: parent.right // Alanı, ebeveyninin sağ kenarına hizalar
        anchors.bottom: parent.bottom // Alanı, ebeveyninin alt kenarına hizalar
        anchors.bottomMargin: 0 // Alt kenarın marjı
        anchors.rightMargin: 0 // Sağ kenarın marjı
        cursorShape: Qt.SizeFDiagCursor // Fare imlecinin şekli, sağ alt köşeden çapraz boyutlandırma için ayarlanmış

        DragHandler { // Sürükleme işlemi için kullanılan bir işleyici
            target: null // Hedef öğe, burada belirtilmemiş (null)
            onActiveChanged: { // Etkinlik durumu değiştiğinde çalışacak olan işlev
                if (active) { // Eğer etkinlik aktifse
                    mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge) // Ana pencereyi sağ alt köşeden boyutlandırmaya başlatır
                }
            }
        }
    }


    MouseArea { // Fare etkileşimlerini algılamak için kullanılan bir alan
        id: resizeBottom // Alanın benzersiz tanımlayıcısı
        height: 10 // Alanın yüksekliği
        anchors.left: parent.left // Alanı, ebeveyninin sol kenarına hizalar
        anchors.right: parent.right // Alanı, ebeveyninin sağ kenarına hizalar
        anchors.bottom: parent.bottom // Alanı, ebeveyninin alt kenarına hizalar
        anchors.rightMargin: 10 // Sağ kenarın marjı
        anchors.leftMargin: 10 // Sol kenarın marjı
        anchors.bottomMargin: 0 // Alt kenarın marjı
        cursorShape: Qt.SizeVerCursor // Fare imlecinin şekli, dikey boyutlandırma için bir dikey çift ok şekline ayarlanmış

        DragHandler { // Sürükleme işlemi için kullanılan bir işleyici
            target: null // Hedef öğe, burada belirtilmemiş (null)
            onActiveChanged: { // Etkinlik durumu değiştiğinde çalışacak olan işlev
                if (active) { // Eğer etkinlik aktifse
                    mainWindow.startSystemResize(Qt.BottomEdge) // Ana pencereyi alt kenardan boyutlandırmaya başlatır
                }
            }
        }
    }


    Connections { // Nesneler arasında sinyal-slot bağlantıları oluşturur
        target: backend // Bağlantının hedefi "backend" adlı arka planda çalışan nesne

        function onChangeConnectionButtonText(value) { // "onChangeConnectionButtonText" adında bir işlev tanımlar
            buttonConnect.text = value // Bağlı olduğu bileşenin (buttonConnect) metin özelliğini değiştirir
        }

        function onChangeConnectionButtonColor(value) { // "onChangeConnectionButtonColor" adında bir işlev tanımlar
            buttonConnect.colorDefault = value // Bağlı olduğu bileşenin (buttonConnect) varsayılan renk özelliğini değiştirir
            buttonConnect.colorMouseOver = value // Bağlı olduğu bileşenin (buttonConnect) fare üzerine geldiğindeki renk özelliğini değiştirir
            buttonConnect.colorPressed = value // Bağlı olduğu bileşenin (buttonConnect) tıklandığında renk özelliğini değiştirir
        }

        function onIsLoadingVisible(value) { // "onIsLoadingVisible" adında bir işlev tanımlar
            loadingConnect.visible = value // Bağlı olduğu bileşenin (loadingConnect) görünürlük özelliğini değiştirir
        }
    }

}





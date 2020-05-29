#!/bin/bash

##############################       BIM404 SİSTEM PROGRAMLAMA ÖDEV2    #######################################
#                                                                                                             #
#                                      HAZIRLAYAN:  MOHAMED TRAORE                                            #
#                                        ÖğrenciNO:   030117024                                               #
#                                                                                                             #
###############################################################################################################



########################      ALGORITMALAR VE FONKSIYONLARIN AÇIKLAMALARI    ##################################


#####################################      TÜRKÇE  KISMI       ################################################

##############################   FONKSİYON:  ucBasamakSayiyiCevir  ############################################
#                                                                                                             #
#           Bu fonksiyon parametre olarak aldığı üç basamaklı sayıyı yazıya çevirmektedir.                    #
#           İlk olarak alınan parametre 100'e böler ve sonucu yuzler basamağı dizisinden alarak               #
#           yazıya çevirir. Sonra aynı sayıyı 10' a böler ve sonra sonucun 10' a bölümünün                    #
#           modunu alır böylelikle onlar basamağı elde ederiz ve onlar dizisinden alınır.                     #
#           Birler basamağını bulmak için de sayının 10 bölümünün kalanını aldık (sayı%10)                    #
#           ve birler dizisinden yazı karşılığı elde ettik                                                    #
#           bb ==> birler basamak dizisi | ob ==> onlar basamak dizisi | yb ==> yuzler basamak dizisi         #
#           sonra alınan basamak yazı karşılıklarını birleştirerek uç basamaklı sayıyı çevirdik.              #
#                                                                                                             #
###############################################################################################################


####################################   FONKSİYON:  SayidanYaziya  #############################################
#                                                                                                             #
#           Bu fonksyiyon kullanıcıdan alınan sayıyı yazıya çevirmektedir.                                    #
#           Ilk olarak trilyonlar basamayı bulmak için kullanıcıdan alınan sayıyı                             #
#           bir trilyona böler ( sayı/1000000000000).Ve elde edilen sayıyı 0' dan farklı ise                  #
#           "ucBasamakSayiyiCevir" fonksiyonu ile yazıya çevirir. Sonradan yazı katarına                      #
#           "trilyon" yazısını ekler. Örnek olarak bölme sonucu 28 ise "yirmi sekiz " + "trilyon".            #
#           Eğer sonucu 0 ise devam eder ve sayıyı bir milyara böler sayı/1000000000 böylelikle               #                
#           milyar basamağı elde edilmiş olur ve yazı karşılığı tutan değişkenin sonuna "milyar "             #
#           yazısını eklemektedir. Böylece yüzler basamağına kadar bütün sayıyı yazıya çevirdik.              #
#     Not:                                                                                                    #
#           Trilyon basamağını çevirdikten sonra milyar basamağına geçmeden önce sayıdan,                     #
#           milyar basamağı çarpı bir trilyon çıkartırız ve devam ederiz.                                     #
#           Örnek: sayı= 754.140.200.001.458 ==> sayı/1000000000000 sonuc 754 ve sonucu yazıya cevirir.       #
#           milyar geçerken sayı = sayı - sonuc*1000000000000 ve  140.200.001.458 kalır. Sayımız olur.        #
#           Ve bununla devam ederiz.                                                                          #
#                                                                                                             #     
#           Her basamak(trilyon , milyar , milyon , bin ) arası  geçiş için geçerlidir.                       #
#                                                                                                             #
###############################################################################################################


####################################   FONKSİYON:  YazidanSayiya  #############################################
#                                                                                                             #
#           Bu fonksiyon kullanıcıdan alınan yazıyı sayıya çevirmektedir.                                     #  
#           Alınan yazının "for in" ile içindeki parçaları almaktadır.                                        #
#           Alınan parça( bir sayıya denk gelen yazı: bir , iki , yuz , milyon ... )                          #
#           birler , onlar , yuzler , binler 'lere karşı gelen dizilerde arar.                                #
#           Ve sayıyı bulunca birler basamağı ise daha önce gelen sayılarını tutan değişkene ekler.           #
#           Örneğin dokuz ise ve daha önceki sayı 0 ise birler basamağında bulur ve sayı=sayı+dokuz           #
#           böylece sayı=9 olur. Onlar basamak için de aynı işlem geçerli. "on" gelince sayıya 10 eklenir.    #
#           Bu işlemler esnasında sayıya eklenen son sayı bir yardımcı değişkende tutulmaktadır.              #
#           "yuz" yazısı geldiğinde önceki sayıların tutulduğu sayıdan yardımcı sayıyı(En son eklenen sayı)   #
#           çıkartır. Ve yardımcı sayıyı 100 ile çarpıp sonucu toplam sayıya ekler.                           #
#   Örnek : 1200 için                                                                                         #
#           toplam sayının şuanki değeri = 1000                                                               #
#           sonraki gelen sayı 2 ve şuanki değer 1002 oldu ve yardımcıSayı=2 oldu                             #
#           şimdi 100 geldi yani iki yuz (200) olmalı                                                         #
#           dolayısıyla  1002 - 2 yapılır ve 2*100 yapılır sonradan sayı=(1000+200) olur.                     #
#           Ama yuz gelince ve sayı değeri 0 ise demek yazı yuz ile başlar ve  sayıya 100 değeri atanır.      #
#          "bin" yazısı gelince ve toplamSayı 0 ise sayıya direkt bin atanır. Yani bütün sayı bin ile başlar. #
#           Aksi taktirde toplamSayı 1000 ile çarpılır ve binler basamağı tutan sayı sayıBin değişkenine      #
#           atanır. sayıBin=sayı*1000 olur böylece binler basamağı elde etmiş oluruz.                         #
#           Ve sonradan bir sonraki işlemler içintoplam sayıyı tutan değişken sıfırlanır.                     #
#          "milyon" yazısı gelince toplam sayıyı milyon (1000000) ile çarpılır. sayıMilyon=sayı*1000000       #
#           ve sayı=0 yapılır. Böylece milyon basamağı de elde etmiş oluruz.                                  #
#           Aynı işlem "milyar" , "trilyon" için de geçerlidir.                                               #
#           Bütün işlemlerin sonunda  sonuc= sayiTrilyon + sayiMilyar+ sayiMilyon + sayiBin                   #
#           işlemiyle toplam sayıyı elde ederiz.                                                              #
#           Bütün bu işlemler boyunca hataKontrol diye bir değişken tanımlıdır ve her bir yazı çeviriminde    #
#           bir artırılır. Yazı çevrilemediği ise işlemin sonunda hataKontrol değişkeninin değeri   sıfır 0   #
#           olur  ve yazının hatalı yazı demektir. Ardından  kullanıcıya hata mesajını gösterek               #
#           hangi yazı hatalı olduğunu gösterir.                                                              #
#                                                                                                             #
###############################################################################################################


#####################################     İNGLİZCE  KISMI      ################################################
#                                                                                                             #
#           FONKSİYON: threeStepNumber          ==>       TÜRKÇE  ucBasamakSayiyiCevir                        #
#           FONKSİYON: numberToWord             ==>       TÜRKÇE  SayidanYaziya                               #
#           FONKSİYON: wordToNumber             ==>       TÜRKÇE  YazidanSayiya                               #
#                                                                                                             #
#           Bu programda Türkçe işlemler ile İnglizce işlemlerinin mantığı ve algoritması aynı                #
#           olduğu için sadece Türkçe kısmı anlatılmıştır. Her satıra yorum eklenmiştir. İnglizce de dahil.   #
#                                                                                                             #
############################################################################################################### 


####################################    PROGRAM:  ANA PROGRAM     #############################################
#                                                                                                             #
#           Bu program Türkçe ve İnglizce olmak üzere 2 dilde çalımaktadır.                                   #
#           Program ilk çalıştırıldığında dil sorgusu gösterilmektedir. Ve kullanıcı istediği                 #
#           dili seçerek işleme devam eder. Yanlış Seçimi durumunda program tekrardan seçenek                 #
#           girilmesi istenmektedir.                                                                          #
#           Program, yukarıda açıklanan Fonksiyonları kullanarak 4 tane işlev yerine getirmektedir.           #
#           Dil seçildikten sonra İşlem menüsü gösterilmektedir ve kullanıcı yapmak istediği işlemi seçer.    #
#           1: Sayıyı yazıya çevirme işlemi                                                                   #
#              Kullanıcıdan bir sayı istenecektir. Kullanıcı hatalı sayıyı girdiğinde hata mesajı             #
#              almlaktadır. Aksi taktirde girilen sayının yazı karşılığını göstermektedir                     #
#           2: Yazıyı sayıya çevirme                                                                          #
#              Kullanıcıdan bir yazı istenecektir. Hatalı yazı girildiğinde kullanıcı hata mesajını           #
#              almaktadır ve hatalı yazıyı göstermektedir. Ve yeniden denemesini isteyecektir.                #
#              Aksi taktirde girilen yazının sayı karşılığı gösterilmektedir.                                 #
#           3: Yazı ile işlem                                                                                 #
#              Bu şıkta kullanıcı Toplam ve Çıkarma işlemlerini yapabilmektedir                               #
#              Kullanıcı istediği işlemi seçer ve operandları istendiği gibi girerse                          # 
#              işlem sonucunu hem sayı olarak hem de ya<ı olarak almaktadır.                                  #  
#              Hatalı girdiler girildiğinde kullanıcı hata mesajını almakta ve nerede hata olduğu             #
#              gösterilmekte ve kullanıcıdan yeniden değer girmesi istenecektir.                              #
#           Her işlemin sonunda kullanıcıdan işleme devam etmek isteyip istemediği sorulmaktadır              #
#                                                                                                             #
###############################################################################################################







declare -a bb=("" "bir " "iki " "uc " "dort " "bes " "alti " "yedi " "sekiz " "dokuz ") #Türkçe bölümünde üç basamaklı sayıyı  yazıya çevirmek için kullanılacak birler basamağı değerleri
declare -a ob=("" "on " "yirmi " "otuz " "kirk " "elli " "altmis " "yetmis " "seksen " "doksan ") #Türkçe bölümünde üç basamaklı sayıyı yazıya çevirmek için kullanılacak onlar basamağı değerleri
declare -a yb=("" "yuz " "iki yuz " "uc yuz " "dort yuz " "bes yuz " "alti yuz " "yedi yuz " "sekiz yuz " "dokuz yuz ") #Türkçe bölümünde üç basamaklı sayıyı  yazıya çevirmek için kullanılacak yüzler basamağı değerleri
declare -a bd=("" "bin " "milyon " "milyar " "trilyon ") #Türkçe sayıdan yazıya çevirmek için kullanılacak büyük basamak değerleri

declare -a birlerb=("" "bir" "iki" "uc" "dort" "bes" "alti" "yedi" "sekiz" "dokuz") #Türkçe bölümünde yazıdan sayıya çevirmek için kullanılacak birler basamağı değerleri (kullanıcıdan beklenen değerler)
declare -a onlarb=("" "on" "yirmi" "otuz" "kirk" "elli" "altmis" "yetmis" "seksen" "doksan") #Türkçe bölümünde yazıdan sayıya çevirmek için kullanılacak onlar basamağı değerleri (kullanıcıdan beklenen değerler)

declare -a bbEn=("" "one " "two " "three " "four " "five " "six " "seven " "eight " "nine ") #İngilizce bölümünde üç basamaklı sayıyı  yazıya çevirmek için kullanılacak birler basamağı değerleri
declare -a oObEn=("" "eleven " "twelve " "thirteen " "fourteen " "fifteen " "sixteen " "seventeen " "eighteen " "nineteen ") #İngilizce bölümünde üç basamaklı sayıyı  yazıya çevirmek için kullanılacak 10 ile 20 arasındaki sayılar
declare -a obEn=("" "ten " "twenty " "thirty " "forty " "fifty " "sixty " "seventy " "eighty " "ninety ") #İngilizce bölümünde üç basamaklı sayıyı  yazıya çevirmek için kullanılacak onlar basamağı değerleri
declare -a ybEn=("" "one hundred " "two hundred " "three hundred " "four hundred " "five hundred " "six hundred " "seven hundred " "eight hundred " "nine hundred ") #İngilizce bölümünde üç basamaklı sayıyı  yazıya çevirmek için kullanılacak yüzler basamağı değerleri
declare -a bdEn=("" "thousand " "million " "billion " "trillion ") #İngilizce bölümünde  sayıyı  yazıya çevirmek için kullanılacak büyük basamağı değerleri

declare -a birlerbEn=("" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine") #İngilizce bölümünde  yazıyı  sayıya çevirmek için kullanılacak birler basamağı değerleri(kullanıcıdan beklenen değerler)
declare -a oobEn=("" "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "seventeen" "eighteen" "nineteen") #İngilizce bölümünde  yazıyı  sayıya çevirmek için kullanılacak 10 ile 20 arasındaki değerler(kullanıcıdan beklenen değerler)
declare -a onlarbEn=("" "ten" "twenty" "thirty" "forty" "fifty" "sixty" "seventy" "eighty" "ninety") #İngilizce bölümünde  yazıyı  sayıya çevirmek için kullanılacak onlar basamağı değerleri(kullanıcıdan beklenen değerler)


function ucBasamakSayiyiCevir {  # Türkçe bölümünde üç basamaklı sayıyı yazıya çeviren fonksiyon
    local sayi=$1 # Dışardan alınan değer ( parametre ) sayi değişkenine atandı
    local yuzler=$(($sayi/100)) # sayi değişkeninde tutulan değer 100'e bölünerek yüzler basamağındaki rakam elde edildi
    local onlar=$(($sayi/10%10)) # sayi değişkeninde tutulan değer 10'a bölündü ardından bölümün 10'a bölümünden kalan alınarak onlar basamağındaki rakam elde edildi.
    local birler=$(($sayi%10)) # sayi değişkeninde tutulan değerin 10 'a bölümün sonucu ile  birler basamağındaki rakam elde edildi.
    yazi=${yb[$yuzler]}${ob[$onlar]}${bb[$birler]} # yazi değişkenine yb dizisinin yuzler indeksindeki deger , ob dizisindeki onlar indeksindeki değer , bb dizisindeki birler indeksindeki değer atandı.
}
function SayidanYaziya { # Türkçe bölümünde sayıdan yazıya çeviren fonksiyonumuz
    sayi=$1 # sayi değişkenimize dışarıdan alınan değer (parametre) atandı
    sonuc=$(($sayi/1000000000000)) # sonuc değişkenine sayi değişkeninin 1000000000000'a (bir trilyon)  bölümünün sonucu atandı ve trilyon basamağının üstündeki değerler alındı örnek =>596561564984564/1000000000000=596
    if [ $sonuc -ne 0 ];then # sonuc 0'a eşit değilse
        ucBasamakSayiyiCevir $sonuc #sonuc değişkenini üç basamaklı sayi çeviren fonksiyonumuza parametre olarak verdik
        sonucText=$sonucText$yazi${bd[4]} #sonucText değişkenine sonucText yazi ve büyük basamaklardan trilyon yazısı atandı örnek = "" +"uc yuz elli iki "+ "trilyon"
        sayi=$(($sayi-$sonuc*1000000000000)) # sayi değişkeninden üç basamaklı sonuc değişkeninin bir trilyon katı çıkarılarak trilyondan küçük değerler sayi değişkeninde kalıyor
    fi
    sonuc=$(($sayi/1000000000)) #sonuc değişkenine sayi değişkeninin milyarlar basamağındaki değerleri alıyoruz örnek => 362651915123/1000000000 = 362
    if [ $sonuc -ne 0 ];then # sonuc 0'a eşit değilse
        ucBasamakSayiyiCevir $sonuc #sonuc değişkenini üç basamaklı sayi çeviren fonksiyonumuza parametre olarak verdik
        sonucText=$sonucText$yazi${bd[3]} #sonucText değişkenine sonucText yazi ve büyük basamaklardan milyar yazısı atandı örnek = "bir trilyon" +"uc yuz elli iki "+ "milyar"
        sayi=$(($sayi-$sonuc*1000000000)) # sayi değişkeninden üç basamaklı sonuc değişkeninin bir milyar katı çıkarılarak milyardan küçük değerler sayi değişkeninde kalıyor
    fi
    sonuc=$(($sayi/1000000)) #sonuc değişkenine sayi değişkeninin milyonlar basamağındaki değerleri alıyoruz örnek => 52519151/1000000 = 52
    if [ $sonuc -ne 0 ];then  # sonuc 0'a eşit değilse
        ucBasamakSayiyiCevir $sonuc #sonuc değişkenini üç basamaklı sayi çeviren fonksiyonumuza parametre olarak verdik
        sonucText=$sonucText$yazi${bd[2]} #sonucText değişkenine sonucText ,yazi ve büyük basamaklardan milyon yazısı atandı örnek = "bir trilyon bir milyar" +"uc yuz elli iki "+ "milyon"
        sayi=$(($sayi-$sonuc*1000000)) # sayi değişkeninden üç basamaklı sonuc değişkeninin bir milyon katı çıkarılarak milyondan küçük değerler sayi değişkeninde kalıyor
    fi
    sonuc=$(($sayi/1000)) #sonuc değişkenine sayi değişkeninin binler basamağındaki değerleri alıyoruz örnek => 9151/1000 = 9
    if [ $sonuc -ne 0 ];then # sonuc 0'a eşit değilse
        if [ $sonuc -ne 1 ];then # sonuc 1'e eşit değilse (bir bin durumu kontrol etmek için)
            ucBasamakSayiyiCevir $sonuc #sonuc değişkenini üç basamaklı sayi çeviren fonksiyonumuza parametre olarak verdik
            sonucText=$sonucText$yazi${bd[1]} #sonucText değişkenine sonucText ,yazi ve büyük basamaklardan bin yazısı atandı örnek = "bir trilyon bir milyar bir milyon" +"uc yuz elli iki "+ "bin"
            sayi=$(($sayi-$sonuc*1000)) # sayi değişkeninden üç basamaklı sonuc değişkeninin bin katı çıkarılarak binden küçük değerler sayi değişkeninde kalıyor
        else # sonuc 1'e eşitse (bir bin durumu kontrol etmek için)
            sonucText=$sonucText$yazi${bd[1]} #sonucText değişkenine sonucText ,yazi ve büyük basamaklardan bin yazısı atandı örnek = "" +""+ "bin"
            sayi=$(($sayi-$sonuc*1000)) # sayi değişkeninden üç basamaklı sonuc değişkeninin bin katı çıkarılarak binden küçük değerler sayi değişkeninde kalıyor
        fi
    fi
    ucBasamakSayiyiCevir $sayi # sayi değişkeninde kalan değer üç basamaklıya çevriliyor
    sonucText=$sonucText$yazi #sonucText değişkenine son üç basamaklı değer ekleniyor (yazi değişkenini ucBasamakSayiyiCevir fonksiyonu döndürüyor)
}
function YazidanSayiya {
    local str=$1 # parametre alındı ve str değişkenine atandı
    local sayiTrilyon=0 #Sadece trilyon basamaklarındaki değeri tutan değişken
    local sayiMilyar=0 #Sadece miyar basamaklarındaki değeri tutan değişken
    local sayiMilyon=0 #Sadece milyon basamaklarındaki değeri tutan değişken
    local sayiBin=0 #Sadece binler basamaklarındaki değeri tutan değişken
    sayi1=0 #Üç basamaklı sayı tutan değişken
    
    yrd=0 #For döngüsünde ki bir önceki adımdaki değeri tutmak için oluşturulan değişken
    
    for basamak in $str # Gelen parametreyi boşluklara göre ayıran for döngüsü
    do
        hataKontrol=0 # Her döngü başında hata sıfırlandı
        for ((c=1; c<10;c++)) #Birler basamağı için oluşturulan döngü
        do
            if [[ $basamak == ${birlerb[c]} ]];then #Gelen değer birlerb dizisindeki c indeksine eşitse
                sayi1=$(($sayi1+$c)) #sayi1'i sayi1 ve c değişkeni kadar arttır
                yrd=$c #Yardımcı değişkene c değişkeni atandı
                hataKontrol=$(($hataKontrol+1)) # Hata kontrolu bir arttır
                break # Bir kere eşit olması durumunda for döngüsünden çık
            fi
        done
        for ((c=1; c<10;c++)) #Onlar basamağı için oluşturulan döngü
        do
            if [[ $basamak == ${onlarb[c]} ]];then #Gelen değer onlarb dizisindeki c indeksine eşitse
                sayi1=$(($sayi1+$c*10)) #sayi1 değişkenini c'nin 10 katı ile çarp ve sayi1 değişkenine ata
                yrd=$(($c*10)) #Yardımcı değişkene c değişkeninin 10 katına eşitle
                hataKontrol=$(($hataKontrol+1)) # Hata kontrolu bir arttır
                break # Bir kere eşit olması durumunda for döngüsünden çık
            fi
        done
        if [[ $basamak == "yuz" ]]; then #Gelen deger yuz ise
            if [ $sayi1 -eq 0 ]; then # sayi1 0'a eşitse henüz bir değer okunmamıştır ( bir yuz kontrolü )
                sayi1=100 #sayi1' 100 e eşitle
            else
                sayi1=$(($sayi1-$yrd)) #sayi1 den bir onceki değeri çıkar ve sayi1'e ata (basit örnek=> beş yuz ise yrd=5  ve  sayi1=5-5  sayi1=0)
                if [ $yrd -eq 0 ]; then # yardımcı 0'a eşitse sayi1 hiç değer almamış demektir.
                    yrd=1 # daha sonrak yapılacak olan çarpma işlemi için yardımcıyı 1'e eşitle
                fi
                sayi1=$(($sayi1+$yrd*100)) # sayi1'i yardımcının 100 katı kadar arttır ve sayi1' e ata (basit örnek sayi1=0+5*100   = 500)
            fi
            hataKontrol=$(($hataKontrol+1)) # Hata kontrolu bir arttır
        fi
        if [[ $basamak == "bin" ]]; then #Gelen deger bin ise
            if [ $sayi1 -eq 0 ]; then # sayi1 0'a eşitse henüz bir değer okunmamıştır ( bir bin kontrolü )
                sayi1=1000 #sayi1' 1000 e eşitle
            else
                sayiBin=$(($sayi1*1000)) # sayiBin'e, Gelen değerleri üç basamağa tamamlayan sayi1 değişkeni 1000 ile çarpılıp eklendi
                sayi1=0 # sayi1'i 0'a eşitle
            fi
            hataKontrol=$(($hataKontrol+1)) # Hata kontrolu bir arttır
        fi
        if [[ $basamak == "milyon" ]]; then #Gelen deger milyon ise
            sayiMilyon=$(($sayi1*1000000)) # sayiMilyon'a, Gelen değerleri üç basamağa tamamlayan sayi1 değişkeni 1000000 ile çarpılıp eklendi
            sayi1=0 # sayi1'i 0'a eşitle
            hataKontrol=$(($hataKontrol+1)) # Hata kontrolu bir arttır
        fi
        if [[ $basamak == "milyar" ]]; then #Gelen deger milyar ise
            sayiMilyar=$(($sayi1*1000000000)) # sayiMilyar'a, Gelen değerleri üç basamağa tamamlayan sayi1 değişkeni 1000000000 ile çarpılıp eklendi
            sayi1=0; # sayi1'i 0'a eşitle
            hataKontrol=$(($hataKontrol+1)) # Hata kontrolu bir arttır
        fi
        if [[ $basamak == "trilyon" ]]; then #Gelen deger trilyon ise
            sayiTrilyon=$(($sayi1*1000000000000)) # sayiTrilyon'a, Gelen değerleri üç basamağa tamamlayan sayi1 değişkeni 1000000000000 ile çarpılıp eklendi
            sayi1=0; # sayi1'i 0'a eşitle
            hataKontrol=$(($hataKontrol+1)) # Hata kontrolu bir arttır
        fi
        if [ $hataKontrol -eq 0 ] && [[ $basamak != "sifir" ]]; then #for döngüsü içerisinde herhangi bir işlem yaptıysa hataKontrol 1 olmuştur aksi takdirde 0 dır ve hata var demektir. Kullanıcı sifir yazmış ise sayi1 başlangıç değeri sıfırdır.for döngüsünde hata kontrol için sıfırı kontrol etmemiz gerekmez.
            echo "Yazım hatası $basamak yanlıs yazıldı.Lütfen tekrar yazınız."  #Yazım hatası durumunda for döngüsünden çıkılır yaziyi tekrar yazması için mesaj gösterilir.
            break # for döngüsünden çık
        fi
    done
    sayi1=$(($sayiTrilyon+$sayiMilyar+$sayiMilyon+$sayiBin+$sayi1)) #sayi1'e sayiTrilyon,sayiMilyar,sayiMilyon,sayiBin,sayi1 değişkenlerinin toplamı atandı.
}
#ENGLISH FUNCTIONS
function threeStepNumber { # İngilizce bölümünde üç basamaklı sayıyı yazıya çeviren fonksiyon
    local sayi_UC=$1 # Dışardan alınan değer ( parametre ) sayi_UC değişkenine atandı
    
    local yuzler=$(($sayi_UC/100)) # sayi_UC değişkeninde tutulan değer 100'e bölünerek yüzler basamağındaki rakam elde edildi
    local onlar=$(($sayi_UC/10%10)) # sayi_UC değişkeninde tutulan değer 10'a bölündü ardından bölümün 10'a bölümünden kalan alınarak onlar basamağındaki rakam elde edildi.
    local birler=$(($sayi_UC%100%10)) # sayi_UC değişkeninde tutulan değerin 100 ile böümünden kalan değerin 10 ile bölümünden kalan değeri alındı ve birler basamağındaki rakam elde edildi.
    
    toplam=$(($onlar*10+$birler)) # 10 ile 20 arasındaki değer tutuldu.
    if [ $toplam -gt 10 ] && [ $toplam -lt 20 ]; then #İngilizce sayilarda 10 ile 20 arası özel olduğu için bunların kontrolleri sağlandı
        toplam=$(($toplam%10)) # diziden elemanı almak için toplam değişkeninin 10'a bölümünden kalan toplama atandı.
        yazi=${ybEn[$yuzler]}${oObEn[$toplam]} # yazi değişkenine ybEn dizisinin yuzler indeksindeki deger , oobEn dizisindeki onlar indeksindeki değer  atandı. örnek = one hundred eleven
    else
        yazi=${ybEn[$yuzler]}${obEn[$onlar]}${bbEn[$birler]} # yazi değişkenine ybEn dizisinin yuzler indeksindeki deger , obEn dizisindeki onlar indeksindeki değer , bbEn dizisindeki birler indeksindeki değer atandı.
    fi
}
function numberToWord { # İngilizce bölümünde sayıdan yazıya çeviren fonksiyonumuz
    sayi=$1 # sayi değişkenimize dışarıdan alınan değer (parametre) atandı
    sonuc=$(($sayi/1000000000000)) # sonuc değişkenine sayi değişkeninin 1000000000000'a (bir trilyon)  bölümünün sonucu atandı ve trilyon basamağının üstündeki değerler alındı örnek =>984561564984564/1000000000000=984
    if [ $sonuc -ne 0 ];then # sonuc 0'a eşit değilse
        threeStepNumber $sonuc #sonuc değişkenini üç basamaklı sayi çeviren fonksiyonumuza parametre olarak verdik
        resultText=$resultText$yazi${bdEn[4]} #resultText değişkenine resultText yazi ve büyük basamaklardan trillion yazısı atandı örnek = "" +"three hundred fifty two "+ "trillion"
        sayi=$(($sayi-$sonuc*1000000000000)) # sayi değişkeninden üç basamaklı sonuc değişkeninin bir trilyon katı çıkarılarak trilyondan küçük değerler sayi değişkeninde kalıyor
    fi
    sonuc=$(($sayi/1000000000)) #sonuc değişkenine sayi değişkeninin milyarlar basamağındaki değerleri alıyoruz örnek => 362651915123/1000000000 = 362
    if [ $sonuc -ne 0 ];then # sonuc 0'a eşit değilse
        threeStepNumber $sonuc #sonuc değişkenini üç basamaklı sayi çeviren fonksiyonumuza parametre olarak verdik
        resultText=$resultText$yazi${bdEn[3]} #resultText değişkenine resultText yazi ve büyük basamaklardan billion yazısı atandı örnek = "one trillion" +"three hundred fifty two "+ "billion"
        sayi=$(($sayi-$sonuc*1000000000)) # sayi değişkeninden üç basamaklı sonuc değişkeninin bir milyar katı çıkarılarak milyardan küçük değerler sayi değişkeninde kalıyor
    fi
    sonuc=$(($sayi/1000000)) #sonuc değişkenine sayi değişkeninin milyonlar basamağındaki değerleri alıyoruz örnek => 651915123/1000000 = 651
    if [ $sonuc -ne 0 ];then # sonuc 0'a eşit değilse
        threeStepNumber $sonuc #sonuc değişkenini üç basamaklı sayi çeviren fonksiyonumuza parametre olarak verdik
        resultText=$resultText$yazi${bdEn[2]} #resultText değişkenine resultText yazi ve büyük basamaklardan million yazısı atandı örnek = "one trillion one billion" +"three hundred fifty two "+ "million"
        sayi=$(($sayi-$sonuc*1000000)) # sayi değişkeninden üç basamaklı sonuc değişkeninin bir milyon katı çıkarılarak milyondan küçük değerler sayi değişkeninde kalıyor
    fi
    sonuc=$(($sayi/1000)) #sonuc değişkenine sayi değişkeninin binler basamağındaki değerleri alıyoruz örnek => 151523/1000 = 151
    if [ $sonuc -ne 0 ];then # sonuc 0'a eşit değilse
        threeStepNumber $sonuc #sonuc değişkenini üç basamaklı sayi çeviren fonksiyonumuza parametre olarak verdik
        resultText=$resultText$yazi${bdEn[1]} #resultText değişkenine resultText yazi ve büyük basamaklardan thousand yazısı atandı örnek = "one trillion one billion one million" +"three hundred fifty two "+ "thousand"
        sayi=$(($sayi-$sonuc*1000)) # sayi değişkeninden üç basamaklı sonuc değişkeninin bin katı çıkarılarak binden küçük değerler sayi değişkeninde kalıyor
    fi
    threeStepNumber $sayi # sayi değişkeninde kalan değer üç basamaklıya çevriliyor
    resultText=$resultText$yazi #resultText değişkenine son üç basamaklı değer ekleniyor (yazi değişkenini ucBasamakSayiyiCevir fonksiyonu döndürüyor)
}
function wordToNumber {
    local str=$1 # parametre alındı ve str değişkenine atandı
    local sayiTrilyon=0; #Sadece trilyon basamaklarındaki değeri tutan değişken
    local sayiMilyar=0; #Sadece miyar basamaklarındaki değeri tutan değişken
    local sayiMilyon=0; #Sadece milyon basamaklarındaki değeri tutan değişken
    local sayiBin=0; #Sadece binler basamaklarındaki değeri tutan değişken
    sayi2=0 #Üç basamaklı sayı tutan değişken
    
    yrd=0 #For döngüsünde ki bir önceki adımdaki değeri tutmak için oluşturulan değişken
    
    for basamak in $str # Gelen parametreyi boşluklara göre ayıran for döngüsü
    do
        errorControl=0 # Her döngü başında hata sıfırlandı
        for ((c=1; c<10;c++)) # Birler basamağı için oluşturulan döngü
        do
            if [[ $basamak == ${birlerbEn[c]} ]];then #Gelen değer birlerbEn dizisindeki c indeksine eşitse
                sayi2=$(($sayi2+$c)) #sayi2'i sayi2 ve c değişkeni kadar arttır
                yrd=$c #Yardımcı değişkene c değişkeni atandı
                errorControl=$(($errorControl+1))  # errorControl bir arttır
                break # Bir kere eşit olması durumunda for döngüsünden çık
            fi
        done
        for ((c=1; c<10;c++)) #10 - 20 arasındaki sayılar için oluşturulan döngü
        do
            if [[ $basamak == ${oobEn[c]} ]];then #Gelen değer oobEn dizisindeki c indeksine eşitse
                sayi2=$(($c+10+$sayi2)) #sayi2'i c+10 kadar arttır (11,12,13 vb.)
                yrd=$(($c+10)) #Yardımcı değişkene c+10 değeri atandı
                errorControl=$(($errorControl+1)) # errorControl bir arttır
                break # Bir kere eşit olması durumunda for döngüsünden çık
            fi
        done
        for ((c=1; c<10;c++)) #Onlar basamağı için oluşturulan döngü
        do
            if [[ $basamak == ${onlarbEn[c]} ]];then #Gelen değer onlarbEn dizisindeki c indeksine eşitse
                sayi2=$(($sayi2+$c*10)) #sayi2 değişkenini c'nin 10 katı ile çarp ve sayi2 değişkenine ata
                yrd=$(($c*10)) #Yardımcı değişkene c değişkeninin 10 katına eşitle
                errorControl=$(($errorControl+1)) # errorControl bir arttır
                break # Bir kere eşit olması durumunda for döngüsünden çık
            fi
        done
        if [[ $basamak == "hundred" ]]; then #Gelen değer hundred ise
            if [ $sayi2 -ne 0 ]; then #sayi2 0'a eşit değilse
                sayi2=$(($yrd*100)) # sayi2 yi yardımcının 100 katına eşitle
                errorControl=$(($errorControl+1)) # errorControl bir arttır
            fi
        fi
        if [[ $basamak == "thousand" ]]; then #Gelen değer thousand ise
            if [ $sayi2 -ne 0 ]; then #sayi2 0'a eşitse
                sayiBin=$(($sayi2*1000)) # sayiBini  sayi2'nin 1000 katına eşitle
                sayi2=0 # sayi2'i  sıfırla
                errorControl=$(($errorControl+1))  # errorControl bir arttır
            fi
            
        fi
        if [[ $basamak == "million" ]]; then #Gelen deger million ise
            sayiMilyon=$(($sayi2*1000000)) # sayiMilyon'a, Gelen değerleri üç basamağa tamamlayan sayi2 değişkeni 1000000 ile çarpılıp eklendi
            sayi2=0 # sayi2'i  sıfırla
            errorControl=$(($errorControl+1)) # errorControl bir arttır
        fi
        if [[ $basamak == "billion" ]]; then #Gelen deger billion ise
            sayiMilyar=$(($sayi2*1000000000)) # sayiMilyar'a, Gelen değerleri üç basamağa tamamlayan sayi2 değişkeni 1000000000 ile çarpılıp eklendi
            sayi2=0; # sayi2'i  sıfırla
            errorControl=$(($errorControl+1)) # errorControl bir arttır
        fi
        if [[ $basamak == "trillion" ]]; then  #Gelen deger trillion ise
            sayiTrilyon=$(($sayi2*1000000000000)) # sayiTrilyon'a, Gelen değerleri üç basamağa tamamlayan sayi1 değişkeni 1000000000000 ile çarpılıp eklendi
            sayi2=0; # sayi2'i  sıfırla
            errorControl=$(($errorControl+1)) # errorControl bir arttır
        fi
        if [ $errorControl -eq 0 ] && [[ $basamak != "zero" ]]; then #for döngüsü içerisinde herhangi bir işlem yaptıysa errorControl 1 olmuştur aksi takdirde 0 dır ve hata var demektir. Kullanıcı zero yazmış ise sayi2 başlangıç değeri sıfırdır.for döngüsünde hata kontrol için sıfırı kontrol etmemiz gerekmez.
            echo "$basamak is wrong.Please try again." #Yazım hatası durumunda for döngüsünden çıkılır yaziyi tekrar yazması için mesaj gösterilir.
            break
        fi
    done
    sayi2=$(($sayiTrilyon+$sayiMilyar+$sayiMilyon+$sayiBin+$sayi2)) #sayi2'e sayiTrilyon,sayiMilyar,sayiMilyon,sayiBin,sayi2 değişkenlerinin toplamı atandı.
}

while true #programın sürekliliği için sınırsız döngü başlangıcı
do
    hataKontrol=0 #Türkçe bölümünde hata kontrolleri için oluşturulan değişken
    yazi="" #Türkçe bölümünde üç basamaklı sayıyı çeviren fonksiyonumuzun çıktı olarak vereceği değişken ( return edilecek değişken )
    sonucText="" # Türkçe bölümünde sayıdan yazıya çevir fonksiyonumuzun çıktı olarak vereceği değişken ( return edilecek değişken )
    
    errorControl=0 #ingilizce bölümünde hata kontrolleri için oluşturulan değişken
    word="" #ingilizce bölümünde üç basamaklı sayıyı çeviren fonksiyonumuzun çıktı olarak vereceği değişken ( return edilecek değişken )
    resultText="" # ingilizce bölümünde sayıdan yazıya çeviren fonksiyonumuzun çıktı olarak vereceği değişken ( return edilecek değişken )
    while true # Kullanıcının dil seçiminde hata yapma durumu için oluşturulan döngü
    do
        echo  -e "\nLutfen dili seciniz / please select language " #Dil seçimi yapması için kullanıcıya gösterilen mesaj
        echo   "1 - Turkce " #Türkçe dil seçeneği kullanıcıya mesaj olarak gösterildi.
        echo   "2 - English " #İngilizce dil seçeneği kullanıcıya mesaj olarak gösterildi.
        read   dilSecimi  #Kullanıcıdan dilSecimi değişkeni istendi
        if [ $dilSecimi -eq 1 ] || [ $dilSecimi -eq 2 ]; then #dilSecimi 1 veya 2 ise
            break #while döngüsünden çık
        else
            echo -e "\nYanlış dil seçimi. Lütfen Türkçe için (1), İngilizce için (2) giriniz." #programda bulunmayan durum için kullanıcıya hata mesajı gösterildi ve döngünün devamı sağlandı
        fi
    done
    if   [ $dilSecimi -eq 1 ];then #Kullanıcı 1. seçeneği seçmiş ise
        while true #Kullanıcının işlem seçiminde hata yapma durumu için oluşturulan döngü
        do
            echo -e "\n1 - Sayi --> Yazi: " #Kullanıcının 1'e basmasıyla sayidan yaziya dönüştürme yapacağını bildiren mesaj ekranda gösterildi
            echo    "2 - Yazi --> Sayi: " #Kullanıcının 2'e basmasıyla yazıdan sayıya dönüştürme yapacağını bildiren mesaj ekranda gösterildi
            echo    "3 - Yazi ile islem: " #Kullanıcının 3'e basmasıyla yazı ile işlem yapacağını bildiren mesaj ekranda gösterildi
            read islemNo #Kullanıcıdan islemNo istendi
            if [ $islemNo -eq 1 ] || [ $islemNo -eq 2 ] || [ $islemNo -eq 3 ] ; then #işlemNo 1, 2 veya 3 ise
                break # while döngüsünden çık
            else
                echo -e "Yanlış işlem.Lütfen işleminiz için (1), (2) veya (3)'ü seçiniz." #programda bulunmayan durum için kullanıcıya hata mesajı gösterildi ve döngünün devamı sağlandı
            fi
        done
        if   [ $islemNo -eq 1 ];then #Kullanıcı 1. seçeneği seçmiş ise   ##SAYIDAN YAZIYA
            
            while true
            do
                echo -e  "\nLutfen yaziya cevrilecek sayiyi giriniz. (Max trilyona kadar , trilyon dahil)" #Kullanıcıdan sayı girmesi gerektiğini bildiren mesaj ekranda gösterildi
                read sayi #Kullanıcıdan yazıya çevrilecek sayi istenildi
                if ! [[ "$sayi" =~ ^[0-9]+$ ]] ; then                    #Kullanıcıdan alınan sayının 0 ile 9 arasındaki değerlerden başka bişi içerip içermediği kontrol edildi
                    echo " ! ! ! Lütfen sadece rakamları kullanınız."    #Başka bir karakter içeriyorsa hata mesajı gönderilmektedir
                    continue                                             #ve tekrardan yeni değeri girmesi istenecektir
                else                                                     # içermiyorsa işleme devam edilmektedir.(Yani doğru değer girilme durumu)
                    SayidanYaziya $sayi #SayidanYaziya fonksiyonuna kullanıcının girdiği sayi parametre olarak verildi.
                    echo $sonucText #SayidanYaziya fonksiyonunun döndürdüğü sonucText değişkeni ekranda gösterildi
                    break
                fi
            done
            
            echo -e "\nDevam etmek istiyor musunuz [e\H]?" #Kullanıcının devam etmek isteyip istemediğini soran mesaj ekranda gösterildi
            read answer #Kullanıcıdan devam etmek isteyip istemediği bilgisi alındı
            if [[ $answer == "e" || $answer == "E" ]]; then #Kullanıcı e veya E ye basarsa
                continue #while döngüsünün başına git (programın en başı)
            else
                break #Kullanıcı devam etmek istemiyorsa döngüden çık ve programı sonlandır.
            fi
            elif [ $islemNo -eq 2 ];then # Kullanıcı 2. seçeneği seçmiş ise ## YAZIDAN SAYIYA
            echo -e "\nLutfen sayiya cevrilecek yazi karsiligini giriniz. (Max trilyona kadar , trilyon dahil)" #Kullanıcıdan sayıya çevrilecek yazıyı girmesi gerektiğini bildiren mesaj ekranda gösterildi
            while true #Hata oluşması durumunda kullanıcıdan tekrar girmesi istenmesi için sonsuz döngü oluşturuldu.
            do
                read cumle #Kullanıcıdan sayıya çevrilecek yazı alındı.
                YazidanSayiya "${cumle}" #Kullanıcıdan alınan cumle değişkeni YazidanSayiya fonksiyonuna parametre olarak verildi.
                if [ $hataKontrol -ne 0 ];then #hataKontrol 0 ise (hata yoktur)
                    echo $sayi1 #Ekrana sayiyi yaz
                    break; #while döngüsünden çık
                fi
            done
            echo -e "\nDevam etmek istiyormusunuz [e\H]?" #Kullanıcının devam etmek isteyip istemediğini soran mesaj ekranda gösterildi
            read answer #Kullanıcıdan devam etmek isteyip istemediği bilgisi alındı
            if [[ $answer == "e" || $answer == "E" ]]; then #Kullanıcı e veya E ye basarsa
                continue #while döngüsünün başına git (programın en başı)
            else
                break #Kullanıcı devam etmek istemiyorsa döngüden çık ve programı sonlandır.
            fi
            elif [ $islemNo -eq 3 ];then # Kullanıcı 3. seçeneği seçmiş ise ## YAZI ILE İŞLEM
            while true #Kullanıcının hatalı işlem yapma durumu için oluşturulan döngü
            do
                echo -e "\n1 - Toplama: " #Kullanıcının 1'e basmasıyla toplama işlemi yapacağını bildiren mesaj ekranda gösterildi
                echo    "2 - Cikarma: " #Kullanıcının 2'ye basmasıyla çıkarma işlemi yapacağını bildiren mesaj ekranda gösterildi
                read islemSec  #Kullanıcıdan işlem seçmesi için islemSec istendi
                if [ $islemSec -eq 1 ] || [ $islemSec -eq 2 ]; then #islemSec 1 veya 2 ise
                    break #while döngüsünden çık
                else
                    echo -e "Yanlış işlem.Lütfen işleminiz için (1) veya (2)'yi'seçiniz." #programda bulunmayan durum için kullanıcıya hata mesajı gösterildi ve döngü tekrarlandı.
                fi
            done
            if [ $islemSec -eq 1 ]; then  # Kullanıcı 1. seçeneği seçmiş ise #TOPLAMA
                echo -e "\nLutfen operand1 giriniz. (Max milyona kadar, milyon dahil)" #Kullanıcıdan toplama işlemi için sayıya çevrilecek operand1'i yazı olarak girmesi gerektiğini bildiren mesaj ekranda gösterildi
                operand1=0 #Kullanıcıdan alınan değeri tutmak için operand1 değişkeni oluşturuldu
                operand2=0 #Kullanıcıdan alınan değeri tutmak için operand2 değişkeni oluşturuldu
                while true #Hata oluşması durumunda kullanıcıdan tekrar girmesi istenmesi için sonsuz döngü oluşturuldu.
                do
                    read operand1Text #Kullanıcıdan operand1 değerinin yazısı istendi
                    YazidanSayiya "${operand1Text}" #YazidanSayiya fonksiyonuna kullanıcının girdiği değer parametre olarak verildi.
                    if [ $hataKontrol -ne 0 ];then #hataKontrol 0 ise (hata yoksa)
                        operand1=$sayi1; # operand1'e sayi1'in değeri atandı
                        break; # while döngüsünden çık
                    fi
                done
                echo -e "\nLutfen operand2 giriniz. (Max milyona kadar, milyon dahil)" #Kullanıcıdan toplama işlemi için sayıya çevrilecek operand2'i yazı olarak girmesi gerektiğini bildiren mesaj ekranda gösterildi
                while true #Hata oluşması durumunda kullanıcıdan tekrar girmesi istenmesi için sonsuz döngü oluşturuldu.
                do
                    read operand2Text #Kullanıcıdan operand2 değerinin yazısı istendi
                    YazidanSayiya "${operand2Text}" #YazidanSayiya fonksiyonuna kullanıcının girdiği değer parametre olarak verildi.
                    if [ $hataKontrol -ne 0 ];then #hataKontrol 0 ise (hata yoksa)
                        operand2=$sayi1; # operand2'yee sayi1'in değeri atandı
                        SayidanYaziya $(($operand1+$operand2)) #operand1 ve operand2'nin toplamının yaziya dönüştürülmesi için SayidanYaziya fonksiyonu kullanıldı.
                        echo -e "\nCevap: $operand1 + $operand2 = $(($operand1+$operand2)) ( $sonucText)" # Elimizdeki değerler ekrana basıldı (sonucText değişkeni SayidanYaziya fonksiyonundan dönen değerdir.)
                        break; # while döngüsünden çık
                    fi
                done
                echo -e "\nDevam etmek istiyor musunuz [e\H]?" #Kullanıcının devam etmek isteyip istemediğini soran mesaj ekranda gösterildi
                read answer #Kullanıcıdan devam etmek isteyip istemediği bilgisi alındı
                if [[ $answer == "e" || $answer == "E" ]]; then #Kullanıcı e veya E ye basarsa
                    continue #while döngüsünün başına git (programın en başı)
                else
                    break #Kullanıcı devam etmek istemiyorsa döngüden çık ve programı sonlandır.
                fi
                elif [ $islemSec -eq 2 ];then # Kullanıcı 2. seçeneği seçmiş ise #ÇIKARMA
                echo -e "\nLutfen operand1 giriniz. (Max milyona kadar, milyon dahil)" #Kullanıcıdan çıkarma işlemi için sayıya çevrilecek operand1'i yazı olarak girmesi gerektiğini bildiren mesaj ekranda gösterildi
                operand1=0 #Kullanıcıdan alınan değeri tutmak için operand1 değişkeni oluşturuldu
                operand2=0 #Kullanıcıdan alınan değeri tutmak için operand1 değişkeni oluşturuldu
                while true #Hata oluşması durumunda kullanıcıdan tekrar girmesi istenmesi için sonsuz döngü oluşturuldu.
                do
                    read operand1Text #Kullanıcıdan operand1 değerinin yazısı istendi
                    YazidanSayiya "${operand1Text}" #YazidanSayiya fonksiyonuna kullanıcının girdiği değer parametre olarak verildi.
                    if [ $hataKontrol -ne 0 ];then #hataKontrol 0 ise (hata yoksa)
                        operand1=$sayi1; # operand1'e sayi1'in değeri atandı
                        break; # while döngüsünden çık
                    fi
                done
                echo -e "\nLutfen operand2 giriniz. (Max milyona kadar, milyon dahil)" #Kullanıcıdan toplama işlemi için sayıya çevrilecek operand2'i yazı olarak girmesi gerektiğini bildiren mesaj ekranda gösterildi
                while true #Hata oluşması durumunda kullanıcıdan tekrar girmesi istenmesi için sonsuz döngü oluşturuldu.
                do
                    read operand2Text #Kullanıcıdan operand2 değerinin yazısı istendi
                    YazidanSayiya "${operand2Text}" #YazidanSayiya fonksiyonuna kullanıcının girdiği değer parametre olarak verildi.
                    if [ $hataKontrol -ne 0 ];then #hataKontrol 0 ise (hata yoksa)
                        operand2=$sayi1; # operand2'yee sayi1'in değeri atandı
                        islemSonucu=$(($operand1-$operand2)) #operand1 den operand 2 çıkarıldı ve islemSonucu değişkenine atandı.
                        if [ $islemSonucu -lt 0 ]; then #islem sonucu 0 dan küçük ise
                            islemSonucu=$(($islemSonucu*-1)) # işlemSonucu -1 ile çarpılıp islemSonucu değişkenine atandı (toplamaya göre tersi alındı)
                            SayidanYaziya $islemSonucu #islemSonucu değişkeni Sayidanyaziya fonksiyonuna parametre olarak verildi
                            echo -e "\nCevap: $operand1 - $operand2 = -$islemSonucu ( eksi $sonucText)"  # Elimizdeki değerler ekrana basıldı (sonucText değişkeni SayidanYaziya fonksiyonundan dönen değerdir.)
                        else                                        #islem sonucu 0 dan büyük ise
                            SayidanYaziya $(($islemSonucu)) #islemSonucu değişkeni Sayidanyaziya fonksiyonuna parametre olarak verildi
                            echo -e "\nCevap: $operand1 - $operand2 = $islemSonucu ( $sonucText)" # Elimizdeki değerler ekrana basıldı (sonucText değişkeni SayidanYaziya fonksiyonundan dönen değerdir.)
                        fi
                        break; # while döngüsünden çık
                    fi
                done
                echo -e "\nDevam etmek istiyormusunuz [e\H]?" #Kullanıcının devam etmek isteyip istemediğini soran mesaj ekranda gösterildi
                read answer #Kullanıcıdan devam etmek isteyip istemediği bilgisi alındı
                if [[ $answer == "e" || $answer == "E" ]]; then #Kullanıcı e veya E ye basarsa
                    continue #while döngüsünün başına git (programın en başı)
                else
                    break #Kullanıcı devam etmek istemiyorsa döngüden çık ve programı sonlandır.
                fi
            fi
        fi
        
        elif [ $dilSecimi -eq 2 ];then #Kullanıcı 2. seçeneği seçmiş ise #ENGLISH
        while true #Kullanıcının işlem seçiminde hata yapma durumu için oluşturulan döngü
        do
            echo -e "\n1 - Number --> Word: " #Kullanıcının 1'e basmasıyla sayidan yaziya dönüştürme yapacağını bildiren mesaj ekranda gösterildi
            echo    "2 - Word --> Number: " #Kullanıcının 2'e basmasıyla yazıdan sayıya dönüştürme yapacağını bildiren mesaj ekranda gösterildi
            echo    "3 - Operation with word: " #Kullanıcının 3'e basmasıyla yazı ile işlem yapacağını bildiren mesaj ekranda gösterildi
            read operationNo #Kullanıcıdan operationNo istendi
            if [ $operationNo -eq 1 ] || [ $operationNo -eq 2 ] || [ $operationNo -eq 3 ]; then #operationNo 1, 2 veya 3 ise
                break #while döngüsünden çık
            else
                echo "Wrong operation.Please enter (1) (2) or (3) for your operation" #programda bulunmayan durum için kullanıcıya hata mesajı gösterildi ve döngü tekrarlandı
            fi
        done
        if [ $operationNo -eq 1 ];then #Kullanıcı 1. seçeneği seçmiş ise   ##SAYIDAN YAZIYA ## Number To Word
            
            while true
            do
                echo -e  "\nPlease enter the number to be translated into word. (Max trillion , including trillion)" #Kullanıcıdan sayı girmesi gerektiğini bildiren mesaj ekranda gösterildi
                read number  #Kullanıcıdan yazıya çevrilecek sayi istenildi
                if ! [[ "$number" =~ ^[0-9]+$ ]] ; then
                    echo "Please use only figure !"
                    continue
                else
                    numberToWord $number #numberToWord fonksiyonuna kullanıcının girdiği sayi parametre olarak verildi.
                    echo $resultText #numberToWord fonksiyonunun döndürdüğü resultText değişkeni ekranda gösterildi
                    break
                fi
            done
            echo -e "\nDo you want to continue [y\N]?" #Kullanıcının devam etmek isteyip istemediğini soran mesaj ekranda gösterildi
            read answer #Kullanıcıdan devam etmek isteyip istemediği bilgisi alındı
            if [[ $answer == "y" || $answer == "Y" ]]; then #Kullanıcı y veya Y tuşuna basarsa
                continue #while döngüsünün başına git (programın en başı)
            else
                break #Kullanıcı devam etmek istemiyorsa döngüden çık ve programı sonlandır.
            fi
            elif [  $operationNo -eq 2 ];then # Kullanıcı 2. seçeneği seçmiş ise ## YAZIDAN SAYIYA ## WORD TO NUMBER
            echo -e "\nPlease enter the word to be translated into number. (Max trillion , including trillion)" #Kullanıcıdan sayıya çevrilecek yazıyı girmesi gerektiğini bildiren mesaj ekranda gösterildi
            while true #Hata oluşması durumunda kullanıcıdan tekrar girmesi istenmesi için sonsuz döngü oluşturuldu.
            do
                read word #Kullanıcıdan sayıya çevrilecek yazı alındı.
                wordToNumber "${word}" #Kullanıcıdan alınan cumle değişkeni wordToNumber fonksiyonuna parametre olarak verildi.
                if [ $errorControl -ne 0 ];then #errorControl 0 ise (hata yoksa)
                    echo $sayi2 #Ekrana sayiyi yaz
                    break; #while döngüsünden çık
                fi
            done
            echo -e "\nDo you want to continue [y\N]?" #Kullanıcının devam etmek isteyip istemediğini soran mesaj ekranda gösterildi
            read answer #Kullanıcıdan devam etmek isteyip istemediği bilgisi alındı
            if [[ $answer == "y" || $answer == "Y" ]]; then #Kullanıcı y veya Y tuşuna basarsa
                continue #while döngüsünün başına git (programın en başı)
            else
                break #Kullanıcı devam etmek istemiyorsa döngüden çık ve programı sonlandır.
            fi
            elif [  $operationNo -eq 3 ]; then # Kullanıcı 3. seçeneği seçmiş ise ## YAZI ILE İŞLEM ##OPERATION WITH WORD
            while true #Kullanıcının işlem seçiminde hata yapma durumu için oluşturulan döngü
            do
                echo -e "\n1 - Addition: " #Kullanıcının 1'e basmasıyla toplama işlemi yapacağını bildiren mesaj ekranda gösterildi
                echo    "2 - Subtraction: " #Kullanıcının 2'ye basmasıyla çıkarma işlemi yapacağını bildiren mesaj ekranda gösterildi
                read islemSec #Kullanıcıdan işlem seçmesi için islemSec istendi
                if [ $islemSec -eq 1 ] || [ $islemSec -eq 2 ] ; then #islemSec 1 veya 2 ise
                    break #while döngüsünden çık
                else
                    echo "Wrong operation.Please enter (1) or (2) for your operation" #programda bulunmayan durum için kullanıcıya hata mesajı gösterildi ve döngü tekrarlandı.
                fi
            done
            if [ $islemSec -eq 1 ]; then # Kullanıcı 1. seçeneği seçmiş ise #TOPLAMA #ADDITION
                echo -e "\nPlease Enter operand1 . (Max million, including milyon)" #Kullanıcıdan toplama işlemi için sayıya çevrilecek operand1'i yazı olarak girmesi gerektiğini bildiren mesaj ekranda gösterildi
                operand1=0 #Kullanıcıdan alınan değeri tutmak için operand1 değişkeni oluşturuldu
                operand2=0 #Kullanıcıdan alınan değeri tutmak için operand2 değişkeni oluşturuldu
                while true #Hata oluşması durumunda kullanıcıdan tekrar girmesi istenmesi için sonsuz döngü oluşturuldu.
                do
                    read operand1Text #Kullanıcıdan operand1 değerinin yazısı istendi
                    wordToNumber "${operand1Text}" #wordToNumber fonksiyonuna kullanıcının girdiği değer parametre olarak verildi.
                    if [ $errorControl -ne 0 ];then #errorControl 0 ise (hata yoksa)
                        operand1=$sayi2; # operand1'e sayi2'in değeri atandı
                        break; #while döngüsünden çık
                    fi
                done
                echo -e "\nPlease Enter operand2 . (Max million, including milyon)" #Kullanıcıdan toplama işlemi için sayıya çevrilecek operand2'i yazı olarak girmesi gerektiğini bildiren mesaj ekranda gösterildi
                while true #Hata oluşması durumunda kullanıcıdan tekrar girmesi istenmesi için sonsuz döngü oluşturuldu.
                do
                    read operand2Text #Kullanıcıdan operand2 değerinin yazısı istendi
                    wordToNumber "${operand2Text}" #wordToNumber fonksiyonuna kullanıcının girdiği değer parametre olarak verildi.
                    if [ $errorControl -ne 0 ];then #errorControl 0 ise (hata yoksa)
                        operand2=$sayi2; # operand2'e sayi2'in değeri atandı
                        numberToWord $(($operand1+$operand2)) #operand1 ve operand2'nin toplamının yaziya dönüştürülmesi için numberToWord fonksiyonu kullanıldı.
                        echo -e "\nAnswer: $operand1 + $operand2 = $(($operand1+$operand2)) ( $resultText ) " # Elimizdeki değerler ekrana basıldı (sonucText değişkeni resultText fonksiyonundan dönen değerdir.)
                        break; #while döngüsünden çık
                    fi
                done
                echo -e "\nDo you want to continue [y\N]?" #Kullanıcının devam etmek isteyip istemediğini soran mesaj ekranda gösterildi
                read answer #Kullanıcıdan devam etmek isteyip istemediği bilgisi alındı
                if [[ $answer == "y" || $answer == "Y" ]]; then #Kullanıcı y veya Y tuşuna basarsa
                    continue #while döngüsünün başına git (programın en başı)
                else
                    break #Kullanıcı devam etmek istemiyorsa döngüden çık ve programı sonlandır.
                fi
                elif [ $islemSec -eq 2 ];then  # Kullanıcı 2. seçeneği seçmiş ise #ÇIKARMA #SUBTRACTION
                echo -e "\nPlease Enter operand1 . (Max million, including milyon)" #Kullanıcıdan çıkarma işlemi için sayıya çevrilecek operand1'i yazı olarak girmesi gerektiğini bildiren mesaj ekranda gösterildi
                operand1=0 #Kullanıcıdan alınan değeri tutmak için operand1 değişkeni oluşturuldu
                operand2=0 #Kullanıcıdan alınan değeri tutmak için operand2 değişkeni oluşturuldu
                while true #Hata oluşması durumunda kullanıcıdan tekrar girmesi istenmesi için sonsuz döngü oluşturuldu.
                do
                    read operand1Text #Kullanıcıdan operand1 değerinin yazısı istendi
                    wordToNumber "${operand1Text}" #wordToNumber fonksiyonuna kullanıcının girdiği değer parametre olarak verildi.
                    if [ $errorControl -ne 0 ];then #errorControl 0 ise (hata yoksa)
                        operand1=$sayi2; # operand2'e sayi2'in değeri atandı
                        break; #while döngüsünden çık
                    fi
                done
                echo -e "\nPlease Enter operand2 . (Max million, including milyon)" #Kullanıcıdan toplama işlemi için sayıya çevrilecek operand2'i yazı olarak girmesi gerektiğini bildiren mesaj ekranda gösterildi
                while true #Hata oluşması durumunda kullanıcıdan tekrar girmesi istenmesi için sonsuz döngü oluşturuldu.
                do
                    read operand2Text #Kullanıcıdan operand2 değerinin yazısı istendi
                    wordToNumber "${operand2Text}" #wordToNumber fonksiyonuna kullanıcının girdiği değer parametre olarak verildi.
                    if [ $errorControl -ne 0 ];then #errorControl 0 ise (hata yoksa)
                        operand2=$sayi2; # operand2'e sayi2'in değeri atandı
                        islemSonucu=$(($operand1-$operand2)) #operand1 den operand 2 çıkarıldı ve islemSonucu değişkenine atandı.
                        if [ $islemSonucu -lt 0 ]; then #islem sonucu 0 dan küçük ise
                            islemSonucu=$(($islemSonucu*-1)) # işlemSonucu -1 ile çarpılıp islemSonucu değişkenine atandı (toplamaya göre tersi alındı)
                            numberToWord $islemSonucu #islemSonucu değişkeni numberToWord fonksiyonuna parametre olarak verildi
                            echo -e "\nAnswer: $operand1 - $operand2 = -$islemSonucu ( minus $resultText)" # Elimizdeki değerler ekrana basıldı (resultText değişkeni numberToWord fonksiyonundan dönen değerdir.)
                        else                                        #islem sonucu 0 dan büyük ise
                            numberToWord $(($islemSonucu)) #islemSonucu değişkeni Sayidanyaziya fonksiyonuna parametre olarak verildi
                            echo -e "\nAnswer: $operand1 - $operand2 = $islemSonucu ( $resultText)" # Elimizdeki değerler ekrana basıldı (resultText değişkeni numberToWord fonksiyonundan dönen değerdir.)
                        fi
                        break; # while döngüsünden çık
                    fi
                done
                echo -e "\nDo you want to continue [y\N]?" #Kullanıcının devam etmek isteyip istemediğini soran mesaj ekranda gösterildi
                read answer #Kullanıcıdan devam etmek isteyip istemediği bilgisi alındı
                if [[ $answer == "y" || $answer == "Y" ]]; then #Kullanıcı y veya Y tuşuna basarsa
                    continue #while döngüsünün başına git (programın en başı)
                else
                    break #Kullanıcı devam etmek istemiyorsa döngüden çık ve programı sonlandır.
                fi
            fi
        fi
    fi
done
<%-- 
    Document   : index
    Created on : 2015-05-02, 00:52:04
    Author     : Izabela
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Witaj na stronie naszej Księgarni</title>
        <script type="text/javascript" src="js/jquery.js"></script> 
        <script type="text/javascript" src="js/jss.js"></script> 
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <link rel="stylesheet" id="css/camera-css"  href="css/camera.css" type="text/css" media="all">  
    </head>

    <body bgcolor="white" text="#5f5f5f"  link="#999999" vlink="#999999" alink="#999999" >
        <div>

            <div style="float: left; width: 300px">  </br></div>
            <div style="float: left"> <img src="pictures/logo1.jpg"></div>

            <div style="float: left">
                <h1>"Kto czyta książki, żyje podwójnie"</h1>
                - Umberto Eco
                
            </div>
            <div style="clear: both"></div>
            <div id="menu">
                <ul class="nav">
                    <li><a href="index.jsp">Strona glowna</a></li>
                    <li><a href="logowanie.jsp">Zaloguj się/Załóż konto</a></li>
                    <li><a href="baza.jsp">Baza książek</a>

                    <li><a href="wydawnictwa.jsp">Wydawnictwa</a></li>
                    <li><a href="koszyk.jsp">Twoje konto</a></li>
                    <li><a href="kontakt.jsp">Kontakt</a></li>

                </ul>
            </div>

        </div>
        <div>
            <div id="blok"></div>
            <div style=" float: left; width: 20%"><br/><br/></div>
            <div id="in" style="float: left; width: 80%">
                <div  class="slides" id="camera_wrap_1">

                    <div  data-src="pictures/top10.jpg">
                        <div class="camera_caption fadeFromBottom">
                          
                        </div>
                    </div>
                    
                    <div  data-src="pictures/new.jpg">
                        <div class="camera_caption fadeFromBottom">
                          
                        </div>
                    </div>
                    <div  data-src="pictures/ks1.jpg">
                        <div class="camera_caption fadeFromBottom">
                         
                        </div>
                    </div>
                 
                </div>

            </div>

        </div>
        <div style="text-align: center"> <h1> O nas </h1>
             Książka poszerza horyzonty - Książka jest dobrem kultury
             <ul>
             <li> Ambicją naszej firmy jest być postrzeganą jako najlepsza, innowacyjna księgarnia
                 na polskim rynku internetowym</li>
    <li>Chcemy, aby oferta książek oraz informacja o nich była jak najszersza i ciągle rozbudowywana
        Pragniemy zaspokajać potrzeby Klientów związane z książką</li>
    <li>Chcemy, aby Klient wiedział, że w naszej księgarni otrzyma rzetelną informację
        oraz profesjonalną obsługę</li></ul>
             
            <br/><br/>
            <h1> MISJA FIRMY </h1>
            

            Poszerzamy Horyzonty to nasza myśl przewodnia. Zależy nam na rozwoju czytelnictwa, stawiamy na szeroko rozumianą kulturę.<br/>
            Aktywnie działamy, tworząc modę na czytanie. Udostępniamy informacje kulturalne: księgarskie, filmowe, teatralne, muzyczne; wspieramy różnego rodzaju akcje czytelnicze,<br/>
            konkursowe; patronujemy książkom, uczestniczymy w wydarzeniach branżowych, niejednokrotnie zapraszając do nich Czytelników.
A to wszystko po to, by wspaniały kult czytania nie minął.

        
        </div>
        <div style="float: left; width: 40%"><br/><br/> </div>
        <div style="float: left; width: 60%"><img src="pictures/dostawa.jpg"> </div>
        <div style="clear: both; text-align: center"> &copy; Wszelkie prawa zastrzeżone </div>
        
    <script type='text/javascript' src='js/jquery.min.js'></script>
    <script type='text/javascript' src='js/jquery.mobile.customized.min.js'></script>
    <script type='text/javascript' src='js/jquery.easing.1.3.js'></script> 
    <script type='text/javascript' src='js/camera.min.js'></script> 
     
    <script>
		jQuery(function(){
			
			jQuery('#camera_wrap_1').camera({
				thumbnails: true
			});

			jQuery('#camera_wrap_2').camera({
				height: '400px',
				loader: 'bar',
				pagination: false,
				thumbnails: true
			});
		});
	</script>


    </body>
</html>
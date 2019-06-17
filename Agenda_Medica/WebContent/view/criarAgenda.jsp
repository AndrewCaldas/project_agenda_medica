<%@page import="DAO.CredenciadoDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.SimpleDateFormat, java.util.List, java.util.ArrayList, model.Credenciado"%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Agenda M√©dica Online - Menu</title>


    <!-- Imagehover CSS -->
    <link rel="stylesheet" href="../resources/css/imagehover.min.css">
    <!-- Bootstrap -->
    <link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/css/estilo.css" rel="stylesheet">
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); %>
    
    <!-- CALENDAR -->
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
  <style type="text/css">
#calendar{
  margin-left: auto;
  margin-right: auto;
  width: 320px;
  font-family: 'Lato', sans-serif;
}
#calendar_weekdays div{
  display:inline-block;
  vertical-align:top;
}
#calendar_content, #calendar_weekdays, #calendar_header{
  position: relative;
  width: 320px;
  overflow: hidden;
  float: left;
  z-index: 10;
}
#calendar_weekdays div, #calendar_content div{
  width:40px;
  height: 40px;
  overflow: hidden;
  text-align: center;
  background-color: #FFFFFF;
  color: #787878;
}
#calendar_content{
  -webkit-border-radius: 0px 0px 12px 12px;
  -moz-border-radius: 0px 0px 12px 12px; 
  border-radius: 0px 0px 12px 12px;
}
#calendar_content div{
  float: left;
}
#calendar_content div:hover{
  background-color: #D3D3D3;
}
#calendar_content div.blank{
  background-color: #E8E8E8;
}
#calendar_header, #calendar_content div.today{
  zoom: 1;
  filter: alpha(opacity=90);
  opacity: 0.9;
}
#calendar_content div.today{
  color: #FFFFFF;
}
#calendar_header{
  width: 100%;
  height: 37px;
  text-align: center;
  background-color: #FF6860;
  padding: 5px 0;
  -webkit-border-radius: 12px 12px 0px 0px;
  -moz-border-radius: 12px 12px 0px 0px; 
  border-radius: 12px 12px 0px 0px;
}
#calendar_header h1{
  font-size: 1.5em;
  color: #FFFFFF;
  float:left;
  width:70%;
}
i[class^=icon-chevron]{
  color: #FFFFFF;
  float: left;
  width:15%;
  border-radius: 50%;
}
  </style>
<script>
  var dias=[];
  var agenda=[];
  function select(id){
    if (dias[id] == null){
      document.getElementById(id).style.background = "#B0E0E6"; //PowderBlue  #B0E0E6   RGB(176,224,230)
      dias[id] = id;
    }
    else{
      dias[id] = null; 
      document.getElementById(id).style.background = "#FFFFFF";
    }
    
    alert(JSON.stringify(dias));
  }

  function zerar(){dias=[];}
</script>
    <!-- CALENDAR FIM -->
    
  </head>

  <body>

      <nav class="navbar navbar-fixed-top navbar-inverse navbar-transparente">
        <div class="container">
          <!-- Header -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#barra-navegacao">
              <span class="sr-only">Alterar menu</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>            
            </button>         
            <a href="index.jsp" class="navbar-brand" style="color: white;" class="sombra"><b>Agenda</b></span> Medica<span style="font-size: 10px"> Online</span></a>
          </div>
          
          <div class="collapse navbar-collapse" id="barra-navegacao">

            <ul class="nav navbar-nav navbar-right">
              <li> <a href="entrarRegistrar.jsp">Home</a> </li>
              <li> <a href="#">Contato</a> </li>
              <li> <a href="#">Ajuda</a> </li>

              <li class="dropdown">
                <a href="" class="dropdown-toggle" data-toggle="dropdown-menu">Minha Conta 
                  <span class="caret"></span>
                </a>

                <ul class="dropdown-menu">
                  <a href="#">Link 1</a>
                  <a href="#">Link 2</a>
                  <a href="#">Link 3</a>
                </ul> 
              </li>

                 <!-- <li class="dropdown">
                  <a href="" class="dropdown-toggle" data-toggle="#dropdown">
                  Minha Conta <span class="caret"></span>
                  </a>

                    <ul class="dropdown-menu" id="dropdown">
                       <li><a href="#">Editar</a> </li>
                       <li><a href="#">Logout</a> </li>
                    </ul>

                 </li> -->
            </ul>
          </div>
        </div>
      </nav>

      <!-- <div class="container barrinha"></div> -->

    <div class="grid-container ">
            
        <div class="row top">
          <!-- <div class="barrinha top"></div> -->
            
            <div class="fixed">
                  <a href="#">
                    <div class="colum-picture">
                      <label style="margin: 16.5rem 2px 2px 1.8rem; font-size: 12px;">Nome do Credenciado</label>
                    </div>
                  </a>
                    <!-- <div class="colum-buttom"></div> -->
                      <div class="text-custom text">
                        <a href="agendar.jsp" id="agenda" data-element="#agendar"> 
                          <div class="colum-buttom">Agendar</div>
                        </a>
                        <a href="" onclick="status()" id="veragenda" data-element=#ver>
                          <div class="colum-buttom">Ver Agenda</div>
                        </a>
                        <a href="#" id="reagenda" data-element="#reagenda">
                          <div class="colum-buttom">Re-agendar</div>
                        </a>
                        <a href="#" class="editar" id="editar" data-element="#editar">
                          <div class="colum-buttom">Editar Cadastro</div>
                        </a>
                    </div>
            </div>
        </div>
        
        <!-- Esconder class, apenas adicione "hidden a classe" -->

         <div class="row top">                             
                <div class="card-form m" id="ver">
                <!-- CALENDAR -->
                	<div>
  <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
	<div>

  <div id="calendar">
    <div id="calendar_header">
      <i class="icon-chevron-left" onclick="zerar()"></i>
        <h1></h1>
      <i class="icon-chevron-right" onclick="zerar()"></i>
    </div>
    <div id="calendar_weekdays"></div>
    <div id="calendar_content"></div>
  </div>
  </div>

  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script type="text/javascript">
  $(function(){
	var dias=[];
	function c(){
		p();
		var e=h();
		var r=0;
		var u=false;
		l.empty();
		while(!u){
			if(s[r]==e[0].weekday){
				u=true
			}
			else{
				l.append('<div class="blank"></div>');
				r++
			}
		}
		for(var c=0;c<42-r;c++){
			if(c>=e.length){
				l.append('<div class="blank"></div>')
			}
			else{
				var v=e[c].day;
				var m=g(new Date(t,n-1,v))?'<div class="today">':"<div onclick=\"select(this.id);\" id="+v+">";
				l.append(m+""+v+"</div>")
			}
		}
		var y="#2c3e50" /*o[n-1]*/;
		a.css("background-color",y).find("h1").text(i[n-1]+" "+t);
		f.find("div").css("color",y);
		l.find(".today").css("background-color",y);
		d()
	}

	function h(){
		var e=[];
		for(var r=1;r<v(t,n)+1;r++){
			e.push({day:r,weekday:s[m(t,n,r)]})
		}
		return e
	}

	function p(){
		f.empty();
		for(var e=0;e<7;e++){
			f.append("<div>"+s[e].substring(0,3)+"</div>")
		}
	}

	function d(){
		var t;
		var n=$("#calendar").css("width",e+"px");
		n.find(t="#calendar_weekdays, #calendar_content").css("width",e+"px").find("div").css({width:e/7+"px",height:e/7+"px","line-height":e/7+"px"});
		n.find("#calendar_header").css({height:e*(1/7)+"px"}).find('i[class^="icon-chevron"]').css("line-height",e*(1/7)+"px")
	}

	function v(e,t){
		return(new Date(e,t,0)).getDate()
	}

	function m(e,t,n){
		return(new Date(e,t-1,n)).getDay()
	}

	function g(e){
		return y(new Date)==y(e)
	}

	function y(e){
		return e.getFullYear()+"/"+(e.getMonth()+1)+"/"+e.getDate()
	}

	function b(){
		var e=new Date;
		t=e.getFullYear();
		n=e.getMonth()+1
	}

	/*function select(id){
		//PowderBlue	#B0E0E6		RGB(176,224,230)
		var x = document.getElementsByClassName("selecionado");
                var i;
                for (i = 0; i < x.length; i++) {
                    x[i].style.background = "white"
                }
                document.getElementById(id).style.background = "#B0E0E6";
                alert(id);
	}*/

	var e=480;
	var t=2013;
	var n=9;
	var r=[];

	var i=["JANEIRO",
			"FEVEREIRO",
			"MAR«O",
			"ABRIL",
			"MAIO",
			"JUNHO",
			"JULHO",
			"AGOSTO",
			"SETEMBRO",
			"OUTUBRO",
			"NOVEMBRO",
			"DEZEMBRO"];

	var s=["Domingo",
			"Segunda",
			"TerÁa",
			"Quarta",
			"Quinta",
			"Sexta",
			"S·bado"];

	/*var o=["#16a085",
			"#1abc9c",
			"#c0392b",
			"#27ae60",
			"#FF6860",
			"#f39c12",
			"#f1c40f",
			"#e67e22",
			"#2ecc71",
			"#e74c3c",
			"#d35400",
			"#2c3e50"];*/

	var u=$("#calendar");
	var a=u.find("#calendar_header");
	var f=u.find("#calendar_weekdays");
	var l=u.find("#calendar_content");
	b();
	c();
	a.find('i[class^="icon-chevron"]').on("click",function(){
													var e=$(this);
													var r=function(e){
																n=e=="next"?n+1:n-1;
																if(n<1){
																	n=12;
																	t--
																}
																else if(n>12){
																	n=1;
																	t++
																}
																c()
															};
														if(e.attr("class").indexOf("left")!=-1){
															r("previous")
														}
														else{
															r("next")
														}
													}
											)
})
  </script>
  </div>
  <!-- CALENDAR FIM -->
                </div>
        </div>
    </div>

    <!-- --- FOOTER --- -->

    <!-- <footer class="colum-barra"></footer> -->


    <!-- --- SCRIPTS --- -->

    <!-- <script src="../js/scroll-nav.js"></script> -->
    
    <!-- jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>


    <script type="text/javascript">
      
        $(function(){
          $(".btn-toggle").click(function(e){
              e.preventDefault();
              el = $(this).data('element');
              pop = $(this).data('teste');
              $(el).toggle();
          });
        })

        function status(){
          alert("Voc√™ j√° est√° em ver agenda!")
          // console.log("teste: ")
        }

    </script>

    </body>
</html>

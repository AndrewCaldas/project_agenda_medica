<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Agenda M�dica Online - Menu</title>


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
            <a href="index.jsp" class="navbar-brand" class="sombra"><b>Agenda</b></span> Medica<span style="font-size: 10px"> Online</span></a>
          </div>
          
          <div class="collapse navbar-collapse" id="barra-navegacao">

            <ul class="nav navbar-nav navbar-right">
              <li> <a href="login.jsp">Home</a> </li>
              <li> <a href="#">Contato</a> </li>
              <li> <a href="#">Ajuda</a> </li>

                 <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  Minha Conta <span class="caret"></span>
                  </a>

                    <ul class="dropdown-menu">
                       <li><a href="#">Editar</a> </li>
                       <li><a href="#">Logout</a> </li>
                    </ul>

                 </li>
            </ul>
          </div>
        </div>
      </nav>

    <div class="grid-container ">
            
        <div class="row">
          <div class="barrinha top"></div>
            
            <div class="fixed">
                    <div class="colum-picture">
                      <label style="margin: 16.5rem 2px 2px 1.8rem; font-size: 12px;">Nome do Credenciado</label>
                    </div>
                    <!-- <div class="colum-buttom"></div> -->
                      <div class="text-custom">
                        <a href="#" class="btn-toggle" data-element="#agendar"> 
                          <div class="colum-buttom"><b>Agendar</b></div>
                        </a>
                        <a href="#" class="text-center" class="btn-toggle">
                          <div class="colum-buttom" data-element="#verAgenda">Ver Agenda</div>
                        </a>
                        <a href="#" class="text-center btn-toggle">
                          <div class="colum-buttom" data-element="#reAgendar">Re-agendar</div>
                        </a>
                        <a href="#" class="btn-toggle" >
                          <div class="colum-buttom" data-element="#editar">Editar Cadastro</div>
                        </a>
                    </div>
            </div>
        </div>
        
        <!-- Esconder class, apenas adicione "hidden a classe" -->
        
        <div class="row top">
                <div class="colum-opcao" id="agendar"></div>
        </div>

        <div class="row top">
                <div class="colum-box-top" id="verAgenda"></div>
                <div class="colum-box-bottom" id="reAgendar"></div>
        </div>

        <div class="row top">
                <div class="colum-opcao-2" id="editar"></div>
        </div>
        
        <!-- <div class="colum-barra"></div> -->
    </div>

    <footer class="colum-barra"></footer>

    <script src="../js/scroll-nav.js"></script>
    
    <!-- jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>


    <script type="text/javascript">
      
      // function Mudarestado(el) {
      //   var display = document.getElementById(el).style.display;
      //   console.log(display)
      //   if(display == null){
      //       $('.'+el).hide();
      //   } else
      //       $('.'+el).show();
      //   }

        $(function(){
          $(".btn-toggle").click(function(e){
              e.preventDefault();
              el = $(this).data('element');
              $(el).toggle();
          });
        })



    </script>

    </body>
</html>

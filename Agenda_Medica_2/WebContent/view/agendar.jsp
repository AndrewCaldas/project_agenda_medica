<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Agenda Médica Online - Menu</title>


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
            <a href="index.jsp" class="navbar-brand" class="sombra" style="color: white;"><b>Agenda</b></span> Medica<span style="font-size: 10px"> Online</span></a>
          </div>
          
          <div class="collapse navbar-collapse" id="barra-navegacao">

            <ul class="nav navbar-nav navbar-right">
              <li> <a href="entrarRegistrar.jsp">Home</a> </li>
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
                        <a href="#" onclick="status()" id="agenda" > 
                          <div class="colum-buttom">Agendar</div>
                        </a>
                        <a href="verAgenda.jsp" class="" id="veragenda" data-element=#veragenda>
                          <div class="colum-buttom">Ver Agenda</div>
                        </a>
                        <a href="#" class="" id="reagenda" data-element="#reagenda">
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
                        <div class="card-form m" id="agendar">
                          <label class="text titulo">Agendar consulta</label>
                          <br><br>
                            <form>
                                <div class="grid-card">

                                    <div class="col-md-7">
                                        <label for="">Clinicas: </label>
                                        <select class="form-control" aria-required="false">
                                            <option value="" disabled selected>--- Selecione uma clinica ---</option>
                                            <option value="">1</option>
                                            <option value="">1</option>
                                            <option value="">1</option>
                                        </select>
            
                                        <br>
                                    
                                        <label for="">Especialidade: </label>
                                        <select name="" id="" class="form-control" required>
                                            <option value="" disabled selected>--- Selecione uma especialidade ---</option>
                                            <option value="">1</option>
                                            <option value="">1</option>
                                            <option value="">1</option>
                                        </select> 
                                    </div>

                                    
            
                                    <div class="col-md-5">
                                        <label for="data">Selecione uma data: </label>
                                        <input type="date" id="data" class="form-control">
                                    
                                        <br><br>

                                        <div class="radio" required>
                                            <label><b> Sua primeira consulta ? </b></label>

                                            <label for="sim">
                                                <input type="radio" id="sim" name="escolha"> Sim
                                            </label>

                                            <label for="nao">
                                                <input type="radio" id="nao" name="escolha"> Não
                                            </label>
                                        </div>
                                    </div>  

                                </div> <!-- Fim row -->   

                                <br>
                                
                                <div style="text-align:center;">
                                    <a href="verAgenda.jsp" type="submit" class="btn btn-custom btn-pad ">Agendar agora</a>
                                </div>

                          </form>
                        </div>
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
            alert("Você já está em Agendar consultas!")
        }        

    </script>

    </body>
</html>

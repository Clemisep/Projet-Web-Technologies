<div class="box box-danger">
            <div class="box-header">
              <h3 class="box-title">Ajouter un utilisateur</h3>
            </div>
            
            <div class="box-body">
            <form action="http://localhost:8080/GAPP/AddUser" method="post" >
              <!-- Date dd/mm/yyyy -->
              <div class="form-group">
                <label>Pseudo:</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class=" fa fa-user"></i>
                  </div>
                  <input type="text" class="form-control" id="pseudo" name="pseudo"required>
                </div>
                <!-- /.input group -->
              </div>
            
                        
              <div class="form-group">
                <label>Prénom</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-user"></i>
                  </div>
                  <input type="text" class="form-control" id="firstname" name="firstname" required>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->

              
              <div class="form-group">
                <label>Nom</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-user"></i>
                  </div>
                  <input type="text" class="form-control" id="lastname" name="lastname" required>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->

           
              <div class="form-group">
                <label>Date de naissance</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-birthday-cake"></i>
                  </div>
                  <input type="date" class="form-control" id="birthday" name="birthday" required>
                </div>
                
              </div>
             

             
              <div class="form-group" ng-controller="register as rCtrl" >
                <label>mot de passe</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-laptop"></i>
                  </div>
                  <input type="password" class="form-control" placeholder="Mot de passe"id="password" name="password" ng-model="rCtrl.password" required>
                  <input type="password" class="form-control" placeholder="Confirmer votre mot de passe" id="password2" ng-model="rCtrl.password2" required>
                 <span style="color:{{ rCtrl.result.color }}">{{ rCtrl.compare(rCtrl.password, rCtrl.password2).text }}</span>
                </div>
               
              </div>
              
               <div class="form-group">
                <label>photo de profil</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-file-picture-o"></i>
                  </div>
                  <input type="file" class="btn btn-primary" id="picture" name="picture">
                </div>
                
                <div></div> <br>
                
                <label>L'utilisateur est :</label> <br>
                <label><input type="checkbox" name="role" id="admin" value="admin"> Admin</label><br>
                <label><input type="checkbox" name="role" id="student" value="student"> Élève,</label>
                <label>le cas échéant, numéro d'étudiant : </label> <input type="number" id="student_id" ><br>
                <label><input type="checkbox" name="role" id="tutor" value="tutor"> Tuteur</label><br>
                <label><input type="checkbox" name="role" id="responsible" value="responsible"> Responsable</label><br>


                
                
                <br>
                <div >
                <input type="submit" class="btn btn-danger" id="envoie">
                </div>
                
                
                <!-- /.input group -->
              </div>
              </form>
              
              <!-- /.form group -->

            </div>
            <!-- /.box-body -->
            
          </div>
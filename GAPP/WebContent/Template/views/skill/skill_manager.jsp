<!DOCTYPE html>
<html>

<body>
    <h1>Compétences</h1>
    <br>
    <br>
    <div>
        <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
                <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                    <div class="row">
                        <div class="col-sm-6"></div>
                        <div class="col-sm-6"></div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                <thead>
                                    <tr role="row">
                                        <th tabindex="0"><input type="checkbox" /></th>
                                        <th class="sorting_asc" tabindex="1" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="skill: activate to sort column descending">Compétence</th>
                                        <th class="sorting_asc" tabindex="2" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="subSkill: activate to sort column descending">Sous-compétence</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Dynamic data display -->
                                    <tr>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->
        </div>
        <div ng-show="skmCtrl.show" class="box box-primary">
            <br>
            <form>
                <label>Nouvelle compétence : </label>
                <input type="text" ng-model="skmCtrl.skillInput">
                <br><br>
                <label>Nouvelle sous-compétence : </label>
                <input type="text" ng-model="skmCtrl.subSkillInput">
                <br><br>
                <input type="button" class="btn btn-sm btn-info btn-flat pull-left" value="Ajouter une sous-compétence" ng-click="skmCtrl.addSubSkill()"/>
                <br><br>
            </form>
        </div>

        <div><a href="" class="btn btn-sm btn-info btn-flat pull-left">Modifier compétence</a></div>
        <div><a href="" class="btn btn-sm btn-info btn-flat pull-left" ng-click="skmCtrl.showPanel()">Ajouter compétence</a></div>

    </div>
</body>

</html>
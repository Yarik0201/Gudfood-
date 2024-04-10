namespace ALProject.ALProject;

permissionset 50100 "Gudfood Permissions"
{
    Assignable = true;
    Caption = 'Gudfood Permissions', MaxLength = 30;
    Permissions =
        tabledata "Gudfood Order Header" = RMID,
        tabledata "Gudfood Item" = RMID,
        tabledata "Gudfood Order Line" = RMID,
        tabledata "Posted Gudfood Order Header" = RMID,
        tabledata "Posted Gudfood Order Line" = RMID;
}

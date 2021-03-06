unit UnitFunction;

interface

  uses Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
   System.SysUtils;


  procedure isValidField(Form: TForm);
  function ValidarEMail(aStr: string): Boolean;

implementation


function ValidarEMail(aStr: string): Boolean;
begin
  aStr := Trim(UpperCase(aStr));

  if Pos('@', aStr) > 1 then
  begin
    Delete(aStr, 1, pos('@', aStr));
    Result := (Length(aStr) > 0) and (Pos('.', aStr) > 2);
  end
  else
    Result := False;
end;

procedure isValidField(Form: TForm);
var I: Integer;
begin

  for I := 0 to Form.ComponentCount - 1 do
  begin

    if Form.Components[I].Tag =   1 then
    begin
      if (TEdit(Form.Components[I]).Text = '') or (Length(TEdit(Form.Components[I]).Text) < 3) then
      begin

        ShowMessage('Campo '+TEdit(Form.Components[I]).Hint+' Obrigatório ');

        TEdit(Form.Components[I]).SetFocus;

        Abort;

      end;

      if (TComboBox(Form.Components[I]).Text = '') and
       (TComboBox(Form.Components[I]).Tag = 1) then
      begin

        ShowMessage('Campo '+TComboBox(Form.Components[I]).Hint+' Obrigatório ');

        TComboBox(Form.Components[I]).SetFocus;

        Abort;

      end;

      if (TMaskEdit(Form.Components[I]).Text = '') and
        (TMaskEdit(Form.Components[I]).Tag = 1) then
      begin

        ShowMessage('Campo '+TMaskEdit(Form.Components[I]).Hint+' Obrigatório ');

        TMaskEdit(Form.Components[I]).SetFocus;

        Abort;

      end;
    end;
  end;

end;

end.

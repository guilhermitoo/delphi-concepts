unit uRttiExample;

interface

uses
  System.Generics.Collections, System.Rtti, FireDAC.Comp.Client, System.TypInfo;

type

{

CREATE TABLE PRODUCTS
(
  PRODUCT_ID integer NOT NULL,
  DESCRIPTION varchar(100) NOT NULL,
  COST decimal(18,5),
  CATEGORY varchar(25),
  CONSTRAINT INTEG_2 PRIMARY KEY (PRODUCT_ID)
);

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON PRODUCTS TO  SYSDBA WITH GRANT OPTION;

}

  TDBFieldAttribute = class(TCustomAttribute)
  private
    FFieldName: String;
  public
    property FieldName: String read FFieldName write FFieldName;

    constructor Create(const AFieldName : String);
  end;

  [TDBFieldAttribute('PRODUCTS')]
  TProduct = class
  protected
    function GetDescription : string;
  private
    FProductID: Integer;
    FDescription: string;
    FCost: Currency;
    FCategory: String;
  public
    [TDBFieldAttribute('PRODUCT_ID')]
    property ProductID : Integer read FProductID write FProductID;
    [TDBFieldAttribute('DESCRIPTION')]    
    property Description : string read FDescription write FDescription;
    [TDBFieldAttribute('COST')]
    property Cost: Currency read FCost write FCost;
    [TDBFieldAttribute('CATEGORY')]    
    property Category: String read FCategory write FCategory;
  end;

  TProductList = TObjectList<TProduct>;
  
  TDataLoader = class
  private
    class function GetTableName(AClass: TClass): string;
  public
    class function LoadProducts(AQuery: TFDQuery): TProductList;
    class function Insert<T : class>(ARecord : T; AQuery: TFDQuery): Boolean;
  end;
  
implementation

uses
  System.SysUtils, System.Classes;

{ TDBFieldAttribute }

constructor TDBFieldAttribute.Create(const AFieldName: String);
begin
  inherited Create;
  FieldName := AFieldName;
end;

{ TProduct }

function TProduct.GetDescription : string;
begin
  Result := Description;
end;

{ TDataLoader }

class function TDataLoader.GetTableName(AClass: TClass): string;
var
  ctx: TRttiContext;
  typ: TRttiType;
  attr: TCustomAttribute;
begin
  ctx := TRttiContext.Create;
  try
    typ := ctx.GetType(AClass);
    for attr in typ.GetAttributes do
      if attr is TDBFieldAttribute then
        Exit(TDBFieldAttribute(attr).FieldName);
    Result := '';
  finally
    ctx.Free;
  end;
end;

class function TDataLoader.Insert<T>(ARecord : T; AQuery: TFDQuery): Boolean;
var
  ctx: TRttiContext;
  tableName : string;
  prop : TRttiProperty;
  typ : TRttiType;
  attr : TCustomAttribute;
  fields, values : TStringList;
  params : Array of Variant;
  sSQL : string;
  i : Integer;
begin
  // iterate through the object getting the fields names and put together in a insert command
  ctx := TRttiContext.Create;
  try
    tableName := GetTableName(TObject(ARecord).ClassType);

    fields := TStringList.Create;
    try
      fields.StrictDelimiter := True;
      fields.Delimiter := ',';
      values := TStringList.Create;
      try
        values.StrictDelimiter := True;
        values.Delimiter := ',';       
        
        typ := ctx.GetType(TProduct);
        SetLength(params,Length(typ.GetProperties));
        
        i := 0;
        for prop in typ.GetProperties do
        begin
          for attr in prop.GetAttributes do
            if attr is TDBFieldAttribute then
            begin
              fields.Add(TDBFieldAttribute(attr).FieldName);
              values.Add(':p'+TDBFieldAttribute(attr).FieldName);
            end;
          params[i] := prop.GetValue(TObject(ARecord)).AsVariant;
          i := i + 1;
        end;

        sSQL := 'insert into '+tableName+' ('+fields.DelimitedText+') values ('+values.DelimitedText+')';
        AQuery.Params.Clear;
        Result := AQuery.ExecSQL(sSQL,params) > 0;
      finally
        values.Free;
      end;
    finally
      fields.Free;
    end;      
  finally
    ctx.Free;
  end;
end;

class function TDataLoader.LoadProducts(AQuery: TFDQuery): TProductList;
var
  ctx: TRttiContext;
  typ: TRttiType;
  prop: TRttiProperty;
  attr: TCustomAttribute;
  product: TProduct;
  fieldMap: TDictionary<string, TRttiProperty>;
  fieldName: string;
  tableName: string;
begin
  Result := TProductList.Create(True);
  ctx := TRttiContext.Create;
  try
    tableName := GetTableName(TProduct);
    if tableName.IsEmpty then
      raise Exception.Create('Table name not specified for TProduct class');

    AQuery.Open('SELECT * FROM ' + tableName);

    typ := ctx.GetType(TProduct);
    fieldMap := TDictionary<string, TRttiProperty>.Create;
    try
      for prop in typ.GetProperties do
        for attr in prop.GetAttributes do
          if attr is TDBFieldAttribute then
            fieldMap.Add(TDBFieldAttribute(attr).FieldName, prop);

      while not AQuery.Eof do
      begin
        product := TProduct.Create;
        try
          for fieldName in fieldMap.Keys do
          begin
            prop := fieldMap[fieldName];
            
            case prop.PropertyType.TypeKind of
              tkInteger:
                prop.SetValue(product, AQuery.FieldByName(fieldName).AsInteger);
              tkUString:
                prop.SetValue(product, AQuery.FieldByName(fieldName).AsString);
              tkFloat:
                if prop.PropertyType.Name = 'TDate' then
                  prop.SetValue(product, AQuery.FieldByName(fieldName).AsDateTime)
                else if prop.PropertyType.Name = 'Currency' then
                  prop.SetValue(product, AQuery.FieldByName(fieldName).AsCurrency)
                else
                  prop.SetValue(product, AQuery.FieldByName(fieldName).AsFloat);
              tkEnumeration:
                if prop.PropertyType.Name = 'Boolean' then
                  prop.SetValue(product, AQuery.FieldByName(fieldName).AsBoolean);
            end;
          end;
          Result.Add(product);
        except
          product.Free;
          raise;
        end;
        AQuery.Next;
      end;
    finally
      fieldMap.Free;
    end;
    AQuery.Close;
  finally
    ctx.Free;
  end;
end;

end.

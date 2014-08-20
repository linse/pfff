
(* generated by ocamltarzan with: camlp4o -o /tmp/yyy.ml -I pa/ pa_type_conv.cmo pa_vof.cmo  pr_o.cmo /tmp/xxx.ml  *)
open Ast_c

let vof_info x = Parse_info.vof_info x
let vof_wrap _of_a (v1, v2) =
  let v1 = _of_a v1
  and _v2TODO = vof_info v2
  in
  Ocaml.VTuple [ v1 (* ; v2 *) ]

and vof_unaryOp =
  function
  | Ast_cpp.GetRef -> Ocaml.VSum (("GetRef", []))
  | Ast_cpp.DeRef -> Ocaml.VSum (("DeRef", []))
  | Ast_cpp.UnPlus -> Ocaml.VSum (("UnPlus", []))
  | Ast_cpp.UnMinus -> Ocaml.VSum (("UnMinus", []))
  | Ast_cpp.Tilde -> Ocaml.VSum (("Tilde", []))
  | Ast_cpp.Not -> Ocaml.VSum (("Not", []))
  | Ast_cpp.GetRefLabel -> Ocaml.VSum (("GetRefLabel", []))

let rec vof_assignOp =
  function
  | Ast_cpp.SimpleAssign -> Ocaml.VSum (("SimpleAssign", []))
  | Ast_cpp.OpAssign v1 ->
      let v1 = vof_arithOp v1 in Ocaml.VSum (("OpAssign", [ v1 ]))
and vof_fixOp =
  function
  | Ast_cpp.Dec -> Ocaml.VSum (("Dec", []))
  | Ast_cpp.Inc -> Ocaml.VSum (("Inc", []))
and vof_binaryOp =
  function
  | Ast_cpp.Arith v1 -> let v1 = vof_arithOp v1 in Ocaml.VSum (("Arith", [ v1 ]))
  | Ast_cpp.Logical v1 ->
      let v1 = vof_logicalOp v1 in Ocaml.VSum (("Logical", [ v1 ]))
and vof_arithOp =
  function
  | Ast_cpp.Plus -> Ocaml.VSum (("Plus", []))
  | Ast_cpp.Minus -> Ocaml.VSum (("Minus", []))
  | Ast_cpp.Mul -> Ocaml.VSum (("Mul", []))
  | Ast_cpp.Div -> Ocaml.VSum (("Div", []))
  | Ast_cpp.Mod -> Ocaml.VSum (("Mod", []))
  | Ast_cpp.DecLeft -> Ocaml.VSum (("DecLeft", []))
  | Ast_cpp.DecRight -> Ocaml.VSum (("DecRight", []))
  | Ast_cpp.And -> Ocaml.VSum (("And", []))
  | Ast_cpp.Or -> Ocaml.VSum (("Or", []))
  | Ast_cpp.Xor -> Ocaml.VSum (("Xor", []))
and vof_logicalOp =
  function
  | Ast_cpp.Inf -> Ocaml.VSum (("Inf", []))
  | Ast_cpp.Sup -> Ocaml.VSum (("Sup", []))
  | Ast_cpp.InfEq -> Ocaml.VSum (("InfEq", []))
  | Ast_cpp.SupEq -> Ocaml.VSum (("SupEq", []))
  | Ast_cpp.Eq -> Ocaml.VSum (("Eq", []))
  | Ast_cpp.NotEq -> Ocaml.VSum (("NotEq", []))
  | Ast_cpp.AndLog -> Ocaml.VSum (("AndLog", []))
  | Ast_cpp.OrLog -> Ocaml.VSum (("OrLog", []))


let vof_name v = vof_wrap Ocaml.vof_string v
  
let rec vof_type_ =
  function
  | TBase v1 -> let v1 = vof_name v1 in Ocaml.VSum (("TBase", [ v1 ]))
  | TPointer v1 -> let v1 = vof_type_ v1 in Ocaml.VSum (("TPointer", [ v1 ]))
  | TArray ((v1, v2)) ->
      let v1 = Ocaml.vof_option vof_const_expr v1
      and v2 = vof_type_ v2
      in Ocaml.VSum (("TArray", [ v1; v2 ]))
  | TFunction v1 ->
      let v1 = vof_function_type v1 in Ocaml.VSum (("TFunction", [ v1 ]))
  | TStructName ((v1, v2)) ->
      let v1 = vof_struct_kind v1
      and v2 = vof_name v2
      in Ocaml.VSum (("TStructName", [ v1; v2 ]))
  | TEnumName v1 ->
      let v1 = vof_name v1 in Ocaml.VSum (("TEnumName", [ v1 ]))
  | TTypeName v1 ->
      let v1 = vof_name v1 in Ocaml.VSum (("TTypeName", [ v1 ]))
and vof_function_type (v1, v2) =
  let v1 = vof_type_ v1
  and v2 = Ocaml.vof_list vof_parameter v2
  in Ocaml.VTuple [ v1; v2 ]
and vof_parameter { p_type = v_p_type; p_name = v_p_name } =
  let bnds = [] in
  let arg = Ocaml.vof_option vof_name v_p_name in
  let bnd = ("p_name", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_type_ v_p_type in
  let bnd = ("p_type", arg) in let bnds = bnd :: bnds in Ocaml.VDict bnds
and vof_struct_kind =
  function
  | Struct -> Ocaml.VSum (("Struct", []))
  | Union -> Ocaml.VSum (("Union", []))
and vof_const_expr v = vof_expr v
  
and vof_expr =
  function
  | Int v1 ->
      let v1 = vof_wrap Ocaml.vof_string v1 in Ocaml.VSum (("Int", [ v1 ]))
  | Float v1 ->
      let v1 = vof_wrap Ocaml.vof_string v1 in Ocaml.VSum (("Float", [ v1 ]))
  | String v1 ->
      let v1 = vof_wrap Ocaml.vof_string v1
      in Ocaml.VSum (("String", [ v1 ]))
  | Char v1 ->
      let v1 = vof_wrap Ocaml.vof_string v1 in Ocaml.VSum (("Char", [ v1 ]))
  | Id v1 -> let v1 = vof_name v1 in Ocaml.VSum (("Id", [ v1 ]))
  | Call ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = Ocaml.vof_list vof_expr v2
      in Ocaml.VSum (("Call", [ v1; v2 ]))
  | Assign ((v1, v2, v3)) ->
      let v1 = vof_assignOp v1
      and v2 = vof_expr v2
      and v3 = vof_expr v3
      in Ocaml.VSum (("Assign", [ v1; v2; v3 ]))
  | ArrayAccess ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("ArrayAccess", [ v1; v2 ]))
  | RecordAccess ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = vof_name v2
      in Ocaml.VSum (("RecordAccess", [ v1; v2 ]))
  | Cast ((v1, v2)) ->
      let v1 = vof_type_ v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Cast", [ v1; v2 ]))
  | Postfix ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = vof_fixOp v2
      in Ocaml.VSum (("Postfix", [ v1; v2 ]))
  | Infix ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = vof_fixOp v2
      in Ocaml.VSum (("Infix", [ v1; v2 ]))
  | Unary ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = vof_unaryOp v2
      in Ocaml.VSum (("Unary", [ v1; v2 ]))
  | Binary ((v1, v2, v3)) ->
      let v1 = vof_expr v1
      and v2 = vof_binaryOp v2
      and v3 = vof_expr v3
      in Ocaml.VSum (("Binary", [ v1; v2; v3 ]))
  | CondExpr ((v1, v2, v3)) ->
      let v1 = vof_expr v1
      and v2 = vof_expr v2
      and v3 = vof_expr v3
      in Ocaml.VSum (("CondExpr", [ v1; v2; v3 ]))
  | Sequence ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Sequence", [ v1; v2 ]))
  | SizeOf v1 ->
      let v1 = Ocaml.vof_either vof_expr vof_type_ v1
      in Ocaml.VSum (("SizeOf", [ v1 ]))
  | ArrayInit v1 ->
      let v1 =
        Ocaml.vof_list
          (fun (v1, v2) ->
             let v1 = Ocaml.vof_option vof_expr v1
             and v2 = vof_expr v2
             in Ocaml.VTuple [ v1; v2 ])
          v1
      in Ocaml.VSum (("ArrayInit", [ v1 ]))
  | RecordInit v1 ->
      let v1 =
        Ocaml.vof_list
          (fun (v1, v2) ->
             let v1 = vof_name v1
             and v2 = vof_expr v2
             in Ocaml.VTuple [ v1; v2 ])
          v1
      in Ocaml.VSum (("RecordInit", [ v1 ]))
  | GccConstructor ((v1, v2)) ->
      let v1 = vof_type_ v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("GccConstructor", [ v1; v2 ]))
  
let rec vof_stmt =
  function
  | ExprSt v1 -> let v1 = vof_expr v1 in Ocaml.VSum (("ExprSt", [ v1 ]))
  | Block v1 ->
      let v1 = Ocaml.vof_list vof_stmt v1 in Ocaml.VSum (("Block", [ v1 ]))
  | If ((v1, v2, v3)) ->
      let v1 = vof_expr v1
      and v2 = vof_stmt v2
      and v3 = vof_stmt v3
      in Ocaml.VSum (("If", [ v1; v2; v3 ]))
  | Switch ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = Ocaml.vof_list vof_case v2
      in Ocaml.VSum (("Switch", [ v1; v2 ]))
  | While ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = vof_stmt v2
      in Ocaml.VSum (("While", [ v1; v2 ]))
  | DoWhile ((v1, v2)) ->
      let v1 = vof_stmt v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("DoWhile", [ v1; v2 ]))
  | For ((v1, v2, v3, v4)) ->
      let v1 = Ocaml.vof_option vof_expr v1
      and v2 = Ocaml.vof_option vof_expr v2
      and v3 = Ocaml.vof_option vof_expr v3
      and v4 = vof_stmt v4
      in Ocaml.VSum (("For", [ v1; v2; v3; v4 ]))
  | Return v1 ->
      let v1 = Ocaml.vof_option vof_expr v1
      in Ocaml.VSum (("Return", [ v1 ]))
  | Continue -> Ocaml.VSum (("Continue", []))
  | Break -> Ocaml.VSum (("Break", []))
  | Label ((v1, v2)) ->
      let v1 = vof_name v1
      and v2 = vof_stmt v2
      in Ocaml.VSum (("Label", [ v1; v2 ]))
  | Goto v1 -> let v1 = vof_name v1 in Ocaml.VSum (("Goto", [ v1 ]))
  | Vars v1 ->
      let v1 = Ocaml.vof_list vof_var_decl v1
      in Ocaml.VSum (("Vars", [ v1 ]))
  | Asm v1 ->
      let v1 = Ocaml.vof_list vof_expr v1 in Ocaml.VSum (("Asm", [ v1 ]))
and vof_case =
  function
  | Case ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = Ocaml.vof_list vof_stmt v2
      in Ocaml.VSum (("Case", [ v1; v2 ]))
  | Default v1 ->
      let v1 = Ocaml.vof_list vof_stmt v1 in Ocaml.VSum (("Default", [ v1 ]))
and
  vof_var_decl {
                 v_name = v_v_name;
                 v_type = v_v_type;
                 v_storage = v_v_storage;
                 v_init = v_v_init
               } =
  let bnds = [] in
  let arg = Ocaml.vof_option vof_initialiser v_v_init in
  let bnd = ("v_init", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_storage v_v_storage in
  let bnd = ("v_storage", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_type_ v_v_type in
  let bnd = ("v_type", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_name v_v_name in
  let bnd = ("v_name", arg) in let bnds = bnd :: bnds in Ocaml.VDict bnds
and vof_initialiser v = vof_expr v
and vof_storage =
  function
  | Extern -> Ocaml.VSum (("Extern", []))
  | Static -> Ocaml.VSum (("Static", []))
  | DefaultStorage -> Ocaml.VSum (("DefaultStorage", []))
  
let vof_func_def 
    { f_name = v_f_name; f_type = v_f_type; f_body = v_f_body; 
      f_static = v_f_static }
                 =
  let bnds = [] in
  let arg = Ocaml.vof_list vof_stmt v_f_body in
  let bnd = ("f_body", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_function_type v_f_type in
  let bnd = ("f_type", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_name v_f_name in
  let bnd = ("f_name", arg) in 
  let bnds = bnd :: bnds in 
  let arg = Ocaml.vof_bool v_f_static in
  let bnd = ("f_static", arg) in 
  let bnds = bnd :: bnds in 
  Ocaml.VDict bnds
  
and vof_field_def { fld_name = v_fld_name; fld_type = v_fld_type } =
  let bnds = [] in
  let arg = vof_type_ v_fld_type in
  let bnd = ("fld_type", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_option vof_name v_fld_name in
  let bnd = ("fld_name", arg) in let bnds = bnd :: bnds in Ocaml.VDict bnds
  
let vof_enum_def (v1, v2) =
  let v1 = vof_name v1
  and v2 =
    Ocaml.vof_list
      (fun (v1, v2) ->
         let v1 = vof_name v1
         and v2 = Ocaml.vof_option vof_expr v2
         in Ocaml.VTuple [ v1; v2 ])
      v2
  in Ocaml.VTuple [ v1; v2 ]
  
let vof_type_def (v1, v2) =
  let v1 = vof_name v1 and v2 = vof_type_ v2 in Ocaml.VTuple [ v1; v2 ]
  
let vof_define_body =
  function
  | CppExpr v1 -> let v1 = vof_expr v1 in Ocaml.VSum (("CppExpr", [ v1 ]))
  | CppStmt v1 -> let v1 = vof_stmt v1 in Ocaml.VSum (("CppStmt", [ v1 ]))
(*  | CppEmpty -> Ocaml.VSum (("CppEmpty", [])) *)

let
  vof_struct_def { s_name = v_s_name; s_kind = v_s_kind; s_flds = v_s_flds }
                 =
  let bnds = [] in
  let arg = Ocaml.vof_list vof_field_def v_s_flds in
  let bnd = ("s_flds", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_struct_kind v_s_kind in
  let bnd = ("s_kind", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_name v_s_name in
  let bnd = ("s_name", arg) in let bnds = bnd :: bnds in Ocaml.VDict bnds

 
let vof_toplevel =
  function
  | Define ((v1, v2)) ->
      let v1 = vof_name v1
      and v2 = vof_define_body v2
      in Ocaml.VSum (("Define", [ v1; v2 ]))
(*  | Undef v1 -> let v1 = vof_name v1 in Ocaml.VSum (("Undef", [ v1 ])) *)
  | Include v1 ->
      let v1 = vof_wrap Ocaml.vof_string v1
      in Ocaml.VSum (("Include", [ v1 ]))
  | Macro ((v1, v2, v3)) ->
      let v1 = vof_name v1
      and v2 = Ocaml.vof_list vof_name v2
      and v3 = vof_define_body v3
      in Ocaml.VSum (("Macro", [ v1; v2; v3 ]))
  | StructDef v1 ->
      let v1 = vof_struct_def v1 in Ocaml.VSum (("StructDef", [ v1 ]))
  | TypeDef v1 ->
      let v1 = vof_type_def v1 in Ocaml.VSum (("TypeDef", [ v1 ]))
  | EnumDef v1 ->
      let v1 = vof_enum_def v1 in Ocaml.VSum (("EnumDef", [ v1 ]))
  | FuncDef v1 ->
      let v1 = vof_func_def v1 in Ocaml.VSum (("FuncDef", [ v1 ]))
  | Global v1 -> let v1 = vof_var_decl v1 in Ocaml.VSum (("Global", [ v1 ]))
  | Prototype v1 ->
      let v1 = vof_func_def v1 in Ocaml.VSum (("Prototype", [ v1 ]))
  
let vof_program v = Ocaml.vof_list vof_toplevel v
  
let vof_any =
  function
  | Expr v1 -> let v1 = vof_expr v1 in Ocaml.VSum (("Expr", [ v1 ]))
  | Stmt v1 -> let v1 = vof_stmt v1 in Ocaml.VSum (("Stmt", [ v1 ]))
  | Type v1 -> let v1 = vof_type_ v1 in Ocaml.VSum (("Type", [ v1 ]))
  | Toplevel v1 ->
      let v1 = vof_toplevel v1 in Ocaml.VSum (("Toplevel", [ v1 ]))
  | Program v1 -> let v1 = vof_program v1 in Ocaml.VSum (("Program", [ v1 ]))
  

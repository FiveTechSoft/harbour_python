function Main()

   local hModule, hFunc, hNum, hResult

   Py_Initialize()
   hModule := PyImport_ImportModule( "math" ) 
   hFunc := PyObject_GetAttrString( hModule, "sqrt" ) 
   hNum := PyFloat_FromDouble( 123 ) 
   hResult := PyObject_CallFunctionObjArgs( hFunc, hNum ) 
   ? PyFloat_AsDouble( hResult )
   Py_Decref( hNum )
   Py_Decref( hFunc )
   Py_Decref( hModule )
   Py_Finalize()
   ? "ok"

return nil
function Main()

   local hList1, hList2, hModule, hFunc1, hFunc2, hResult

   Py_Initialize()
   hList1 = PyList_New( 5 )
   PyList_SetItem( hList1, 0, PyFloat_FromDouble( 1 ) )
   PyList_SetItem( hList1, 1, PyFloat_FromDouble( 2 ) )
   PyList_SetItem( hList1, 2, PyFloat_FromDouble( 3 ) )
   PyList_SetItem( hList1, 3, PyFloat_FromDouble( 4 ) )
   PyList_SetItem( hList1, 4, PyFloat_FromDouble( 5 ) )

   hList2 = PyList_New( 5 )
   PyList_SetItem( hList2, 0, PyFloat_FromDouble( 1 ) )
   PyList_SetItem( hList2, 1, PyFloat_FromDouble( 4 ) )
   PyList_SetItem( hList2, 2, PyFloat_FromDouble( 9 ) )
   PyList_SetItem( hList2, 3, PyFloat_FromDouble( 16 ) )
   PyList_SetItem( hList2, 4, PyFloat_FromDouble( 25 ) )

   hModule = PyImport_ImportModule( "matplotlib.pyplot" ) 
   hFunc1 = PyObject_GetAttrString( hModule, "plot" ) 
   hResult = PyObject_CallFunctionObjArgs( hFunc1, hList1, hList2 )

   hFunc2 = PyObject_GetAttrString( hModule, "show" ) 
   hResult = PyObject_CallFunctionObjArgs( hFunc2 )

   Py_Decref( hList1 )
   Py_Decref( hList2 )
   Py_Finalize()

return nil
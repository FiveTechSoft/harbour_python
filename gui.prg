function Main()

   local hTk, hWnd

   Py_Initialize()

   hTk = PyImport_ImportModule( "tkinter" ) 
   hWnd = PyObject_CallMethod( hTk, "Tk" )
   PyObject_CallMethod( hWnd, "title", "O", PyUnicode_FromString( "My Window Title" ) )
   PyObject_CallMethod( hWnd, "mainloop" )

   Py_Finalize()

return nil
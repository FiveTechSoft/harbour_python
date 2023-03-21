#include "FiveWin.ch"

function Main()

   local hModule, hFunc, hNum, hResult

   Py_Initialize()
   hModule := PyImport_ImportModule( "math" ) 
   hFunc := PyObject_GetAttrString( hModule, "sqrt" ) 
   hNum := PyFloat_FromDouble( 123 ) 
   hResult := PyObject_CallFunctionObjArgs( hFunc, hNum ) 
   MsgInfo( PyFloat_AsDouble( hResult ) )
   Py_Decref( hNum )
   Py_Decref( hFunc )
   Py_Decref( hModule )
   Py_Finalize()
   MsgInfo( "ok" )

return nil

#pragma BEGINDUMP

#include <hbapi.h>

void Py_Initialize( void );
void * PyImport_ImportModule( const char * szModuleName );
void * PyObject_GetAttrString( void * module, const char * cFuncName );
void * PyFloat_FromDouble( double dbl );
void * PyObject_CallFunctionObjArgs( void * callable, ... );
double PyFloat_AsDouble( void * result );
void Py_Finalize( void );
void Py_DecRef( void * o );

HB_FUNC( PY_INITIALIZE )
{
   Py_Initialize();
}

HB_FUNC( PYIMPORT_IMPORTMODULE )
{
   hb_retptr( PyImport_ImportModule( hb_parc( 1 ) ) );
}

HB_FUNC( PYOBJECT_GETATTRSTRING )
{
   hb_retptr( PyObject_GetAttrString( hb_parptr( 1 ), hb_parc( 2 ) ) );
}

HB_FUNC( PYFLOAT_FROMDOUBLE )
{
   hb_retptr( PyFloat_FromDouble( hb_parnd( 1 ) ) );
}

HB_FUNC( PYOBJECT_CALLFUNCTIONOBJARGS )
{
   hb_retptr( PyObject_CallFunctionObjArgs( hb_parptr( 1 ), hb_parptr( 2 ), NULL ) );
}

HB_FUNC( PYFLOAT_ASDOUBLE )
{
   hb_retnd( PyFloat_AsDouble( hb_parptr( 1 ) ) );   
}

HB_FUNC( PY_FINALIZE )
{
   Py_Finalize();
}

HB_FUNC( PY_DECREF )
{
   Py_DecRef( hb_parptr( 1 ) );
}

#pragma ENDDUMP
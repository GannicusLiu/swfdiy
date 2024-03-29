package com.swfdiy.data.ABC
{
	import com.swfdiy.data.ABC.Constant;
	import com.swfdiy.data.ABC.Global;
	import com.swfdiy.data.ABCStream;
	public class NamespaceSet
	{
		public var count:int;
		public var ns:Array;
		
		
		
		public function NamespaceSet(_count:int, _ns:Array) :void
		{
			count = _count;
			ns = _ns;
			
		}		
		
		public function nameStrList():Array {
			var strList:Array = [];
			for (var i:int=0;i <count;i++) {
				strList.push( ns[i] + "," + Global.NAMESPACE( ns[i] ).nameStr() ); 
				
			}
			return strList;
		}
		
		public function dump(pre:String = "", indent:String="    ") :String {	
			var str:String = "";
			str += pre + "count=" + count + "\n";
			
			
			
			for (var i:int=0;i <count;i++) {
				str += pre + indent + indent + i.toString() ; 
				str += nameStrList().join("|")  + "\n"; 
			}
			return str;
		}
	}
}
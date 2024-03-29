package com.swfdiy.data.ABC
{
	import com.swfdiy.data.ABC.Constant;
	import com.swfdiy.data.ABC.Trait;
	import com.swfdiy.data.ABCStream;
	public class InstanceInfo
	{
		public var name:int;
		public var super_name:int;
		public var flags:int;
		public var protectedNs:int;
		public var intrf_count:int;
		public var interfaces:Array;
		public var iint:int;
		public var trait_count:int;
		public var traits:Array;
		
		
		public function InstanceInfo(stream:ABCStream)
		{
			var i:int;
			name = stream.read_u32();
			super_name = stream.read_u32();
			flags = stream.read_u8();
			
			if (flags & Constant.CONSTANT_ClassProtectedNs) {
				protectedNs = stream.read_u32();	
			}
					
			intrf_count = stream.read_u32();
			interfaces = [];
			for (i=0;i<intrf_count;i++) {
				interfaces[i] = stream.read_u32();
			}
			
			iint = stream.read_u32();
			
			trait_count = stream.read_u32();
			traits = [];
			for (i=0;i<trait_count;i++) {
				traits[i] = new Trait(stream);
			}
			
		}
		
		public function nameStr():String {
			return Global.MULTINAME(name);
		}
		
		
		public function dump(pre:String = "", indent:String="    ") :String {
			var str:String = "";
			
			str += pre + "name:" + nameStr() + "\n";
			str += pre + "super_name:" + Global.MULTINAME(super_name) + "\n";
			str += pre + "flags:"  + flags  + "\n";
			
			if (flags & Constant.CONSTANT_ClassProtectedNs) {
				str += pre + "protectedNs:"  + Global.NAMESPACE(protectedNs).nameStr()  + "\n";
			}
			
			str += pre + "interafce count:"  + intrf_count  + "\n";
			
			var i :int;
			for (i=0;i<intrf_count;i++) {				
				str += pre + indent + Global.MULTINAME( interfaces[i] ) + "\n";
			}
			
			str += pre + "iint:"  + iint  + "\n";
			
			str += pre + "trait_count:"  + trait_count  + "\n";
			
			for (i=0;i<trait_count;i++) {				
				str += traits[i].dump(pre +indent, indent) + "\n";
			}
			
			return str;
		}
	}
}
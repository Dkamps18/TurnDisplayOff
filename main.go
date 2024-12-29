package main

import "syscall"

func main() {
	syscall.NewLazyDLL("user32").NewProc("SendMessageW").Call(0xFFFF, 0x0112, 0xF170, 2)
}

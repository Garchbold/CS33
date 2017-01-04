	.file	"thttpd.c"
	.bss
	.align 32
	.type	argv0, @object
	.size	argv0, 8
argv0:
	.zero	64
	.align 32
	.type	debug, @object
	.size	debug, 4
debug:
	.zero	64
	.align 32
	.type	port, @object
	.size	port, 2
port:
	.zero	64
	.align 32
	.type	dir, @object
	.size	dir, 8
dir:
	.zero	64
	.align 32
	.type	data_dir, @object
	.size	data_dir, 8
data_dir:
	.zero	64
	.align 32
	.type	do_chroot, @object
	.size	do_chroot, 4
do_chroot:
	.zero	64
	.align 32
	.type	no_log, @object
	.size	no_log, 4
no_log:
	.zero	64
	.align 32
	.type	no_symlink_check, @object
	.size	no_symlink_check, 4
no_symlink_check:
	.zero	64
	.align 32
	.type	do_vhost, @object
	.size	do_vhost, 4
do_vhost:
	.zero	64
	.align 32
	.type	do_global_passwd, @object
	.size	do_global_passwd, 4
do_global_passwd:
	.zero	64
	.align 32
	.type	cgi_pattern, @object
	.size	cgi_pattern, 8
cgi_pattern:
	.zero	64
	.align 32
	.type	cgi_limit, @object
	.size	cgi_limit, 4
cgi_limit:
	.zero	64
	.align 32
	.type	url_pattern, @object
	.size	url_pattern, 8
url_pattern:
	.zero	64
	.align 32
	.type	no_empty_referers, @object
	.size	no_empty_referers, 4
no_empty_referers:
	.zero	64
	.align 32
	.type	local_pattern, @object
	.size	local_pattern, 8
local_pattern:
	.zero	64
	.align 32
	.type	logfile, @object
	.size	logfile, 8
logfile:
	.zero	64
	.align 32
	.type	throttlefile, @object
	.size	throttlefile, 8
throttlefile:
	.zero	64
	.align 32
	.type	hostname, @object
	.size	hostname, 8
hostname:
	.zero	64
	.align 32
	.type	pidfile, @object
	.size	pidfile, 8
pidfile:
	.zero	64
	.align 32
	.type	user, @object
	.size	user, 8
user:
	.zero	64
	.align 32
	.type	charset, @object
	.size	charset, 8
charset:
	.zero	64
	.align 32
	.type	p3p, @object
	.size	p3p, 8
p3p:
	.zero	64
	.align 32
	.type	max_age, @object
	.size	max_age, 4
max_age:
	.zero	64
	.align 32
	.type	throttles, @object
	.size	throttles, 8
throttles:
	.zero	64
	.align 32
	.type	numthrottles, @object
	.size	numthrottles, 4
numthrottles:
	.zero	64
	.align 32
	.type	maxthrottles, @object
	.size	maxthrottles, 4
maxthrottles:
	.zero	64
	.align 32
	.type	connects, @object
	.size	connects, 8
connects:
	.zero	64
	.align 32
	.type	num_connects, @object
	.size	num_connects, 4
num_connects:
	.zero	64
	.align 32
	.type	max_connects, @object
	.size	max_connects, 4
max_connects:
	.zero	64
	.align 32
	.type	first_free_connect, @object
	.size	first_free_connect, 4
first_free_connect:
	.zero	64
	.align 32
	.type	httpd_conn_count, @object
	.size	httpd_conn_count, 4
httpd_conn_count:
	.zero	64
	.align 32
	.type	hs, @object
	.size	hs, 8
hs:
	.zero	64
	.globl	terminate
	.align 32
	.type	terminate, @object
	.size	terminate, 4
terminate:
	.zero	64
	.comm	start_time,8,8
	.comm	stats_time,8,8
	.comm	stats_connections,8,8
	.comm	stats_bytes,8,8
	.comm	stats_simultaneous,4,4
	.align 32
	.type	got_hup, @object
	.size	got_hup, 4
got_hup:
	.zero	64
	.align 32
	.type	got_usr1, @object
	.size	got_usr1, 4
got_usr1:
	.zero	64
	.align 32
	.type	watchdog_flag, @object
	.size	watchdog_flag, 4
watchdog_flag:
	.zero	64
	.section	.rodata
	.align 32
.LC0:
	.string	"exiting due to signal %d"
	.zero	39
	.text
	.type	handle_term, @function
handle_term:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	call	shut_down
	movl	-4(%rbp), %eax
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$5, %edi
	movl	$0, %eax
	call	syslog
	call	closelog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE2:
	.size	handle_term, .-handle_term
	.section	.rodata
.LC1:
	.string	"handle_chld 1 32 4 6 status "
	.align 32
.LC2:
	.string	"child wait - %m"
	.zero	48
	.text
	.type	handle_chld, @function
handle_chld:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$136, %rsp
	.cfi_offset 3, -24
	movl	%edi, -132(%rbp)
	leaq	-112(%rbp), %rax
	movq	$1102416563, (%rax)
	movq	$.LC1, 8(%rax)
	shrq	$3, %rax
	leaq	2147450880(%rax), %rbx
	movl	$-235802127, (%rbx)
	movl	$-185273340, 4(%rbx)
	movl	$-202116109, 8(%rbx)
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L3
	movq	%rax, %rdi
	call	__asan_report_load4
.L3:
	movl	(%rdx), %eax
	movl	%eax, -120(%rbp)
.L17:
	leaq	-80(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$-1, %edi
	call	waitpid
	movl	%eax, -116(%rbp)
	cmpl	$0, -116(%rbp)
	jne	.L4
	jmp	.L5
.L4:
	cmpl	$0, -116(%rbp)
	jns	.L6
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L7
	movq	%rax, %rdi
	call	__asan_report_load4
.L7:
	movl	(%rdx), %eax
	cmpl	$4, %eax
	je	.L8
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L9
	movq	%rax, %rdi
	call	__asan_report_load4
.L9:
	movl	(%rdx), %eax
	cmpl	$11, %eax
	jne	.L10
.L8:
	jmp	.L11
.L10:
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L12
	movq	%rax, %rdi
	call	__asan_report_load4
.L12:
	movl	(%rdx), %eax
	cmpl	$10, %eax
	je	.L13
	movl	$.LC2, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
	jmp	.L5
.L13:
	jmp	.L5
.L6:
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L11
	movq	hs(%rip), %rax
	leaq	36(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rdx, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L14
	movq	%rdx, %rdi
	call	__asan_report_load4
.L14:
	movl	36(%rax), %edx
	subl	$1, %edx
	movl	%edx, 36(%rax)
	movq	hs(%rip), %rdx
	leaq	36(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L15
	movq	%rax, %rdi
	call	__asan_report_load4
.L15:
	movl	36(%rdx), %eax
	testl	%eax, %eax
	jns	.L11
	movq	hs(%rip), %rdx
	leaq	36(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L16
	movq	%rax, %rdi
	call	__asan_report_store4
.L16:
	movl	$0, 36(%rdx)
	jmp	.L17
.L11:
	jmp	.L17
.L5:
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L18
	movq	%rax, %rdi
	call	__asan_report_store4
.L18:
	movl	-120(%rbp), %eax
	movl	%eax, (%rdx)
	movq	$0, (%rbx)
	movl	$0, 8(%rbx)
	addq	$136, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	handle_chld, .-handle_chld
	.type	handle_hup, @function
handle_hup:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L20
	movq	%rax, %rdi
	call	__asan_report_load4
.L20:
	movl	(%rdx), %eax
	movl	%eax, -4(%rbp)
	movl	$1, got_hup(%rip)
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L21
	movq	%rax, %rdi
	call	__asan_report_store4
.L21:
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	handle_hup, .-handle_hup
	.section	.rodata
	.align 32
.LC3:
	.string	"exiting"
	.zero	56
	.text
	.type	handle_usr1, @function
handle_usr1:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	num_connects(%rip), %eax
	testl	%eax, %eax
	jne	.L23
	call	shut_down
	movl	$.LC3, %esi
	movl	$5, %edi
	movl	$0, %eax
	call	syslog
	call	closelog
	call	__asan_handle_no_return
	movl	$0, %edi
	call	exit
.L23:
	movl	$1, got_usr1(%rip)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	handle_usr1, .-handle_usr1
	.type	handle_usr2, @function
handle_usr2:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L25
	movq	%rax, %rdi
	call	__asan_report_load4
.L25:
	movl	(%rdx), %eax
	movl	%eax, -4(%rbp)
	movl	$0, %edi
	call	logstats
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L26
	movq	%rax, %rdi
	call	__asan_report_store4
.L26:
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	handle_usr2, .-handle_usr2
	.section	.rodata
	.align 32
.LC4:
	.string	"/tmp"
	.zero	59
	.text
	.type	handle_alrm, @function
handle_alrm:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L28
	movq	%rax, %rdi
	call	__asan_report_load4
.L28:
	movl	(%rdx), %eax
	movl	%eax, -4(%rbp)
	movl	watchdog_flag(%rip), %eax
	testl	%eax, %eax
	jne	.L29
	movl	$.LC4, %edi
	call	chdir
	call	__asan_handle_no_return
	call	abort
.L29:
	movl	$0, watchdog_flag(%rip)
	movl	$360, %edi
	call	alarm
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L30
	movq	%rax, %rdi
	call	__asan_report_store4
.L30:
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	handle_alrm, .-handle_alrm
	.section	.rodata
	.align 32
.LC5:
	.string	"-"
	.zero	62
	.align 32
.LC6:
	.string	"re-opening logfile"
	.zero	45
	.align 32
.LC7:
	.string	"a"
	.zero	62
	.align 32
.LC8:
	.string	"re-opening %.80s - %m"
	.zero	42
	.text
	.type	re_open_logfile, @function
re_open_logfile:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	no_log(%rip), %eax
	testl	%eax, %eax
	jne	.L32
	movq	hs(%rip), %rax
	testq	%rax, %rax
	jne	.L33
.L32:
	jmp	.L31
.L33:
	movq	logfile(%rip), %rax
	testq	%rax, %rax
	je	.L31
	movq	logfile(%rip), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	je	.L31
	movl	$.LC6, %esi
	movl	$5, %edi
	movl	$0, %eax
	call	syslog
	movq	logfile(%rip), %rax
	movl	$.LC7, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	movq	logfile(%rip), %rax
	movl	$384, %esi
	movq	%rax, %rdi
	call	chmod
	movl	%eax, -12(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L35
	cmpl	$0, -12(%rbp)
	je	.L36
.L35:
	movq	logfile(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC8, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	jmp	.L31
.L36:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fileno
	movl	$1, %edx
	movl	$2, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	fcntl
	movq	hs(%rip), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	httpd_set_logfp
.L31:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	re_open_logfile, .-re_open_logfile
	.section	.rodata
	.align 8
.LC9:
	.string	"main 6 32 4 5 gotv4 96 4 5 gotv6 160 16 2 tv 224 128 3 sa4 384 128 3 sa6 544 4097 3 cwd "
	.align 32
.LC10:
	.string	"can't find any valid address"
	.zero	35
	.align 32
.LC11:
	.string	"%s: can't find any valid address\n"
	.zero	62
	.align 32
.LC12:
	.string	"unknown user - '%.80s'"
	.zero	41
	.align 32
.LC13:
	.string	"%s: unknown user - '%s'\n"
	.zero	39
	.align 32
.LC14:
	.string	"/dev/null"
	.zero	54
	.align 32
.LC15:
	.string	"%.80s - %m"
	.zero	53
	.align 32
.LC16:
	.string	"logfile is not an absolute path, you may not be able to re-open it"
	.zero	61
	.align 32
.LC17:
	.string	"%s: logfile is not an absolute path, you may not be able to re-open it\n"
	.zero	56
	.align 32
.LC18:
	.string	"fchown logfile - %m"
	.zero	44
	.align 32
.LC19:
	.string	"fchown logfile"
	.zero	49
	.align 32
.LC20:
	.string	"chdir - %m"
	.zero	53
	.align 32
.LC21:
	.string	"chdir"
	.zero	58
	.align 32
.LC22:
	.string	"/"
	.zero	62
	.align 32
.LC23:
	.string	"daemon - %m"
	.zero	52
	.align 32
.LC24:
	.string	"w"
	.zero	62
	.align 32
.LC25:
	.string	"%d\n"
	.zero	60
	.align 32
.LC26:
	.string	"fdwatch initialization failure"
	.zero	33
	.align 32
.LC27:
	.string	"chroot - %m"
	.zero	52
	.align 32
.LC28:
	.string	"chroot"
	.zero	57
	.align 32
.LC29:
	.string	"logfile is not within the chroot tree, you will not be able to re-open it"
	.zero	54
	.align 32
.LC30:
	.string	"%s: logfile is not within the chroot tree, you will not be able to re-open it\n"
	.zero	49
	.align 32
.LC31:
	.string	"chroot chdir - %m"
	.zero	46
	.align 32
.LC32:
	.string	"chroot chdir"
	.zero	51
	.align 32
.LC33:
	.string	"data_dir chdir - %m"
	.zero	44
	.align 32
.LC34:
	.string	"data_dir chdir"
	.zero	49
	.align 32
.LC35:
	.string	"tmr_create(occasional) failed"
	.zero	34
	.align 32
.LC36:
	.string	"tmr_create(idle) failed"
	.zero	40
	.align 32
.LC37:
	.string	"tmr_create(update_throttles) failed"
	.zero	60
	.align 32
.LC38:
	.string	"tmr_create(show_stats) failed"
	.zero	34
	.align 32
.LC39:
	.string	"setgroups - %m"
	.zero	49
	.align 32
.LC40:
	.string	"setgid - %m"
	.zero	52
	.align 32
.LC41:
	.string	"initgroups - %m"
	.zero	48
	.align 32
.LC42:
	.string	"setuid - %m"
	.zero	52
	.align 32
.LC43:
	.string	"started as root without requesting chroot(), warning only"
	.zero	38
	.align 32
.LC44:
	.string	"out of memory allocating a connecttab"
	.zero	58
	.align 32
.LC45:
	.string	"fdwatch - %m"
	.zero	51
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$4920, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -4836(%rbp)
	movq	%rsi, -4848(%rbp)
	leaq	-4752(%rbp), %rax
	movq	$1102416563, (%rax)
	movq	$.LC9, 8(%rax)
	shrq	$3, %rax
	addq	$2147450880, %rax
	movl	$-235802127, (%rax)
	movl	$-185273340, 4(%rax)
	movl	$-218959118, 8(%rax)
	movl	$-185273340, 12(%rax)
	movl	$-218959118, 16(%rax)
	movl	$-185335808, 20(%rax)
	movl	$-218959118, 24(%rax)
	movl	$-218959118, 44(%rax)
	movl	$-218959118, 64(%rax)
	movl	$-185273343, 580(%rax)
	movl	$-202116109, 584(%rax)
	movl	$32767, -4820(%rbp)
	movl	$32767, -4816(%rbp)
	movq	-4848(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L38
	movq	%rax, %rdi
	call	__asan_report_load8
.L38:
	movq	-4848(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, argv0(%rip)
	movq	argv0(%rip), %rax
	movl	$47, %esi
	movq	%rax, %rdi
	call	strrchr
	movq	%rax, -4800(%rbp)
	cmpq	$0, -4800(%rbp)
	je	.L39
	addq	$1, -4800(%rbp)
	jmp	.L40
.L39:
	movq	argv0(%rip), %rax
	movq	%rax, -4800(%rbp)
.L40:
	movq	-4800(%rbp), %rax
	movl	$24, %edx
	movl	$9, %esi
	movq	%rax, %rdi
	call	openlog
	movq	-4848(%rbp), %rdx
	movl	-4836(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	parse_args
	call	tzset
	leaq	-4656(%rbp), %rsi
	leaq	-4368(%rbp), %rcx
	leaq	-4720(%rbp), %rdx
	leaq	-4528(%rbp), %rax
	movq	%rsi, %r9
	movl	$128, %r8d
	movl	$128, %esi
	movq	%rax, %rdi
	call	lookup_hostname
	movl	-4720(%rbp), %eax
	testl	%eax, %eax
	jne	.L41
	movl	-4656(%rbp), %eax
	testl	%eax, %eax
	jne	.L41
	movl	$.LC10, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movl	$.LC11, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L41:
	movl	$0, numthrottles(%rip)
	movl	$0, maxthrottles(%rip)
	movq	$0, throttles(%rip)
	movq	throttlefile(%rip), %rax
	testq	%rax, %rax
	je	.L42
	movq	throttlefile(%rip), %rax
	movq	%rax, %rdi
	call	read_throttlefile
.L42:
	call	getuid
	testl	%eax, %eax
	jne	.L43
	movq	user(%rip), %rax
	movq	%rax, %rdi
	call	getpwnam
	movq	%rax, -4784(%rbp)
	cmpq	$0, -4784(%rbp)
	jne	.L44
	movq	user(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC12, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movq	user(%rip), %rcx
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movl	$.LC13, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L44:
	movq	-4784(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L45
	movq	%rax, %rdi
	call	__asan_report_load4
.L45:
	movq	-4784(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, -4820(%rbp)
	movq	-4784(%rbp), %rax
	addq	$20, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L46
	movq	%rax, %rdi
	call	__asan_report_load4
.L46:
	movq	-4784(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, -4816(%rbp)
.L43:
	movq	logfile(%rip), %rax
	testq	%rax, %rax
	je	.L47
	movq	logfile(%rip), %rax
	movl	$.LC14, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L48
	movl	$1, no_log(%rip)
	movq	$0, -4792(%rbp)
	jmp	.L55
.L48:
	movq	logfile(%rip), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L50
	movq	stdout(%rip), %rax
	movq	%rax, -4792(%rbp)
	jmp	.L55
.L50:
	movq	logfile(%rip), %rax
	movl	$.LC7, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -4792(%rbp)
	movq	logfile(%rip), %rax
	movl	$384, %esi
	movq	%rax, %rdi
	call	chmod
	movl	%eax, -4808(%rbp)
	cmpq	$0, -4792(%rbp)
	je	.L51
	cmpl	$0, -4808(%rbp)
	je	.L52
.L51:
	movq	logfile(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC15, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movq	logfile(%rip), %rax
	movq	%rax, %rdi
	call	perror
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L52:
	movq	logfile(%rip), %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L53
	movq	%rax, %rdi
	call	__asan_report_load1
.L53:
	movzbl	(%rdx), %eax
	cmpb	$47, %al
	je	.L54
	movl	$.LC16, %esi
	movl	$4, %edi
	movl	$0, %eax
	call	syslog
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movl	$.LC17, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
.L54:
	movq	-4792(%rbp), %rax
	movq	%rax, %rdi
	call	fileno
	movl	$1, %edx
	movl	$2, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	fcntl
	call	getuid
	testl	%eax, %eax
	jne	.L55
	movq	-4792(%rbp), %rax
	movq	%rax, %rdi
	call	fileno
	movl	-4816(%rbp), %edx
	movl	-4820(%rbp), %ecx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	fchown
	testl	%eax, %eax
	jns	.L55
	movl	$.LC18, %esi
	movl	$4, %edi
	movl	$0, %eax
	call	syslog
	movl	$.LC19, %edi
	call	perror
	jmp	.L55
.L47:
	movq	$0, -4792(%rbp)
.L55:
	movq	dir(%rip), %rax
	testq	%rax, %rax
	je	.L56
	movq	dir(%rip), %rax
	movq	%rax, %rdi
	call	chdir
	testl	%eax, %eax
	jns	.L56
	movl	$.LC20, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$.LC21, %edi
	call	perror
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L56:
	leaq	-4208(%rbp), %rax
	movl	$4096, %esi
	movq	%rax, %rdi
	call	getcwd
	leaq	-4208(%rbp), %rbx
	movq	%rbx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L57
	movq	%rax, %rdi
	call	__asan_report_load1
.L57:
	leaq	-4208(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	leaq	(%rbx,%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L58
	movq	%rax, %rdi
	call	__asan_report_load1
.L58:
	leaq	-1(%rdx), %rcx
	leaq	-4208(%rbp), %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	cmpb	%dl, %sil
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L59
	movq	%rax, %rdi
	call	__asan_report_load1
.L59:
	movzbl	-4208(%rbp,%rcx), %eax
	cmpb	$47, %al
	je	.L60
	leaq	-4208(%rbp), %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L61
	movq	%rax, %rdi
	call	__asan_report_load1
.L61:
	leaq	-4208(%rbp), %rax
	movq	$-1, %rcx
	movq	%rax, %rdx
	movl	$0, %eax
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rcx
	leaq	(%rsi,%rcx), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	cmpb	%dl, %sil
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L62
	movq	%rax, %rdi
	call	__asan_report_load1
.L62:
	leaq	-4208(%rbp), %rax
	addq	%rcx, %rax
	movl	$.LC22, %edx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rdx, %rsi
	andl	$7, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L63
	movq	%rdx, %rdi
	call	__asan_report_load1
.L63:
	movl	$.LC22, %edx
	addq	$1, %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rdx, %rsi
	andl	$7, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L64
	movq	%rdx, %rdi
	call	__asan_report_load1
.L64:
	movq	%rax, %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rdx, %rsi
	andl	$7, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L65
	movq	%rdx, %rdi
	call	__asan_report_store1
.L65:
	leaq	1(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rdx, %rsi
	andl	$7, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L66
	movq	%rdx, %rdi
	call	__asan_report_store1
.L66:
	movw	$47, (%rax)
.L60:
	movl	debug(%rip), %eax
	testl	%eax, %eax
	jne	.L67
	movq	stdin(%rip), %rax
	movq	%rax, %rdi
	call	fclose
	movq	stdout(%rip), %rax
	cmpq	%rax, -4792(%rbp)
	je	.L68
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fclose
.L68:
	movq	stderr(%rip), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$1, %esi
	movl	$1, %edi
	call	daemon
	testl	%eax, %eax
	jns	.L69
	movl	$.LC23, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L67:
	call	setsid
.L69:
	movq	pidfile(%rip), %rax
	testq	%rax, %rax
	je	.L70
	movq	pidfile(%rip), %rax
	movl	$.LC24, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -4776(%rbp)
	cmpq	$0, -4776(%rbp)
	jne	.L71
	movq	pidfile(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC15, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L71:
	call	getpid
	movl	%eax, %edx
	movq	-4776(%rbp), %rax
	movl	$.LC25, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	-4776(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
.L70:
	call	fdwatch_get_nfiles
	movl	%eax, max_connects(%rip)
	movl	max_connects(%rip), %eax
	testl	%eax, %eax
	jns	.L72
	movl	$.LC26, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L72:
	movl	max_connects(%rip), %eax
	subl	$10, %eax
	movl	%eax, max_connects(%rip)
	movl	do_chroot(%rip), %eax
	testl	%eax, %eax
	je	.L73
	leaq	-4208(%rbp), %rax
	movq	%rax, %rdi
	call	chroot
	testl	%eax, %eax
	jns	.L74
	movl	$.LC27, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$.LC28, %edi
	call	perror
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L74:
	movq	logfile(%rip), %rax
	testq	%rax, %rax
	je	.L75
	movq	logfile(%rip), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	je	.L75
	leaq	-4208(%rbp), %rbx
	movq	%rbx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L76
	movq	%rax, %rdi
	call	__asan_report_load1
.L76:
	leaq	-4208(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	leaq	(%rbx,%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L77
	movq	%rax, %rdi
	call	__asan_report_load1
.L77:
	movq	logfile(%rip), %rax
	leaq	-4208(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L78
	movq	logfile(%rip), %r12
	leaq	-4208(%rbp), %rbx
	movq	%rbx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L79
	movq	%rax, %rdi
	call	__asan_report_load1
.L79:
	leaq	-4208(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	leaq	(%rbx,%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L80
	movq	%rax, %rdi
	call	__asan_report_load1
.L80:
	leaq	-1(%rdx), %rax
	leaq	(%r12,%rax), %rdx
	movq	logfile(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L75
.L78:
	movl	$.LC29, %esi
	movl	$4, %edi
	movl	$0, %eax
	call	syslog
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movl	$.LC30, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
.L75:
	movl	$.LC22, %eax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L81
	movq	%rax, %rdi
	call	__asan_report_load1
.L81:
	movl	$.LC22, %eax
	addq	$1, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L82
	movq	%rax, %rdi
	call	__asan_report_load1
.L82:
	leaq	-4208(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L83
	movq	%rax, %rdi
	call	__asan_report_store1
.L83:
	leaq	-4208(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L84
	movq	%rax, %rdi
	call	__asan_report_store1
.L84:
	leaq	-4208(%rbp), %rax
	movw	$47, (%rax)
	leaq	-4208(%rbp), %rax
	movq	%rax, %rdi
	call	chdir
	testl	%eax, %eax
	jns	.L73
	movl	$.LC31, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$.LC32, %edi
	call	perror
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L73:
	movq	data_dir(%rip), %rax
	testq	%rax, %rax
	je	.L85
	movq	data_dir(%rip), %rax
	movq	%rax, %rdi
	call	chdir
	testl	%eax, %eax
	jns	.L85
	movl	$.LC33, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$.LC34, %edi
	call	perror
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L85:
	movl	$handle_term, %esi
	movl	$15, %edi
	movl	$0, %eax
	call	sigset
	movl	$handle_term, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	sigset
	movl	$handle_chld, %esi
	movl	$17, %edi
	movl	$0, %eax
	call	sigset
	movl	$1, %esi
	movl	$13, %edi
	movl	$0, %eax
	call	sigset
	movl	$handle_hup, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	sigset
	movl	$handle_usr1, %esi
	movl	$10, %edi
	movl	$0, %eax
	call	sigset
	movl	$handle_usr2, %esi
	movl	$12, %edi
	movl	$0, %eax
	call	sigset
	movl	$handle_alrm, %esi
	movl	$14, %edi
	movl	$0, %eax
	call	sigset
	movl	$0, got_hup(%rip)
	movl	$0, got_usr1(%rip)
	movl	$0, watchdog_flag(%rip)
	movl	$360, %edi
	call	alarm
	call	tmr_init
	movl	no_empty_referers(%rip), %ecx
	movq	local_pattern(%rip), %rax
	movq	%rax, -4856(%rbp)
	movq	url_pattern(%rip), %r15
	movl	do_global_passwd(%rip), %r14d
	movl	do_vhost(%rip), %r13d
	movl	no_symlink_check(%rip), %r12d
	movl	no_log(%rip), %ebx
	movl	max_age(%rip), %r11d
	movq	p3p(%rip), %r9
	movq	charset(%rip), %r8
	movl	cgi_limit(%rip), %eax
	movl	%eax, -4840(%rbp)
	movq	cgi_pattern(%rip), %rax
	movq	%rax, -4864(%rbp)
	movzwl	port(%rip), %eax
	movzwl	%ax, %r10d
	movl	-4656(%rbp), %eax
	testl	%eax, %eax
	je	.L86
	leaq	-4368(%rbp), %rdx
	jmp	.L87
.L86:
	movl	$0, %edx
.L87:
	movl	-4720(%rbp), %eax
	testl	%eax, %eax
	je	.L88
	leaq	-4528(%rbp), %rsi
	jmp	.L89
.L88:
	movl	$0, %esi
.L89:
	movq	hostname(%rip), %rdi
	movl	%ecx, 88(%rsp)
	movq	-4856(%rbp), %rax
	movq	%rax, 80(%rsp)
	movq	%r15, 72(%rsp)
	movl	%r14d, 64(%rsp)
	movl	%r13d, 56(%rsp)
	movl	%r12d, 48(%rsp)
	movq	-4792(%rbp), %rax
	movq	%rax, 40(%rsp)
	movl	%ebx, 32(%rsp)
	leaq	-4208(%rbp), %rax
	movq	%rax, 24(%rsp)
	movl	%r11d, 16(%rsp)
	movq	%r9, 8(%rsp)
	movq	%r8, (%rsp)
	movl	-4840(%rbp), %r9d
	movq	-4864(%rbp), %r8
	movl	%r10d, %ecx
	call	httpd_initialize
	movq	%rax, hs(%rip)
	movq	hs(%rip), %rax
	testq	%rax, %rax
	jne	.L90
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L90:
	movl	$1, %r8d
	movl	$120000, %ecx
	movq	JunkClientData(%rip), %rdx
	movl	$occasional, %esi
	movl	$0, %edi
	call	tmr_create
	testq	%rax, %rax
	jne	.L91
	movl	$.LC35, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L91:
	movl	$1, %r8d
	movl	$5000, %ecx
	movq	JunkClientData(%rip), %rdx
	movl	$idle, %esi
	movl	$0, %edi
	call	tmr_create
	testq	%rax, %rax
	jne	.L92
	movl	$.LC36, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L92:
	movl	numthrottles(%rip), %eax
	testl	%eax, %eax
	jle	.L93
	movl	$1, %r8d
	movl	$2000, %ecx
	movq	JunkClientData(%rip), %rdx
	movl	$update_throttles, %esi
	movl	$0, %edi
	call	tmr_create
	testq	%rax, %rax
	jne	.L93
	movl	$.LC37, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L93:
	movl	$1, %r8d
	movl	$3600000, %ecx
	movq	JunkClientData(%rip), %rdx
	movl	$show_stats, %esi
	movl	$0, %edi
	call	tmr_create
	testq	%rax, %rax
	jne	.L94
	movl	$.LC38, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L94:
	movl	$0, %edi
	call	time
	movq	%rax, stats_time(%rip)
	movq	stats_time(%rip), %rax
	movq	%rax, start_time(%rip)
	movq	$0, stats_connections(%rip)
	movq	$0, stats_bytes(%rip)
	movl	$0, stats_simultaneous(%rip)
	call	getuid
	testl	%eax, %eax
	jne	.L95
	movl	$0, %esi
	movl	$0, %edi
	call	setgroups
	testl	%eax, %eax
	jns	.L96
	movl	$.LC39, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L96:
	movl	-4816(%rbp), %eax
	movl	%eax, %edi
	call	setgid
	testl	%eax, %eax
	jns	.L97
	movl	$.LC40, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L97:
	movq	user(%rip), %rax
	movl	-4816(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	initgroups
	testl	%eax, %eax
	jns	.L98
	movl	$.LC41, %esi
	movl	$4, %edi
	movl	$0, %eax
	call	syslog
.L98:
	movl	-4820(%rbp), %eax
	movl	%eax, %edi
	call	setuid
	testl	%eax, %eax
	jns	.L99
	movl	$.LC42, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L99:
	movl	do_chroot(%rip), %eax
	testl	%eax, %eax
	jne	.L95
	movl	$.LC43, %esi
	movl	$4, %edi
	movl	$0, %eax
	call	syslog
.L95:
	movl	max_connects(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, connects(%rip)
	movq	connects(%rip), %rax
	testq	%rax, %rax
	jne	.L100
	movl	$.LC44, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L100:
	movl	$0, -4812(%rbp)
	jmp	.L101
.L105:
	movq	connects(%rip), %rcx
	movl	-4812(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rax, %rcx
	movq	%rcx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%dl, %sil
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L102
	movq	%rax, %rdi
	call	__asan_report_store4
.L102:
	movl	$0, (%rcx)
	movq	connects(%rip), %rcx
	movl	-4812(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-4812(%rbp), %eax
	leal	1(%rax), %esi
	leaq	4(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%r8b
	movq	%rax, %rdi
	andl	$7, %edi
	addl	$3, %edi
	cmpb	%cl, %dil
	setge	%cl
	andl	%r8d, %ecx
	testb	%cl, %cl
	je	.L103
	movq	%rax, %rdi
	call	__asan_report_store4
.L103:
	movl	%esi, 4(%rdx)
	movq	connects(%rip), %rcx
	movl	-4812(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	8(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L104
	movq	%rdx, %rdi
	call	__asan_report_store8
.L104:
	movq	$0, 8(%rax)
	addl	$1, -4812(%rbp)
.L101:
	movl	max_connects(%rip), %eax
	cmpl	%eax, -4812(%rbp)
	jl	.L105
	movq	connects(%rip), %rcx
	movl	max_connects(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	subq	$144, %rax
	leaq	(%rcx,%rax), %rdx
	leaq	4(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L106
	movq	%rax, %rdi
	call	__asan_report_store4
.L106:
	movl	$-1, 4(%rdx)
	movl	$0, first_free_connect(%rip)
	movl	$0, num_connects(%rip)
	movl	$0, httpd_conn_count(%rip)
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L107
	movq	hs(%rip), %rdx
	leaq	72(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L108
	movq	%rax, %rdi
	call	__asan_report_load4
.L108:
	movl	72(%rdx), %eax
	cmpl	$-1, %eax
	je	.L109
	movq	hs(%rip), %rdx
	leaq	72(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L110
	movq	%rax, %rdi
	call	__asan_report_load4
.L110:
	movl	72(%rdx), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	fdwatch_add_fd
.L109:
	movq	hs(%rip), %rdx
	leaq	76(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L111
	movq	%rax, %rdi
	call	__asan_report_load4
.L111:
	movl	76(%rdx), %eax
	cmpl	$-1, %eax
	je	.L107
	movq	hs(%rip), %rdx
	leaq	76(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L112
	movq	%rax, %rdi
	call	__asan_report_load4
.L112:
	movl	76(%rdx), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	fdwatch_add_fd
.L107:
	leaq	-4592(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_prepare_timeval
	jmp	.L113
.L145:
	movl	got_hup(%rip), %eax
	testl	%eax, %eax
	je	.L114
	call	re_open_logfile
	movl	$0, got_hup(%rip)
.L114:
	leaq	-4592(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_mstimeout
	movq	%rax, %rdi
	call	fdwatch
	movl	%eax, -4804(%rbp)
	cmpl	$0, -4804(%rbp)
	jns	.L115
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L116
	movq	%rax, %rdi
	call	__asan_report_load4
.L116:
	movl	(%rdx), %eax
	cmpl	$4, %eax
	je	.L117
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L118
	movq	%rax, %rdi
	call	__asan_report_load4
.L118:
	movl	(%rdx), %eax
	cmpl	$11, %eax
	jne	.L119
.L117:
	jmp	.L113
.L119:
	movl	$.LC45, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L115:
	leaq	-4592(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_prepare_timeval
	cmpl	$0, -4804(%rbp)
	jne	.L120
	leaq	-4592(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_run
	jmp	.L113
.L120:
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L121
	movq	hs(%rip), %rdx
	leaq	76(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L122
	movq	%rax, %rdi
	call	__asan_report_load4
.L122:
	movl	76(%rdx), %eax
	cmpl	$-1, %eax
	je	.L121
	movq	hs(%rip), %rdx
	leaq	76(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L123
	movq	%rax, %rdi
	call	__asan_report_load4
.L123:
	movl	76(%rdx), %eax
	movl	%eax, %edi
	call	fdwatch_check_fd
	testl	%eax, %eax
	je	.L121
	movq	hs(%rip), %rdx
	leaq	76(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L124
	movq	%rax, %rdi
	call	__asan_report_load4
.L124:
	movl	76(%rdx), %edx
	leaq	-4592(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	handle_newconnect
	testl	%eax, %eax
	je	.L121
	jmp	.L113
.L121:
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L125
	movq	hs(%rip), %rdx
	leaq	72(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L126
	movq	%rax, %rdi
	call	__asan_report_load4
.L126:
	movl	72(%rdx), %eax
	cmpl	$-1, %eax
	je	.L125
	movq	hs(%rip), %rdx
	leaq	72(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L127
	movq	%rax, %rdi
	call	__asan_report_load4
.L127:
	movl	72(%rdx), %eax
	movl	%eax, %edi
	call	fdwatch_check_fd
	testl	%eax, %eax
	je	.L125
	movq	hs(%rip), %rdx
	leaq	72(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L128
	movq	%rax, %rdi
	call	__asan_report_load4
.L128:
	movl	72(%rdx), %edx
	leaq	-4592(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	handle_newconnect
	testl	%eax, %eax
	je	.L125
	jmp	.L113
.L125:
	jmp	.L129
.L138:
	cmpq	$0, -4768(%rbp)
	jne	.L130
	jmp	.L129
.L130:
	movq	-4768(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L131
	movq	%rax, %rdi
	call	__asan_report_load8
.L131:
	movq	-4768(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -4760(%rbp)
	movq	-4760(%rbp), %rax
	addq	$704, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L132
	movq	%rax, %rdi
	call	__asan_report_load4
.L132:
	movq	-4760(%rbp), %rax
	movl	704(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_check_fd
	testl	%eax, %eax
	jne	.L133
	leaq	-4592(%rbp), %rdx
	movq	-4768(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	clear_connection
	jmp	.L129
.L133:
	movq	-4768(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L134
	movq	%rax, %rdi
	call	__asan_report_load4
.L134:
	movq	-4768(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$2, %eax
	je	.L135
	cmpl	$4, %eax
	je	.L136
	cmpl	$1, %eax
	jne	.L129
	leaq	-4592(%rbp), %rdx
	movq	-4768(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	handle_read
	jmp	.L129
.L135:
	leaq	-4592(%rbp), %rdx
	movq	-4768(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	handle_send
	jmp	.L129
.L136:
	leaq	-4592(%rbp), %rdx
	movq	-4768(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	handle_linger
	nop
.L129:
	call	fdwatch_get_next_client_data
	movq	%rax, -4768(%rbp)
	cmpq	$-1, -4768(%rbp)
	jne	.L138
	leaq	-4592(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_run
	movl	got_usr1(%rip), %eax
	testl	%eax, %eax
	je	.L113
	movl	terminate(%rip), %eax
	testl	%eax, %eax
	jne	.L113
	movl	$1, terminate(%rip)
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L113
	movq	hs(%rip), %rdx
	leaq	72(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L139
	movq	%rax, %rdi
	call	__asan_report_load4
.L139:
	movl	72(%rdx), %eax
	cmpl	$-1, %eax
	je	.L140
	movq	hs(%rip), %rdx
	leaq	72(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L141
	movq	%rax, %rdi
	call	__asan_report_load4
.L141:
	movl	72(%rdx), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
.L140:
	movq	hs(%rip), %rdx
	leaq	76(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L142
	movq	%rax, %rdi
	call	__asan_report_load4
.L142:
	movl	76(%rdx), %eax
	cmpl	$-1, %eax
	je	.L143
	movq	hs(%rip), %rdx
	leaq	76(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L144
	movq	%rax, %rdi
	call	__asan_report_load4
.L144:
	movl	76(%rdx), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
.L143:
	movq	hs(%rip), %rax
	movq	%rax, %rdi
	call	httpd_unlisten
.L113:
	movl	terminate(%rip), %eax
	testl	%eax, %eax
	je	.L145
	movl	num_connects(%rip), %eax
	testl	%eax, %eax
	jg	.L145
	call	shut_down
	movl	$.LC3, %esi
	movl	$5, %edi
	movl	$0, %eax
	call	syslog
	call	closelog
	call	__asan_handle_no_return
	movl	$0, %edi
	call	exit
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.section	.rodata
	.align 32
.LC46:
	.string	"nobody"
	.zero	57
	.align 32
.LC47:
	.string	"iso-8859-1"
	.zero	53
	.align 32
.LC48:
	.string	""
	.zero	63
	.align 32
.LC49:
	.string	"-V"
	.zero	61
	.align 32
.LC50:
	.string	"thttpd/2.27.0 Oct 3, 2014"
	.zero	38
	.align 32
.LC51:
	.string	"-C"
	.zero	61
	.align 32
.LC52:
	.string	"-p"
	.zero	61
	.align 32
.LC53:
	.string	"-d"
	.zero	61
	.align 32
.LC54:
	.string	"-r"
	.zero	61
	.align 32
.LC55:
	.string	"-nor"
	.zero	59
	.align 32
.LC56:
	.string	"-dd"
	.zero	60
	.align 32
.LC57:
	.string	"-s"
	.zero	61
	.align 32
.LC58:
	.string	"-nos"
	.zero	59
	.align 32
.LC59:
	.string	"-u"
	.zero	61
	.align 32
.LC60:
	.string	"-c"
	.zero	61
	.align 32
.LC61:
	.string	"-t"
	.zero	61
	.align 32
.LC62:
	.string	"-h"
	.zero	61
	.align 32
.LC63:
	.string	"-l"
	.zero	61
	.align 32
.LC64:
	.string	"-v"
	.zero	61
	.align 32
.LC65:
	.string	"-nov"
	.zero	59
	.align 32
.LC66:
	.string	"-g"
	.zero	61
	.align 32
.LC67:
	.string	"-nog"
	.zero	59
	.align 32
.LC68:
	.string	"-i"
	.zero	61
	.align 32
.LC69:
	.string	"-T"
	.zero	61
	.align 32
.LC70:
	.string	"-P"
	.zero	61
	.align 32
.LC71:
	.string	"-M"
	.zero	61
	.align 32
.LC72:
	.string	"-D"
	.zero	61
	.text
	.type	parse_args, @function
parse_args:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, debug(%rip)
	movw	$80, port(%rip)
	movq	$0, dir(%rip)
	movq	$0, data_dir(%rip)
	movl	$0, do_chroot(%rip)
	movl	$0, no_log(%rip)
	movl	do_chroot(%rip), %eax
	movl	%eax, no_symlink_check(%rip)
	movl	$0, do_vhost(%rip)
	movl	$0, do_global_passwd(%rip)
	movq	$0, cgi_pattern(%rip)
	movl	$0, cgi_limit(%rip)
	movq	$0, url_pattern(%rip)
	movl	$0, no_empty_referers(%rip)
	movq	$0, local_pattern(%rip)
	movq	$0, throttlefile(%rip)
	movq	$0, hostname(%rip)
	movq	$0, logfile(%rip)
	movq	$0, pidfile(%rip)
	movq	$.LC46, user(%rip)
	movq	$.LC47, charset(%rip)
	movq	$.LC48, p3p(%rip)
	movl	$-1, max_age(%rip)
	movl	$1, -4(%rbp)
	jmp	.L147
.L211:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L148
	movq	%rax, %rdi
	call	__asan_report_load8
.L148:
	movq	(%rdx), %rax
	movl	$.LC49, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L149
	movl	$.LC50, %edi
	call	puts
	call	__asan_handle_no_return
	movl	$0, %edi
	call	exit
.L149:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L150
	movq	%rax, %rdi
	call	__asan_report_load8
.L150:
	movq	(%rdx), %rax
	movl	$.LC51, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L151
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L151
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L152
	movq	%rax, %rdi
	call	__asan_report_load8
.L152:
	movq	(%rdx), %rax
	movq	%rax, %rdi
	call	read_config
	jmp	.L153
.L151:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L154
	movq	%rax, %rdi
	call	__asan_report_load8
.L154:
	movq	(%rdx), %rax
	movl	$.LC52, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L155
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L155
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L156
	movq	%rax, %rdi
	call	__asan_report_load8
.L156:
	movq	(%rdx), %rax
	movq	%rax, %rdi
	call	atoi
	movw	%ax, port(%rip)
	jmp	.L153
.L155:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L157
	movq	%rax, %rdi
	call	__asan_report_load8
.L157:
	movq	(%rdx), %rax
	movl	$.LC53, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L158
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L158
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L159
	movq	%rax, %rdi
	call	__asan_report_load8
.L159:
	movq	(%rdx), %rax
	movq	%rax, dir(%rip)
	jmp	.L153
.L158:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L160
	movq	%rax, %rdi
	call	__asan_report_load8
.L160:
	movq	(%rdx), %rax
	movl	$.LC54, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L161
	movl	$1, do_chroot(%rip)
	movl	$1, no_symlink_check(%rip)
	jmp	.L153
.L161:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L162
	movq	%rax, %rdi
	call	__asan_report_load8
.L162:
	movq	(%rdx), %rax
	movl	$.LC55, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L163
	movl	$0, do_chroot(%rip)
	movl	$0, no_symlink_check(%rip)
	jmp	.L153
.L163:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L164
	movq	%rax, %rdi
	call	__asan_report_load8
.L164:
	movq	(%rdx), %rax
	movl	$.LC56, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L165
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L165
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L166
	movq	%rax, %rdi
	call	__asan_report_load8
.L166:
	movq	(%rdx), %rax
	movq	%rax, data_dir(%rip)
	jmp	.L153
.L165:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L167
	movq	%rax, %rdi
	call	__asan_report_load8
.L167:
	movq	(%rdx), %rax
	movl	$.LC57, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L168
	movl	$0, no_symlink_check(%rip)
	jmp	.L153
.L168:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L169
	movq	%rax, %rdi
	call	__asan_report_load8
.L169:
	movq	(%rdx), %rax
	movl	$.LC58, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L170
	movl	$1, no_symlink_check(%rip)
	jmp	.L153
.L170:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L171
	movq	%rax, %rdi
	call	__asan_report_load8
.L171:
	movq	(%rdx), %rax
	movl	$.LC59, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L172
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L172
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L173
	movq	%rax, %rdi
	call	__asan_report_load8
.L173:
	movq	(%rdx), %rax
	movq	%rax, user(%rip)
	jmp	.L153
.L172:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L174
	movq	%rax, %rdi
	call	__asan_report_load8
.L174:
	movq	(%rdx), %rax
	movl	$.LC60, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L175
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L175
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L176
	movq	%rax, %rdi
	call	__asan_report_load8
.L176:
	movq	(%rdx), %rax
	movq	%rax, cgi_pattern(%rip)
	jmp	.L153
.L175:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L177
	movq	%rax, %rdi
	call	__asan_report_load8
.L177:
	movq	(%rdx), %rax
	movl	$.LC61, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L178
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L178
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L179
	movq	%rax, %rdi
	call	__asan_report_load8
.L179:
	movq	(%rdx), %rax
	movq	%rax, throttlefile(%rip)
	jmp	.L153
.L178:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L180
	movq	%rax, %rdi
	call	__asan_report_load8
.L180:
	movq	(%rdx), %rax
	movl	$.LC62, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L181
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L181
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L182
	movq	%rax, %rdi
	call	__asan_report_load8
.L182:
	movq	(%rdx), %rax
	movq	%rax, hostname(%rip)
	jmp	.L153
.L181:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L183
	movq	%rax, %rdi
	call	__asan_report_load8
.L183:
	movq	(%rdx), %rax
	movl	$.LC63, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L184
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L184
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L185
	movq	%rax, %rdi
	call	__asan_report_load8
.L185:
	movq	(%rdx), %rax
	movq	%rax, logfile(%rip)
	jmp	.L153
.L184:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L186
	movq	%rax, %rdi
	call	__asan_report_load8
.L186:
	movq	(%rdx), %rax
	movl	$.LC64, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L187
	movl	$1, do_vhost(%rip)
	jmp	.L153
.L187:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L188
	movq	%rax, %rdi
	call	__asan_report_load8
.L188:
	movq	(%rdx), %rax
	movl	$.LC65, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L189
	movl	$0, do_vhost(%rip)
	jmp	.L153
.L189:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L190
	movq	%rax, %rdi
	call	__asan_report_load8
.L190:
	movq	(%rdx), %rax
	movl	$.LC66, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L191
	movl	$1, do_global_passwd(%rip)
	jmp	.L153
.L191:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L192
	movq	%rax, %rdi
	call	__asan_report_load8
.L192:
	movq	(%rdx), %rax
	movl	$.LC67, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L193
	movl	$0, do_global_passwd(%rip)
	jmp	.L153
.L193:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L194
	movq	%rax, %rdi
	call	__asan_report_load8
.L194:
	movq	(%rdx), %rax
	movl	$.LC68, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L195
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L195
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L196
	movq	%rax, %rdi
	call	__asan_report_load8
.L196:
	movq	(%rdx), %rax
	movq	%rax, pidfile(%rip)
	jmp	.L153
.L195:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L197
	movq	%rax, %rdi
	call	__asan_report_load8
.L197:
	movq	(%rdx), %rax
	movl	$.LC69, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L198
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L198
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L199
	movq	%rax, %rdi
	call	__asan_report_load8
.L199:
	movq	(%rdx), %rax
	movq	%rax, charset(%rip)
	jmp	.L153
.L198:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L200
	movq	%rax, %rdi
	call	__asan_report_load8
.L200:
	movq	(%rdx), %rax
	movl	$.LC70, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L201
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L201
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L202
	movq	%rax, %rdi
	call	__asan_report_load8
.L202:
	movq	(%rdx), %rax
	movq	%rax, p3p(%rip)
	jmp	.L153
.L201:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L203
	movq	%rax, %rdi
	call	__asan_report_load8
.L203:
	movq	(%rdx), %rax
	movl	$.LC71, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L204
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L204
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L205
	movq	%rax, %rdi
	call	__asan_report_load8
.L205:
	movq	(%rdx), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, max_age(%rip)
	jmp	.L153
.L204:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L206
	movq	%rax, %rdi
	call	__asan_report_load8
.L206:
	movq	(%rdx), %rax
	movl	$.LC72, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L207
	movl	$1, debug(%rip)
	jmp	.L153
.L207:
	call	usage
.L153:
	addl	$1, -4(%rbp)
.L147:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.L208
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L209
	movq	%rax, %rdi
	call	__asan_report_load8
.L209:
	movq	(%rdx), %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L210
	movq	%rax, %rdi
	call	__asan_report_load1
.L210:
	movzbl	(%rdx), %eax
	cmpb	$45, %al
	je	.L211
.L208:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	je	.L146
	call	usage
.L146:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	parse_args, .-parse_args
	.section	.rodata
	.align 32
.LC73:
	.string	"usage:  %s [-C configfile] [-p port] [-d dir] [-r|-nor] [-dd data_dir] [-s|-nos] [-v|-nov] [-g|-nog] [-u user] [-c cgipat] [-t throttles] [-h host] [-l logfile] [-i pidfile] [-T charset] [-P P3P] [-M maxage] [-V] [-D]\n"
	.zero	37
	.text
	.type	usage, @function
usage:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movl	$.LC73, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE11:
	.size	usage, .-usage
	.section	.rodata
.LC74:
	.string	"read_config 1 32 100 4 line "
	.align 32
.LC75:
	.string	"r"
	.zero	62
	.align 32
.LC76:
	.string	" \t\n\r"
	.zero	59
	.align 32
.LC77:
	.string	"debug"
	.zero	58
	.align 32
.LC78:
	.string	"port"
	.zero	59
	.align 32
.LC79:
	.string	"dir"
	.zero	60
	.align 32
.LC80:
	.string	"nochroot"
	.zero	55
	.align 32
.LC81:
	.string	"data_dir"
	.zero	55
	.align 32
.LC82:
	.string	"symlink"
	.zero	56
	.align 32
.LC83:
	.string	"nosymlink"
	.zero	54
	.align 32
.LC84:
	.string	"symlinks"
	.zero	55
	.align 32
.LC85:
	.string	"nosymlinks"
	.zero	53
	.align 32
.LC86:
	.string	"user"
	.zero	59
	.align 32
.LC87:
	.string	"cgipat"
	.zero	57
	.align 32
.LC88:
	.string	"cgilimit"
	.zero	55
	.align 32
.LC89:
	.string	"urlpat"
	.zero	57
	.align 32
.LC90:
	.string	"noemptyreferers"
	.zero	48
	.align 32
.LC91:
	.string	"localpat"
	.zero	55
	.align 32
.LC92:
	.string	"throttles"
	.zero	54
	.align 32
.LC93:
	.string	"host"
	.zero	59
	.align 32
.LC94:
	.string	"logfile"
	.zero	56
	.align 32
.LC95:
	.string	"vhost"
	.zero	58
	.align 32
.LC96:
	.string	"novhost"
	.zero	56
	.align 32
.LC97:
	.string	"globalpasswd"
	.zero	51
	.align 32
.LC98:
	.string	"noglobalpasswd"
	.zero	49
	.align 32
.LC99:
	.string	"pidfile"
	.zero	56
	.align 32
.LC100:
	.string	"charset"
	.zero	56
	.align 32
.LC101:
	.string	"p3p"
	.zero	60
	.align 32
.LC102:
	.string	"max_age"
	.zero	56
	.align 32
.LC103:
	.string	"%s: unknown config option '%s'\n"
	.zero	32
	.text
	.type	read_config, @function
read_config:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$264, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -264(%rbp)
	leaq	-208(%rbp), %rax
	movq	$1102416563, (%rax)
	movq	$.LC74, 8(%rax)
	shrq	$3, %rax
	leaq	2147450880(%rax), %rbx
	movl	$-235802127, (%rbx)
	movl	$-185273340, 16(%rbx)
	movl	$-202116109, 20(%rbx)
	movq	-264(%rbp), %rax
	movl	$.LC75, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -224(%rbp)
	cmpq	$0, -224(%rbp)
	jne	.L215
	movq	-264(%rbp), %rax
	movq	%rax, %rdi
	call	perror
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L215:
	jmp	.L216
.L256:
	leaq	-176(%rbp), %rax
	movl	$35, %esi
	movq	%rax, %rdi
	call	strchr
	movq	%rax, -248(%rbp)
	cmpq	$0, -248(%rbp)
	je	.L217
	movq	-248(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L218
	movq	%rax, %rdi
	call	__asan_report_store1
.L218:
	movq	-248(%rbp), %rax
	movb	$0, (%rax)
.L217:
	leaq	-176(%rbp), %rax
	movq	%rax, -248(%rbp)
	movq	-248(%rbp), %rax
	movl	$.LC76, %esi
	movq	%rax, %rdi
	call	strspn
	addq	%rax, -248(%rbp)
	jmp	.L219
.L255:
	movq	-248(%rbp), %rax
	movl	$.LC76, %esi
	movq	%rax, %rdi
	call	strcspn
	movq	-248(%rbp), %rdx
	addq	%rdx, %rax
	movq	%rax, -240(%rbp)
	jmp	.L220
.L223:
	movq	-240(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -240(%rbp)
	movq	%rax, %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rdx, %rsi
	andl	$7, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L221
	movq	%rdx, %rdi
	call	__asan_report_store1
.L221:
	movb	$0, (%rax)
.L220:
	movq	-240(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L222
	movq	%rax, %rdi
	call	__asan_report_load1
.L222:
	movq	-240(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	je	.L223
	movq	-240(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$9, %al
	je	.L223
	movq	-240(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	je	.L223
	movq	-240(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$13, %al
	je	.L223
	movq	-248(%rbp), %rax
	movq	%rax, -216(%rbp)
	movq	-216(%rbp), %rax
	movl	$61, %esi
	movq	%rax, %rdi
	call	strchr
	movq	%rax, -232(%rbp)
	cmpq	$0, -232(%rbp)
	je	.L224
	movq	-232(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -232(%rbp)
	movq	%rax, %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rdx, %rsi
	andl	$7, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L225
	movq	%rdx, %rdi
	call	__asan_report_store1
.L225:
	movb	$0, (%rax)
.L224:
	movq	-216(%rbp), %rax
	movl	$.LC77, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L226
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$1, debug(%rip)
	jmp	.L227
.L226:
	movq	-216(%rbp), %rax
	movl	$.LC78, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L228
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movw	%ax, port(%rip)
	jmp	.L227
.L228:
	movq	-216(%rbp), %rax
	movl	$.LC79, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L229
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, dir(%rip)
	jmp	.L227
.L229:
	movq	-216(%rbp), %rax
	movl	$.LC28, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L230
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$1, do_chroot(%rip)
	movl	$1, no_symlink_check(%rip)
	jmp	.L227
.L230:
	movq	-216(%rbp), %rax
	movl	$.LC80, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L231
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$0, do_chroot(%rip)
	movl	$0, no_symlink_check(%rip)
	jmp	.L227
.L231:
	movq	-216(%rbp), %rax
	movl	$.LC81, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L232
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, data_dir(%rip)
	jmp	.L227
.L232:
	movq	-216(%rbp), %rax
	movl	$.LC82, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L233
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$0, no_symlink_check(%rip)
	jmp	.L227
.L233:
	movq	-216(%rbp), %rax
	movl	$.LC83, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L234
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$1, no_symlink_check(%rip)
	jmp	.L227
.L234:
	movq	-216(%rbp), %rax
	movl	$.LC84, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L235
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$0, no_symlink_check(%rip)
	jmp	.L227
.L235:
	movq	-216(%rbp), %rax
	movl	$.LC85, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L236
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$1, no_symlink_check(%rip)
	jmp	.L227
.L236:
	movq	-216(%rbp), %rax
	movl	$.LC86, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L237
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, user(%rip)
	jmp	.L227
.L237:
	movq	-216(%rbp), %rax
	movl	$.LC87, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L238
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, cgi_pattern(%rip)
	jmp	.L227
.L238:
	movq	-216(%rbp), %rax
	movl	$.LC88, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L239
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, cgi_limit(%rip)
	jmp	.L227
.L239:
	movq	-216(%rbp), %rax
	movl	$.LC89, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L240
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, url_pattern(%rip)
	jmp	.L227
.L240:
	movq	-216(%rbp), %rax
	movl	$.LC90, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L241
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$1, no_empty_referers(%rip)
	jmp	.L227
.L241:
	movq	-216(%rbp), %rax
	movl	$.LC91, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L242
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, local_pattern(%rip)
	jmp	.L227
.L242:
	movq	-216(%rbp), %rax
	movl	$.LC92, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L243
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, throttlefile(%rip)
	jmp	.L227
.L243:
	movq	-216(%rbp), %rax
	movl	$.LC93, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L244
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, hostname(%rip)
	jmp	.L227
.L244:
	movq	-216(%rbp), %rax
	movl	$.LC94, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L245
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, logfile(%rip)
	jmp	.L227
.L245:
	movq	-216(%rbp), %rax
	movl	$.LC95, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L246
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$1, do_vhost(%rip)
	jmp	.L227
.L246:
	movq	-216(%rbp), %rax
	movl	$.LC96, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L247
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$0, do_vhost(%rip)
	jmp	.L227
.L247:
	movq	-216(%rbp), %rax
	movl	$.LC97, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L248
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$1, do_global_passwd(%rip)
	jmp	.L227
.L248:
	movq	-216(%rbp), %rax
	movl	$.LC98, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L249
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$0, do_global_passwd(%rip)
	jmp	.L227
.L249:
	movq	-216(%rbp), %rax
	movl	$.LC99, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L250
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, pidfile(%rip)
	jmp	.L227
.L250:
	movq	-216(%rbp), %rax
	movl	$.LC100, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L251
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, charset(%rip)
	jmp	.L227
.L251:
	movq	-216(%rbp), %rax
	movl	$.LC101, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L252
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, p3p(%rip)
	jmp	.L227
.L252:
	movq	-216(%rbp), %rax
	movl	$.LC102, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L253
	movq	-232(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, max_age(%rip)
	jmp	.L227
.L253:
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movq	-216(%rbp), %rcx
	movl	$.LC103, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L227:
	movq	-240(%rbp), %rax
	movq	%rax, -248(%rbp)
	movq	-248(%rbp), %rax
	movl	$.LC76, %esi
	movq	%rax, %rdi
	call	strspn
	addq	%rax, -248(%rbp)
.L219:
	movq	-248(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L254
	movq	%rax, %rdi
	call	__asan_report_load1
.L254:
	movq	-248(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L255
.L216:
	movq	-224(%rbp), %rdx
	leaq	-176(%rbp), %rax
	movl	$1000, %esi
	movq	%rax, %rdi
	call	fgets
	testq	%rax, %rax
	jne	.L256
	movq	-224(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$0, (%rbx)
	movq	$0, 16(%rbx)
	addq	$264, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	read_config, .-read_config
	.section	.rodata
	.align 32
.LC104:
	.string	"%s: value required for %s option\n"
	.zero	62
	.text
	.type	value_required, @function
value_required:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L257
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rcx
	movl	$.LC104, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L257:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	value_required, .-value_required
	.section	.rodata
	.align 32
.LC105:
	.string	"%s: no value required for %s option\n"
	.zero	59
	.text
	.type	no_value_required, @function
no_value_required:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L259
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rcx
	movl	$.LC105, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L259:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	no_value_required, .-no_value_required
	.section	.rodata
	.align 32
.LC106:
	.string	"out of memory copying a string"
	.zero	33
	.align 32
.LC107:
	.string	"%s: out of memory copying a string\n"
	.zero	60
	.text
	.type	e_strdup, @function
e_strdup:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strdup
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L262
	movl	$.LC106, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movl	$.LC107, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L262:
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	e_strdup, .-e_strdup
	.section	.rodata
	.align 8
.LC108:
	.string	"lookup_hostname 3 32 8 2 ai 96 10 7 portstr 160 48 5 hints "
	.align 32
.LC109:
	.string	"%d"
	.zero	61
	.align 32
.LC110:
	.string	"getaddrinfo %.80s - %.80s"
	.zero	38
	.align 32
.LC111:
	.string	"%s: getaddrinfo %s - %s\n"
	.zero	39
	.align 32
.LC112:
	.string	"%.80s - sockaddr too small (%lu < %lu)"
	.zero	57
	.text
	.type	lookup_hostname, @function
lookup_hostname:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$344, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -312(%rbp)
	movq	%rsi, -320(%rbp)
	movq	%rdx, -328(%rbp)
	movq	%rcx, -336(%rbp)
	movq	%r8, -344(%rbp)
	movq	%r9, -352(%rbp)
	leaq	-272(%rbp), %rax
	movq	$1102416563, (%rax)
	movq	$.LC108, 8(%rax)
	shrq	$3, %rax
	leaq	2147450880(%rax), %rbx
	movl	$-235802127, (%rbx)
	movl	$-185273344, 4(%rbx)
	movl	$-218959118, 8(%rbx)
	movl	$-185335296, 12(%rbx)
	movl	$-218959118, 16(%rbx)
	movl	$-185335808, 24(%rbx)
	movl	$-202116109, 28(%rbx)
	leaq	-112(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L265
	movq	%rax, %rdi
	call	__asan_report_store1
.L265:
	leaq	-112(%rbp), %rax
	addq	$47, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L266
	movq	%rax, %rdi
	call	__asan_report_store1
.L266:
	leaq	-112(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	leaq	-112(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L267
	movq	%rax, %rdi
	call	__asan_report_store4
.L267:
	movl	$0, -108(%rbp)
	leaq	-112(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L268
	movq	%rax, %rdi
	call	__asan_report_store4
.L268:
	movl	$1, -112(%rbp)
	leaq	-112(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L269
	movq	%rax, %rdi
	call	__asan_report_store4
.L269:
	movl	$1, -104(%rbp)
	movzwl	port(%rip), %eax
	movzwl	%ax, %edx
	leaq	-176(%rbp), %rax
	movl	%edx, %ecx
	movl	$.LC109, %edx
	movl	$10, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf
	movq	hostname(%rip), %rax
	leaq	-240(%rbp), %rcx
	leaq	-112(%rbp), %rdx
	leaq	-176(%rbp), %rsi
	movq	%rax, %rdi
	call	getaddrinfo
	movl	%eax, -300(%rbp)
	cmpl	$0, -300(%rbp)
	je	.L270
	movl	-300(%rbp), %eax
	movl	%eax, %edi
	call	gai_strerror
	movq	%rax, %rdx
	movq	hostname(%rip), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$.LC110, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	-300(%rbp), %eax
	movl	%eax, %edi
	call	gai_strerror
	movq	%rax, %rsi
	movq	hostname(%rip), %rcx
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movq	%rsi, %r8
	movl	$.LC111, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L270:
	movq	$0, -288(%rbp)
	movq	$0, -280(%rbp)
	movq	-240(%rbp), %rax
	movq	%rax, -296(%rbp)
	jmp	.L271
.L279:
	movq	-296(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L272
	movq	%rax, %rdi
	call	__asan_report_load4
.L272:
	movq	-296(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	$2, %eax
	je	.L274
	cmpl	$10, %eax
	jne	.L273
	cmpq	$0, -288(%rbp)
	jne	.L276
	movq	-296(%rbp), %rax
	movq	%rax, -288(%rbp)
	jmp	.L273
.L276:
	jmp	.L273
.L274:
	cmpq	$0, -280(%rbp)
	jne	.L277
	movq	-296(%rbp), %rax
	movq	%rax, -280(%rbp)
	jmp	.L308
.L277:
.L308:
	nop
.L273:
	movq	-296(%rbp), %rax
	addq	$40, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L278
	movq	%rax, %rdi
	call	__asan_report_load8
.L278:
	movq	-296(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -296(%rbp)
.L271:
	cmpq	$0, -296(%rbp)
	jne	.L279
	cmpq	$0, -288(%rbp)
	jne	.L280
	movq	-352(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L281
	movq	%rax, %rdi
	call	__asan_report_store4
.L281:
	movq	-352(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L282
.L280:
	movq	-288(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L283
	movq	%rax, %rdi
	call	__asan_report_load4
.L283:
	movq	-288(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %eax
	cmpq	-344(%rbp), %rax
	jbe	.L284
	movq	-288(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %ecx
	movq	hostname(%rip), %rax
	movq	-344(%rbp), %rdx
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$.LC112, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L284:
	cmpq	$0, -344(%rbp)
	je	.L285
	movq	-336(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%edx, %esi
	movq	-344(%rbp), %rdx
	leaq	-1(%rdx), %rcx
	movq	-336(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%r8b
	movq	%rdx, %rdi
	andl	$7, %edi
	cmpb	%cl, %dil
	setge	%cl
	andl	%r8d, %ecx
	testb	%cl, %cl
	je	.L286
	movq	%rdx, %rdi
	call	__asan_report_store1
.L286:
	testb	%sil, %sil
	je	.L285
	movq	%rax, %rdi
	call	__asan_report_store1
.L285:
	movq	-344(%rbp), %rdx
	movq	-336(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movq	-288(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L287
	movq	%rax, %rdi
	call	__asan_report_load4
.L287:
	movq	-288(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %eax
	movq	-288(%rbp), %rdx
	addq	$24, %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L288
	movq	%rdx, %rdi
	call	__asan_report_load8
.L288:
	movq	-288(%rbp), %rdx
	movq	24(%rdx), %rcx
	testq	%rax, %rax
	je	.L289
	movq	%rcx, %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	setne	%r8b
	movq	%rdx, %rdi
	andl	$7, %edi
	cmpb	%sil, %dil
	setge	%sil
	andl	%esi, %r8d
	leaq	-1(%rax), %rsi
	addq	%rcx, %rsi
	movq	%rsi, %rdi
	shrq	$3, %rdi
	addq	$2147450880, %rdi
	movzbl	(%rdi), %edi
	testb	%dil, %dil
	setne	%r10b
	movq	%rsi, %r9
	andl	$7, %r9d
	cmpb	%dil, %r9b
	setge	%dil
	andl	%r10d, %edi
	testb	%dil, %dil
	je	.L290
	movq	%rsi, %rdi
	call	__asan_report_load1
.L290:
	testb	%r8b, %r8b
	je	.L289
	movq	%rdx, %rdi
	call	__asan_report_load1
.L289:
	testq	%rax, %rax
	je	.L291
	movq	-336(%rbp), %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	setne	%r8b
	movq	%rdx, %rdi
	andl	$7, %edi
	cmpb	%sil, %dil
	setge	%sil
	andl	%esi, %r8d
	leaq	-1(%rax), %rsi
	movq	-336(%rbp), %rdi
	addq	%rdi, %rsi
	movq	%rsi, %rdi
	shrq	$3, %rdi
	addq	$2147450880, %rdi
	movzbl	(%rdi), %edi
	testb	%dil, %dil
	setne	%r10b
	movq	%rsi, %r9
	andl	$7, %r9d
	cmpb	%dil, %r9b
	setge	%dil
	andl	%r10d, %edi
	testb	%dil, %dil
	je	.L292
	movq	%rsi, %rdi
	call	__asan_report_store1
.L292:
	testb	%r8b, %r8b
	je	.L291
	movq	%rdx, %rdi
	call	__asan_report_store1
.L291:
	movq	-336(%rbp), %rdi
	movq	%rax, %rdx
	movq	%rcx, %rsi
	call	memmove
	movq	-352(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L293
	movq	%rax, %rdi
	call	__asan_report_store4
.L293:
	movq	-352(%rbp), %rax
	movl	$1, (%rax)
.L282:
	cmpq	$0, -280(%rbp)
	jne	.L294
	movq	-328(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L295
	movq	%rax, %rdi
	call	__asan_report_store4
.L295:
	movq	-328(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L296
.L294:
	movq	-280(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L297
	movq	%rax, %rdi
	call	__asan_report_load4
.L297:
	movq	-280(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %eax
	cmpq	-320(%rbp), %rax
	jbe	.L298
	movq	-280(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %ecx
	movq	hostname(%rip), %rax
	movq	-320(%rbp), %rdx
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$.LC112, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L298:
	cmpq	$0, -320(%rbp)
	je	.L299
	movq	-312(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%edx, %esi
	movq	-320(%rbp), %rdx
	leaq	-1(%rdx), %rcx
	movq	-312(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%r8b
	movq	%rdx, %rdi
	andl	$7, %edi
	cmpb	%cl, %dil
	setge	%cl
	andl	%r8d, %ecx
	testb	%cl, %cl
	je	.L300
	movq	%rdx, %rdi
	call	__asan_report_store1
.L300:
	testb	%sil, %sil
	je	.L299
	movq	%rax, %rdi
	call	__asan_report_store1
.L299:
	movq	-320(%rbp), %rdx
	movq	-312(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movq	-280(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L301
	movq	%rax, %rdi
	call	__asan_report_load4
.L301:
	movq	-280(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %eax
	movq	-280(%rbp), %rdx
	addq	$24, %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L302
	movq	%rdx, %rdi
	call	__asan_report_load8
.L302:
	movq	-280(%rbp), %rdx
	movq	24(%rdx), %rcx
	testq	%rax, %rax
	je	.L303
	movq	%rcx, %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	setne	%r8b
	movq	%rdx, %rdi
	andl	$7, %edi
	cmpb	%sil, %dil
	setge	%sil
	andl	%esi, %r8d
	leaq	-1(%rax), %rsi
	addq	%rcx, %rsi
	movq	%rsi, %rdi
	shrq	$3, %rdi
	addq	$2147450880, %rdi
	movzbl	(%rdi), %edi
	testb	%dil, %dil
	setne	%r10b
	movq	%rsi, %r9
	andl	$7, %r9d
	cmpb	%dil, %r9b
	setge	%dil
	andl	%r10d, %edi
	testb	%dil, %dil
	je	.L304
	movq	%rsi, %rdi
	call	__asan_report_load1
.L304:
	testb	%r8b, %r8b
	je	.L303
	movq	%rdx, %rdi
	call	__asan_report_load1
.L303:
	testq	%rax, %rax
	je	.L305
	movq	-312(%rbp), %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	setne	%r8b
	movq	%rdx, %rdi
	andl	$7, %edi
	cmpb	%sil, %dil
	setge	%sil
	andl	%esi, %r8d
	leaq	-1(%rax), %rsi
	movq	-312(%rbp), %rdi
	addq	%rdi, %rsi
	movq	%rsi, %rdi
	shrq	$3, %rdi
	addq	$2147450880, %rdi
	movzbl	(%rdi), %edi
	testb	%dil, %dil
	setne	%r10b
	movq	%rsi, %r9
	andl	$7, %r9d
	cmpb	%dil, %r9b
	setge	%dil
	andl	%r10d, %edi
	testb	%dil, %dil
	je	.L306
	movq	%rsi, %rdi
	call	__asan_report_store1
.L306:
	testb	%r8b, %r8b
	je	.L305
	movq	%rdx, %rdi
	call	__asan_report_store1
.L305:
	movq	-312(%rbp), %rdi
	movq	%rax, %rdx
	movq	%rcx, %rsi
	call	memmove
	movq	-328(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L307
	movq	%rax, %rdi
	call	__asan_report_store4
.L307:
	movq	-328(%rbp), %rax
	movl	$1, (%rax)
.L296:
	movq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo
	movq	$0, (%rbx)
	movq	$0, 8(%rbx)
	movl	$0, 16(%rbx)
	movq	$0, 24(%rbx)
	addq	$344, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	lookup_hostname, .-lookup_hostname
	.section	.rodata
	.align 8
.LC113:
	.string	"read_throttlefile 5 32 8 9 max_limit 96 8 9 min_limit 160 16 2 tv 224 5000 3 buf 5280 5000 7 pattern "
	.align 32
.LC114:
	.string	" %4900[^ \t] %ld-%ld"
	.zero	44
	.align 32
.LC115:
	.string	" %4900[^ \t] %ld"
	.zero	48
	.align 32
.LC116:
	.string	"unparsable line in %.80s - %.80s"
	.zero	63
	.align 32
.LC117:
	.string	"%s: unparsable line in %.80s - %.80s\n"
	.zero	58
	.align 32
.LC118:
	.string	"|/"
	.zero	61
	.align 32
.LC119:
	.string	"out of memory allocating a throttletab"
	.zero	57
	.align 32
.LC120:
	.string	"%s: out of memory allocating a throttletab\n"
	.zero	52
	.text
	.type	read_throttlefile, @function
read_throttlefile:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$10384, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -10392(%rbp)
	leaq	-10352(%rbp), %rax
	movq	$1102416563, (%rax)
	movq	$.LC113, 8(%rax)
	shrq	$3, %rax
	leaq	2147450880(%rax), %rbx
	movl	$-235802127, (%rbx)
	movl	$-185273344, 4(%rbx)
	movl	$-218959118, 8(%rbx)
	movl	$-185273344, 12(%rbx)
	movl	$-218959118, 16(%rbx)
	movl	$-185335808, 20(%rbx)
	movl	$-218959118, 24(%rbx)
	movl	$-185273344, 652(%rbx)
	movl	$-218959118, 656(%rbx)
	movl	$-185273344, 1284(%rbx)
	movl	$-202116109, 1288(%rbx)
	movq	-10392(%rbp), %rax
	movl	$.LC75, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -10368(%rbp)
	cmpq	$0, -10368(%rbp)
	jne	.L310
	movq	-10392(%rbp), %rax
	movq	%rax, %rdx
	movl	$.LC15, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movq	-10392(%rbp), %rax
	movq	%rax, %rdi
	call	perror
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L310:
	leaq	-10192(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	jmp	.L311
.L340:
	leaq	-10128(%rbp), %rax
	movl	$35, %esi
	movq	%rax, %rdi
	call	strchr
	movq	%rax, -10360(%rbp)
	cmpq	$0, -10360(%rbp)
	je	.L312
	movq	-10360(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L313
	movq	%rax, %rdi
	call	__asan_report_store1
.L313:
	movq	-10360(%rbp), %rax
	movb	$0, (%rax)
.L312:
	leaq	-10128(%rbp), %r12
	movq	%r12, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L314
	movq	%rax, %rdi
	call	__asan_report_load1
.L314:
	leaq	-10128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	leaq	(%r12,%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L315
	movq	%rax, %rdi
	call	__asan_report_load1
.L315:
	movl	%edx, -10372(%rbp)
	jmp	.L316
.L320:
	subl	$1, -10372(%rbp)
	leaq	-10128(%rbp), %rdx
	movl	-10372(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L317
	movq	%rax, %rdi
	call	__asan_report_store1
.L317:
	movl	-10372(%rbp), %eax
	cltq
	movb	$0, -10128(%rbp,%rax)
.L316:
	cmpl	$0, -10372(%rbp)
	jle	.L318
	movl	-10372(%rbp), %eax
	leal	-1(%rax), %ecx
	leaq	-10128(%rbp), %rdx
	movslq	%ecx, %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	cmpb	%dl, %sil
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L319
	movq	%rax, %rdi
	call	__asan_report_load1
.L319:
	movslq	%ecx, %rax
	movzbl	-10128(%rbp,%rax), %eax
	cmpb	$32, %al
	je	.L320
	movl	-10372(%rbp), %eax
	leal	-1(%rax), %ecx
	leaq	-10128(%rbp), %rdx
	movslq	%ecx, %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	cmpb	%dl, %sil
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L321
	movq	%rax, %rdi
	call	__asan_report_load1
.L321:
	movslq	%ecx, %rax
	movzbl	-10128(%rbp,%rax), %eax
	cmpb	$9, %al
	je	.L320
	movl	-10372(%rbp), %eax
	leal	-1(%rax), %ecx
	leaq	-10128(%rbp), %rdx
	movslq	%ecx, %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	cmpb	%dl, %sil
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L322
	movq	%rax, %rdi
	call	__asan_report_load1
.L322:
	movslq	%ecx, %rax
	movzbl	-10128(%rbp,%rax), %eax
	cmpb	$10, %al
	je	.L320
	movl	-10372(%rbp), %eax
	leal	-1(%rax), %ecx
	leaq	-10128(%rbp), %rdx
	movslq	%ecx, %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	cmpb	%dl, %sil
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L323
	movq	%rax, %rdi
	call	__asan_report_load1
.L323:
	movslq	%ecx, %rax
	movzbl	-10128(%rbp,%rax), %eax
	cmpb	$13, %al
	je	.L320
.L318:
	cmpl	$0, -10372(%rbp)
	jne	.L324
	jmp	.L311
.L324:
	leaq	-10320(%rbp), %rsi
	leaq	-10256(%rbp), %rcx
	leaq	-5072(%rbp), %rdx
	leaq	-10128(%rbp), %rax
	movq	%rsi, %r8
	movl	$.LC114, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf
	cmpl	$3, %eax
	je	.L325
	leaq	-10320(%rbp), %rcx
	leaq	-5072(%rbp), %rdx
	leaq	-10128(%rbp), %rax
	movl	$.LC115, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L326
	movq	$0, -10256(%rbp)
	jmp	.L325
.L326:
	leaq	-10128(%rbp), %rdx
	movq	-10392(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$.LC116, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	leaq	-10128(%rbp), %rsi
	movq	-10392(%rbp), %rcx
	movq	%rsi, %r8
	movl	$.LC117, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	jmp	.L311
.L325:
	leaq	-5072(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L327
	movq	%rax, %rdi
	call	__asan_report_load1
.L327:
	movzbl	-5072(%rbp), %eax
	cmpb	$47, %al
	jne	.L328
	leaq	-5072(%rbp), %rax
	leaq	1(%rax), %rdx
	leaq	-5072(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L329
.L328:
	jmp	.L329
.L330:
	movq	-10360(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-10360(%rbp), %rax
	addq	$1, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
.L329:
	leaq	-5072(%rbp), %rax
	movl	$.LC118, %esi
	movq	%rax, %rdi
	call	strstr
	movq	%rax, -10360(%rbp)
	cmpq	$0, -10360(%rbp)
	jne	.L330
	movl	numthrottles(%rip), %edx
	movl	maxthrottles(%rip), %eax
	cmpl	%eax, %edx
	jl	.L331
	movl	maxthrottles(%rip), %eax
	testl	%eax, %eax
	jne	.L332
	movl	$100, maxthrottles(%rip)
	movl	maxthrottles(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, throttles(%rip)
	jmp	.L333
.L332:
	movl	maxthrottles(%rip), %eax
	addl	%eax, %eax
	movl	%eax, maxthrottles(%rip)
	movl	maxthrottles(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	throttles(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc
	movq	%rax, throttles(%rip)
.L333:
	movq	throttles(%rip), %rax
	testq	%rax, %rax
	jne	.L331
	movl	$.LC119, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movl	$.LC120, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L331:
	movq	throttles(%rip), %rcx
	movl	numthrottles(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %r12
	leaq	-5072(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, %rdx
	movq	%r12, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L334
	movq	%rax, %rdi
	call	__asan_report_store8
.L334:
	movq	%rdx, (%r12)
	movq	throttles(%rip), %rcx
	movl	numthrottles(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	-10320(%rbp), %rcx
	leaq	8(%rax), %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L335
	movq	%rdx, %rdi
	call	__asan_report_store8
.L335:
	movq	%rcx, 8(%rax)
	movq	throttles(%rip), %rcx
	movl	numthrottles(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	-10256(%rbp), %rcx
	leaq	16(%rax), %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L336
	movq	%rdx, %rdi
	call	__asan_report_store8
.L336:
	movq	%rcx, 16(%rax)
	movq	throttles(%rip), %rcx
	movl	numthrottles(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	24(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L337
	movq	%rdx, %rdi
	call	__asan_report_store8
.L337:
	movq	$0, 24(%rax)
	movq	throttles(%rip), %rcx
	movl	numthrottles(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	32(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L338
	movq	%rdx, %rdi
	call	__asan_report_store8
.L338:
	movq	$0, 32(%rax)
	movq	throttles(%rip), %rcx
	movl	numthrottles(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	leaq	40(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L339
	movq	%rax, %rdi
	call	__asan_report_store4
.L339:
	movl	$0, 40(%rdx)
	movl	numthrottles(%rip), %eax
	addl	$1, %eax
	movl	%eax, numthrottles(%rip)
.L311:
	movq	-10368(%rbp), %rdx
	leaq	-10128(%rbp), %rax
	movl	$5000, %esi
	movq	%rax, %rdi
	call	fgets
	testq	%rax, %rax
	jne	.L340
	movq	-10368(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	$0, (%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movl	$0, 24(%rbx)
	movq	$0, 652(%rbx)
	movq	$0, 1284(%rbx)
	addq	$10384, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	read_throttlefile, .-read_throttlefile
	.section	.rodata
.LC121:
	.string	"shut_down 1 32 16 2 tv "
	.text
	.type	shut_down, @function
shut_down:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	leaq	-112(%rbp), %rax
	movq	$1102416563, (%rax)
	movq	$.LC121, 8(%rax)
	shrq	$3, %rax
	leaq	2147450880(%rax), %rbx
	movl	$-235802127, (%rbx)
	movl	$-185335808, 4(%rbx)
	movl	$-202116109, 8(%rbx)
	leaq	-80(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	logstats
	movl	$0, -124(%rbp)
	jmp	.L342
.L351:
	movq	connects(%rip), %rcx
	movl	-124(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rax, %rcx
	movq	%rcx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%dl, %sil
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L343
	movq	%rax, %rdi
	call	__asan_report_load4
.L343:
	movl	(%rcx), %eax
	testl	%eax, %eax
	je	.L344
	movq	connects(%rip), %rcx
	movl	-124(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	8(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L345
	movq	%rdx, %rdi
	call	__asan_report_load8
.L345:
	movq	8(%rax), %rax
	leaq	-80(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	httpd_close_conn
.L344:
	movq	connects(%rip), %rcx
	movl	-124(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	8(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L346
	movq	%rdx, %rdi
	call	__asan_report_load8
.L346:
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L347
	movq	connects(%rip), %rcx
	movl	-124(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	8(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L348
	movq	%rdx, %rdi
	call	__asan_report_load8
.L348:
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	httpd_destroy_conn
	movq	connects(%rip), %rcx
	movl	-124(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	8(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L349
	movq	%rdx, %rdi
	call	__asan_report_load8
.L349:
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free
	movl	httpd_conn_count(%rip), %eax
	subl	$1, %eax
	movl	%eax, httpd_conn_count(%rip)
	movq	connects(%rip), %rcx
	movl	-124(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	8(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L350
	movq	%rdx, %rdi
	call	__asan_report_store8
.L350:
	movq	$0, 8(%rax)
.L347:
	addl	$1, -124(%rbp)
.L342:
	movl	max_connects(%rip), %eax
	cmpl	%eax, -124(%rbp)
	jl	.L351
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L352
	movq	hs(%rip), %rax
	movq	%rax, -120(%rbp)
	movq	$0, hs(%rip)
	movq	-120(%rbp), %rax
	addq	$72, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L353
	movq	%rax, %rdi
	call	__asan_report_load4
.L353:
	movq	-120(%rbp), %rax
	movl	72(%rax), %eax
	cmpl	$-1, %eax
	je	.L354
	movq	-120(%rbp), %rax
	movl	72(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
.L354:
	movq	-120(%rbp), %rax
	addq	$76, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L355
	movq	%rax, %rdi
	call	__asan_report_load4
.L355:
	movq	-120(%rbp), %rax
	movl	76(%rax), %eax
	cmpl	$-1, %eax
	je	.L356
	movq	-120(%rbp), %rax
	movl	76(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
.L356:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	httpd_terminate
.L352:
	call	mmc_destroy
	call	tmr_destroy
	movq	connects(%rip), %rax
	movq	%rax, %rdi
	call	free
	movq	throttles(%rip), %rax
	testq	%rax, %rax
	je	.L341
	movq	throttles(%rip), %rax
	movq	%rax, %rdi
	call	free
.L341:
	movq	$0, (%rbx)
	movl	$0, 8(%rbx)
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	shut_down, .-shut_down
	.section	.rodata
	.align 8
.LC122:
	.string	"handle_newconnect 1 32 8 11 client_data "
	.align 32
.LC123:
	.string	"too many connections!"
	.zero	42
	.align 32
.LC124:
	.string	"the connects free list is messed up"
	.zero	60
	.align 32
.LC125:
	.string	"out of memory allocating an httpd_conn"
	.zero	57
	.text
	.type	handle_newconnect, @function
handle_newconnect:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$136, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -136(%rbp)
	movl	%esi, -140(%rbp)
	leaq	-112(%rbp), %rax
	movq	$1102416563, (%rax)
	movq	$.LC122, 8(%rax)
	shrq	$3, %rax
	leaq	2147450880(%rax), %rbx
	movl	$-235802127, (%rbx)
	movl	$-185273344, 4(%rbx)
	movl	$-202116109, 8(%rbx)
.L387:
	movl	num_connects(%rip), %edx
	movl	max_connects(%rip), %eax
	cmpl	%eax, %edx
	jl	.L359
	movl	$.LC123, %esi
	movl	$4, %edi
	movl	$0, %eax
	call	syslog
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_run
	movl	$0, %eax
	jmp	.L388
.L359:
	movl	first_free_connect(%rip), %eax
	cmpl	$-1, %eax
	je	.L361
	movq	connects(%rip), %rcx
	movl	first_free_connect(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rax, %rcx
	movq	%rcx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%dl, %sil
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L362
	movq	%rax, %rdi
	call	__asan_report_load4
.L362:
	movl	(%rcx), %eax
	testl	%eax, %eax
	je	.L363
.L361:
	movl	$.LC124, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L363:
	movq	connects(%rip), %rcx
	movl	first_free_connect(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L364
	movq	%rax, %rdi
	call	__asan_report_load8
.L364:
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L365
	movl	$720, %edi
	call	malloc
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L366
	movl	$.LC125, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L366:
	movq	-120(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L367
	movq	%rax, %rdi
	call	__asan_report_load8
.L367:
	movq	-120(%rbp), %rax
	movq	8(%rax), %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L368
	movq	%rax, %rdi
	call	__asan_report_store4
.L368:
	movl	$0, (%rdx)
	movl	httpd_conn_count(%rip), %eax
	addl	$1, %eax
	movl	%eax, httpd_conn_count(%rip)
.L365:
	movq	-120(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L369
	movq	%rax, %rdi
	call	__asan_report_load8
.L369:
	movq	-120(%rbp), %rax
	movq	8(%rax), %rdx
	movq	hs(%rip), %rax
	movl	-140(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	httpd_get_conn
	testl	%eax, %eax
	je	.L371
	cmpl	$2, %eax
	je	.L372
	jmp	.L389
.L371:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_run
	movl	$0, %eax
	jmp	.L388
.L372:
	movl	$1, %eax
	jmp	.L388
.L389:
	movq	-120(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L373
	movq	%rax, %rdi
	call	__asan_report_store4
.L373:
	movq	-120(%rbp), %rax
	movl	$1, (%rax)
	movq	-120(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L374
	movq	%rax, %rdi
	call	__asan_report_load4
.L374:
	movq	-120(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, first_free_connect(%rip)
	movq	-120(%rbp), %rax
	movl	$-1, 4(%rax)
	movl	num_connects(%rip), %eax
	addl	$1, %eax
	movl	%eax, num_connects(%rip)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L375
	movq	%rax, %rdi
	call	__asan_report_store8
.L375:
	movq	-120(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L376
	movq	%rax, %rdi
	call	__asan_report_load8
.L376:
	movq	-136(%rbp), %rax
	movq	(%rax), %rdx
	movq	-120(%rbp), %rax
	addq	$88, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L377
	movq	%rax, %rdi
	call	__asan_report_store8
.L377:
	movq	-120(%rbp), %rax
	movq	%rdx, 88(%rax)
	movq	-120(%rbp), %rax
	addq	$96, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L378
	movq	%rax, %rdi
	call	__asan_report_store8
.L378:
	movq	-120(%rbp), %rax
	movq	$0, 96(%rax)
	movq	-120(%rbp), %rax
	addq	$104, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L379
	movq	%rax, %rdi
	call	__asan_report_store8
.L379:
	movq	-120(%rbp), %rax
	movq	$0, 104(%rax)
	movq	-120(%rbp), %rax
	addq	$136, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L380
	movq	%rax, %rdi
	call	__asan_report_store8
.L380:
	movq	-120(%rbp), %rax
	movq	$0, 136(%rax)
	movq	-120(%rbp), %rax
	addq	$56, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L381
	movq	%rax, %rdi
	call	__asan_report_store4
.L381:
	movq	-120(%rbp), %rax
	movl	$0, 56(%rax)
	movq	-120(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L382
	movq	%rax, %rdi
	call	__asan_report_load8
.L382:
	movq	-120(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	704(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L383
	movq	%rax, %rdi
	call	__asan_report_load4
.L383:
	movl	704(%rdx), %eax
	movl	%eax, %edi
	call	httpd_set_ndelay
	movq	-120(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L384
	movq	%rax, %rdi
	call	__asan_report_load8
.L384:
	movq	-120(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	704(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L385
	movq	%rax, %rdi
	call	__asan_report_load4
.L385:
	movl	704(%rdx), %eax
	movq	-120(%rbp), %rcx
	movl	$0, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	fdwatch_add_fd
	movq	stats_connections(%rip), %rax
	addq	$1, %rax
	movq	%rax, stats_connections(%rip)
	movl	num_connects(%rip), %edx
	movl	stats_simultaneous(%rip), %eax
	cmpl	%eax, %edx
	jle	.L386
	movl	num_connects(%rip), %eax
	movl	%eax, stats_simultaneous(%rip)
	jmp	.L387
.L386:
	jmp	.L387
.L388:
	movq	$0, (%rbx)
	movl	$0, 8(%rbx)
	addq	$136, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	handle_newconnect, .-handle_newconnect
	.section	.rodata
	.align 8
.LC126:
	.string	"handle_read 1 32 8 11 client_data "
	.text
	.type	handle_read, @function
handle_read:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$136, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -136(%rbp)
	movq	%rsi, -144(%rbp)
	leaq	-112(%rbp), %rax
	movq	$1102416563, (%rax)
	movq	$.LC126, 8(%rax)
	shrq	$3, %rax
	leaq	2147450880(%rax), %rbx
	movl	$-235802127, (%rbx)
	movl	$-185273344, 4(%rbx)
	movl	$-202116109, 8(%rbx)
	movq	-136(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L391
	movq	%rax, %rdi
	call	__asan_report_load8
.L391:
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	addq	$160, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L392
	movq	%rax, %rdi
	call	__asan_report_load8
.L392:
	movq	-120(%rbp), %rax
	movq	160(%rax), %rcx
	movq	-120(%rbp), %rax
	addq	$152, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L393
	movq	%rax, %rdi
	call	__asan_report_load8
.L393:
	movq	-120(%rbp), %rax
	movq	152(%rax), %rax
	cmpq	%rax, %rcx
	jb	.L394
	movq	-120(%rbp), %rax
	movq	152(%rax), %rax
	cmpq	$5000, %rax
	jbe	.L395
	movq	httpd_err400form(%rip), %rcx
	movq	httpd_err400title(%rip), %rdx
	movq	-120(%rbp), %rax
	movl	$.LC48, %r9d
	movq	%rcx, %r8
	movl	$.LC48, %ecx
	movl	$400, %esi
	movq	%rax, %rdi
	call	httpd_send_err
	movq	-144(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L390
.L395:
	movq	-120(%rbp), %rax
	addq	$152, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L397
	movq	%rax, %rdi
	call	__asan_report_load8
.L397:
	movq	-120(%rbp), %rax
	movq	152(%rax), %rax
	leaq	1000(%rax), %rdx
	movq	-120(%rbp), %rax
	leaq	152(%rax), %rcx
	movq	-120(%rbp), %rax
	addq	$144, %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	httpd_realloc_str
.L394:
	movq	-120(%rbp), %rax
	addq	$152, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L398
	movq	%rax, %rdi
	call	__asan_report_load8
.L398:
	movq	-120(%rbp), %rax
	movq	152(%rax), %rcx
	movq	-120(%rbp), %rax
	addq	$160, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L399
	movq	%rax, %rdi
	call	__asan_report_load8
.L399:
	movq	-120(%rbp), %rax
	movq	160(%rax), %rax
	movq	%rcx, %rsi
	subq	%rax, %rsi
	movq	-120(%rbp), %rax
	addq	$144, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L400
	movq	%rax, %rdi
	call	__asan_report_load8
.L400:
	movq	-120(%rbp), %rax
	movq	144(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	160(%rax), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-120(%rbp), %rax
	addq	$704, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%r8b
	movq	%rax, %rdi
	andl	$7, %edi
	addl	$3, %edi
	cmpb	%dl, %dil
	setge	%dl
	andl	%r8d, %edx
	testb	%dl, %dl
	je	.L401
	movq	%rax, %rdi
	call	__asan_report_load4
.L401:
	movq	-120(%rbp), %rax
	movl	704(%rax), %eax
	movq	%rsi, %rdx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -124(%rbp)
	cmpl	$0, -124(%rbp)
	jne	.L402
	movq	httpd_err400form(%rip), %rcx
	movq	httpd_err400title(%rip), %rdx
	movq	-120(%rbp), %rax
	movl	$.LC48, %r9d
	movq	%rcx, %r8
	movl	$.LC48, %ecx
	movl	$400, %esi
	movq	%rax, %rdi
	call	httpd_send_err
	movq	-144(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L390
.L402:
	cmpl	$0, -124(%rbp)
	jns	.L403
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L404
	movq	%rax, %rdi
	call	__asan_report_load4
.L404:
	movl	(%rdx), %eax
	cmpl	$4, %eax
	je	.L405
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L406
	movq	%rax, %rdi
	call	__asan_report_load4
.L406:
	movl	(%rdx), %eax
	cmpl	$11, %eax
	je	.L405
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L407
	movq	%rax, %rdi
	call	__asan_report_load4
.L407:
	movl	(%rdx), %eax
	cmpl	$11, %eax
	jne	.L408
.L405:
	jmp	.L390
.L408:
	movq	httpd_err400form(%rip), %rcx
	movq	httpd_err400title(%rip), %rdx
	movq	-120(%rbp), %rax
	movl	$.LC48, %r9d
	movq	%rcx, %r8
	movl	$.LC48, %ecx
	movl	$400, %esi
	movq	%rax, %rdi
	call	httpd_send_err
	movq	-144(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L390
.L403:
	movq	-120(%rbp), %rax
	addq	$160, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L409
	movq	%rax, %rdi
	call	__asan_report_load8
.L409:
	movq	-120(%rbp), %rax
	movq	160(%rax), %rdx
	movl	-124(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, 160(%rax)
	movq	-144(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L410
	movq	%rax, %rdi
	call	__asan_report_load8
.L410:
	movq	-144(%rbp), %rax
	movq	(%rax), %rdx
	movq	-136(%rbp), %rax
	addq	$88, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L411
	movq	%rax, %rdi
	call	__asan_report_store8
.L411:
	movq	-136(%rbp), %rax
	movq	%rdx, 88(%rax)
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	httpd_got_request
	testl	%eax, %eax
	je	.L454
	cmpl	$2, %eax
	jne	.L453
	movq	httpd_err400form(%rip), %rcx
	movq	httpd_err400title(%rip), %rdx
	movq	-120(%rbp), %rax
	movl	$.LC48, %r9d
	movq	%rcx, %r8
	movl	$.LC48, %ecx
	movl	$400, %esi
	movq	%rax, %rdi
	call	httpd_send_err
	movq	-144(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L390
.L453:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	httpd_parse_request
	testl	%eax, %eax
	jns	.L415
	movq	-144(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L390
.L415:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	check_throttles
	testl	%eax, %eax
	jne	.L416
	movq	-120(%rbp), %rax
	addq	$208, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L417
	movq	%rax, %rdi
	call	__asan_report_load8
.L417:
	movq	-120(%rbp), %rax
	movq	208(%rax), %rsi
	movq	httpd_err503form(%rip), %rcx
	movq	httpd_err503title(%rip), %rdx
	movq	-120(%rbp), %rax
	movq	%rsi, %r9
	movq	%rcx, %r8
	movl	$.LC48, %ecx
	movl	$503, %esi
	movq	%rax, %rdi
	call	httpd_send_err
	movq	-144(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L390
.L416:
	movq	-144(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	httpd_start_request
	testl	%eax, %eax
	jns	.L418
	movq	-144(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L390
.L418:
	movq	-120(%rbp), %rax
	addq	$528, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L419
	movq	%rax, %rdi
	call	__asan_report_load4
.L419:
	movq	-120(%rbp), %rax
	movl	528(%rax), %eax
	testl	%eax, %eax
	je	.L420
	movq	-120(%rbp), %rax
	addq	$536, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L421
	movq	%rax, %rdi
	call	__asan_report_load8
.L421:
	movq	-120(%rbp), %rax
	movq	536(%rax), %rdx
	movq	-136(%rbp), %rax
	addq	$136, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L422
	movq	%rax, %rdi
	call	__asan_report_store8
.L422:
	movq	-136(%rbp), %rax
	movq	%rdx, 136(%rax)
	movq	-120(%rbp), %rax
	addq	$544, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L423
	movq	%rax, %rdi
	call	__asan_report_load8
.L423:
	movq	-120(%rbp), %rax
	movq	544(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-136(%rbp), %rax
	subq	$-128, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L424
	movq	%rax, %rdi
	call	__asan_report_store8
.L424:
	movq	-136(%rbp), %rax
	movq	%rcx, 128(%rax)
	jmp	.L425
.L420:
	movq	-120(%rbp), %rax
	addq	$192, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L426
	movq	%rax, %rdi
	call	__asan_report_load8
.L426:
	movq	-120(%rbp), %rax
	movq	192(%rax), %rax
	testq	%rax, %rax
	jns	.L427
	movq	-136(%rbp), %rax
	subq	$-128, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L428
	movq	%rax, %rdi
	call	__asan_report_store8
.L428:
	movq	-136(%rbp), %rax
	movq	$0, 128(%rax)
	jmp	.L425
.L427:
	movq	-120(%rbp), %rax
	addq	$192, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L429
	movq	%rax, %rdi
	call	__asan_report_load8
.L429:
	movq	-120(%rbp), %rax
	movq	192(%rax), %rdx
	movq	-136(%rbp), %rax
	subq	$-128, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L430
	movq	%rax, %rdi
	call	__asan_report_store8
.L430:
	movq	-136(%rbp), %rax
	movq	%rdx, 128(%rax)
.L425:
	movq	-120(%rbp), %rax
	addq	$712, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L431
	movq	%rax, %rdi
	call	__asan_report_load8
.L431:
	movq	-120(%rbp), %rax
	movq	712(%rax), %rax
	testq	%rax, %rax
	jne	.L432
	movl	$0, -128(%rbp)
	jmp	.L433
.L439:
	movq	throttles(%rip), %rcx
	movl	-128(%rbp), %eax
	cltq
	addq	$4, %rax
	leaq	0(,%rax,4), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%dl, %sil
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L434
	movq	%rax, %rdi
	call	__asan_report_load4
.L434:
	movq	-136(%rbp), %rax
	movl	-128(%rbp), %edx
	movslq	%edx, %rdx
	addq	$4, %rdx
	movl	(%rax,%rdx,4), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movq	throttles(%rip), %rsi
	movq	-136(%rbp), %rax
	movl	-128(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	$4, %rcx
	movl	(%rax,%rcx,4), %eax
	movslq	%eax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	leaq	32(%rax), %rcx
	movq	%rcx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L435
	movq	%rcx, %rdi
	call	__asan_report_load8
.L435:
	movq	32(%rax), %rsi
	movq	-120(%rbp), %rax
	addq	$200, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L436
	movq	%rax, %rdi
	call	__asan_report_load8
.L436:
	movq	-120(%rbp), %rax
	movq	200(%rax), %rax
	addq	%rax, %rsi
	leaq	32(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L437
	movq	%rax, %rdi
	call	__asan_report_store8
.L437:
	movq	%rsi, 32(%rdx)
	addl	$1, -128(%rbp)
.L433:
	movq	-136(%rbp), %rax
	addq	$56, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L438
	movq	%rax, %rdi
	call	__asan_report_load4
.L438:
	movq	-136(%rbp), %rax
	movl	56(%rax), %eax
	cmpl	-128(%rbp), %eax
	jg	.L439
	movq	-120(%rbp), %rax
	addq	$200, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L440
	movq	%rax, %rdi
	call	__asan_report_load8
.L440:
	movq	-120(%rbp), %rax
	movq	200(%rax), %rdx
	movq	-136(%rbp), %rax
	addq	$136, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L441
	movq	%rax, %rdi
	call	__asan_report_store8
.L441:
	movq	-136(%rbp), %rax
	movq	%rdx, 136(%rax)
	movq	-144(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L390
.L432:
	movq	-136(%rbp), %rax
	addq	$136, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L442
	movq	%rax, %rdi
	call	__asan_report_load8
.L442:
	movq	-136(%rbp), %rax
	movq	136(%rax), %rcx
	movq	-136(%rbp), %rax
	subq	$-128, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L443
	movq	%rax, %rdi
	call	__asan_report_load8
.L443:
	movq	-136(%rbp), %rax
	movq	128(%rax), %rax
	cmpq	%rax, %rcx
	jl	.L444
	movq	-144(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L390
.L444:
	movq	-136(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L445
	movq	%rax, %rdi
	call	__asan_report_store4
.L445:
	movq	-136(%rbp), %rax
	movl	$2, (%rax)
	movq	-144(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L446
	movq	%rax, %rdi
	call	__asan_report_load8
.L446:
	movq	-144(%rbp), %rax
	movq	(%rax), %rdx
	movq	-136(%rbp), %rax
	addq	$80, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L447
	movq	%rax, %rdi
	call	__asan_report_store8
.L447:
	movq	-136(%rbp), %rax
	movq	%rdx, 80(%rax)
	movq	-136(%rbp), %rax
	addq	$112, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L448
	movq	%rax, %rdi
	call	__asan_report_store8
.L448:
	movq	-136(%rbp), %rax
	movq	$0, 112(%rax)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L449
	movq	%rax, %rdi
	call	__asan_report_store8
.L449:
	movq	-136(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-120(%rbp), %rax
	addq	$704, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L450
	movq	%rax, %rdi
	call	__asan_report_load4
.L450:
	movq	-120(%rbp), %rax
	movl	704(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
	movq	-120(%rbp), %rax
	addq	$704, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L451
	movq	%rax, %rdi
	call	__asan_report_load4
.L451:
	movq	-120(%rbp), %rax
	movl	704(%rax), %eax
	movq	-136(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	fdwatch_add_fd
	jmp	.L390
.L454:
	nop
.L390:
	movq	$0, (%rbx)
	movl	$0, 8(%rbx)
	addq	$136, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	handle_read, .-handle_read
	.section	.rodata
	.align 8
.LC127:
	.string	"handle_send 2 32 8 11 client_data 96 32 2 iv "
	.align 32
.LC128:
	.string	"replacing non-null wakeup_timer!"
	.zero	63
	.align 32
.LC129:
	.string	"tmr_create(wakeup_connection) failed"
	.zero	59
	.align 32
.LC130:
	.string	"write - %m sending %.80s"
	.zero	39
	.text
	.type	handle_send, @function
handle_send:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$232, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -232(%rbp)
	movq	%rsi, -240(%rbp)
	leaq	-176(%rbp), %rax
	movq	$1102416563, (%rax)
	movq	$.LC127, 8(%rax)
	shrq	$3, %rax
	leaq	2147450880(%rax), %rbx
	movl	$-235802127, (%rbx)
	movl	$-185273344, 4(%rbx)
	movl	$-218959118, 8(%rbx)
	movl	$-202116109, 16(%rbx)
	movq	-232(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L456
	movq	%rax, %rdi
	call	__asan_report_load8
.L456:
	movq	-232(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -184(%rbp)
	movq	-232(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L457
	movq	%rax, %rdi
	call	__asan_report_load8
.L457:
	movq	-232(%rbp), %rax
	movq	64(%rax), %rax
	cmpq	$-1, %rax
	jne	.L458
	movq	$1000000000, -200(%rbp)
	jmp	.L459
.L458:
	movq	-232(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L460
	movq	%rax, %rdi
	call	__asan_report_load8
.L460:
	movq	-232(%rbp), %rax
	movq	64(%rax), %rax
	leaq	3(%rax), %rdx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	sarq	$2, %rax
	movq	%rax, -200(%rbp)
.L459:
	movq	-184(%rbp), %rax
	addq	$472, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L461
	movq	%rax, %rdi
	call	__asan_report_load8
.L461:
	movq	-184(%rbp), %rax
	movq	472(%rax), %rax
	testq	%rax, %rax
	jne	.L462
	movq	-232(%rbp), %rax
	subq	$-128, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L463
	movq	%rax, %rdi
	call	__asan_report_load8
.L463:
	movq	-232(%rbp), %rax
	movq	128(%rax), %rcx
	movq	-232(%rbp), %rax
	addq	$136, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L464
	movq	%rax, %rdi
	call	__asan_report_load8
.L464:
	movq	-232(%rbp), %rax
	movq	136(%rax), %rax
	subq	%rax, %rcx
	movq	%rcx, %rax
	movq	%rax, %rdx
	movq	-200(%rbp), %rax
	cmpq	%rax, %rdx
	cmovbe	%rdx, %rax
	movq	%rax, %rcx
	movq	-184(%rbp), %rax
	addq	$712, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L465
	movq	%rax, %rdi
	call	__asan_report_load8
.L465:
	movq	-184(%rbp), %rax
	movq	712(%rax), %rdx
	movq	-232(%rbp), %rax
	movq	136(%rax), %rax
	leaq	(%rdx,%rax), %rsi
	movq	-184(%rbp), %rax
	addq	$704, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%r8b
	movq	%rax, %rdi
	andl	$7, %edi
	addl	$3, %edi
	cmpb	%dl, %dil
	setge	%dl
	andl	%r8d, %edx
	testb	%dl, %dl
	je	.L466
	movq	%rax, %rdi
	call	__asan_report_load4
.L466:
	movq	-184(%rbp), %rax
	movl	704(%rax), %eax
	movq	%rcx, %rdx
	movl	%eax, %edi
	call	write
	movl	%eax, -216(%rbp)
	jmp	.L467
.L462:
	movq	-184(%rbp), %rax
	addq	$368, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L468
	movq	%rax, %rdi
	call	__asan_report_load8
.L468:
	movq	-184(%rbp), %rax
	movq	368(%rax), %rdx
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L469
	movq	%rax, %rdi
	call	__asan_report_store8
.L469:
	movq	%rdx, -80(%rbp)
	movq	-184(%rbp), %rax
	addq	$472, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L470
	movq	%rax, %rdi
	call	__asan_report_load8
.L470:
	movq	-184(%rbp), %rax
	movq	472(%rax), %rdx
	leaq	-80(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L471
	movq	%rax, %rdi
	call	__asan_report_store8
.L471:
	movq	%rdx, -72(%rbp)
	movq	-184(%rbp), %rax
	addq	$712, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L472
	movq	%rax, %rdi
	call	__asan_report_load8
.L472:
	movq	-184(%rbp), %rax
	movq	712(%rax), %rcx
	movq	-232(%rbp), %rax
	addq	$136, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L473
	movq	%rax, %rdi
	call	__asan_report_load8
.L473:
	movq	-232(%rbp), %rax
	movq	136(%rax), %rax
	addq	%rax, %rcx
	leaq	-80(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L474
	movq	%rax, %rdi
	call	__asan_report_store8
.L474:
	movq	%rcx, -64(%rbp)
	movq	-232(%rbp), %rax
	subq	$-128, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L475
	movq	%rax, %rdi
	call	__asan_report_load8
.L475:
	movq	-232(%rbp), %rax
	movq	128(%rax), %rdx
	movq	-232(%rbp), %rax
	movq	136(%rax), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	-200(%rbp), %rax
	cmpq	%rax, %rdx
	cmova	%rax, %rdx
	leaq	-80(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L476
	movq	%rax, %rdi
	call	__asan_report_store8
.L476:
	movq	%rdx, -56(%rbp)
	movq	-184(%rbp), %rax
	addq	$704, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L477
	movq	%rax, %rdi
	call	__asan_report_load4
.L477:
	movq	-184(%rbp), %rax
	movl	704(%rax), %eax
	leaq	-80(%rbp), %rcx
	movl	$2, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	writev
	movl	%eax, -216(%rbp)
.L467:
	cmpl	$0, -216(%rbp)
	jns	.L478
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L479
	movq	%rax, %rdi
	call	__asan_report_load4
.L479:
	movl	(%rdx), %eax
	cmpl	$4, %eax
	jne	.L478
	jmp	.L455
.L478:
	cmpl	$0, -216(%rbp)
	je	.L481
	cmpl	$0, -216(%rbp)
	jns	.L482
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L483
	movq	%rax, %rdi
	call	__asan_report_load4
.L483:
	movl	(%rdx), %eax
	cmpl	$11, %eax
	je	.L481
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L484
	movq	%rax, %rdi
	call	__asan_report_load4
.L484:
	movl	(%rdx), %eax
	cmpl	$11, %eax
	jne	.L482
.L481:
	movq	-232(%rbp), %rax
	addq	$112, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L485
	movq	%rax, %rdi
	call	__asan_report_load8
.L485:
	movq	-232(%rbp), %rax
	movq	112(%rax), %rax
	leaq	100(%rax), %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, 112(%rax)
	movq	-232(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L486
	movq	%rax, %rdi
	call	__asan_report_store4
.L486:
	movq	-232(%rbp), %rax
	movl	$3, (%rax)
	movq	-184(%rbp), %rax
	addq	$704, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L487
	movq	%rax, %rdi
	call	__asan_report_load4
.L487:
	movq	-184(%rbp), %rax
	movl	704(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
	leaq	-144(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L488
	movq	%rax, %rdi
	call	__asan_report_store8
.L488:
	movq	-232(%rbp), %rax
	movq	%rax, -144(%rbp)
	movq	-232(%rbp), %rax
	addq	$96, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L489
	movq	%rax, %rdi
	call	__asan_report_load8
.L489:
	movq	-232(%rbp), %rax
	movq	96(%rax), %rax
	testq	%rax, %rax
	je	.L490
	movl	$.LC128, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
.L490:
	movq	-232(%rbp), %rax
	addq	$112, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L491
	movq	%rax, %rdi
	call	__asan_report_load8
.L491:
	movq	-232(%rbp), %rax
	movq	112(%rax), %rcx
	movq	-144(%rbp), %rdx
	movq	-240(%rbp), %rax
	movl	$0, %r8d
	movl	$wakeup_connection, %esi
	movq	%rax, %rdi
	call	tmr_create
	movq	%rax, %rdx
	movq	-232(%rbp), %rax
	addq	$96, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L492
	movq	%rax, %rdi
	call	__asan_report_store8
.L492:
	movq	-232(%rbp), %rax
	movq	%rdx, 96(%rax)
	movq	-232(%rbp), %rax
	movq	96(%rax), %rax
	testq	%rax, %rax
	jne	.L493
	movl	$.LC129, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L493:
	jmp	.L455
.L482:
	cmpl	$0, -216(%rbp)
	jns	.L494
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L495
	movq	%rax, %rdi
	call	__asan_report_load4
.L495:
	movl	(%rdx), %eax
	cmpl	$32, %eax
	je	.L496
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L497
	movq	%rax, %rdi
	call	__asan_report_load4
.L497:
	movl	(%rdx), %eax
	cmpl	$22, %eax
	je	.L496
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L498
	movq	%rax, %rdi
	call	__asan_report_load4
.L498:
	movl	(%rdx), %eax
	cmpl	$104, %eax
	je	.L496
	movq	-184(%rbp), %rax
	addq	$208, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L499
	movq	%rax, %rdi
	call	__asan_report_load8
.L499:
	movq	-184(%rbp), %rax
	movq	208(%rax), %rax
	movq	%rax, %rdx
	movl	$.LC130, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
.L496:
	movq	-240(%rbp), %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	clear_connection
	jmp	.L455
.L494:
	movq	-240(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L500
	movq	%rax, %rdi
	call	__asan_report_load8
.L500:
	movq	-240(%rbp), %rax
	movq	(%rax), %rdx
	movq	-232(%rbp), %rax
	addq	$88, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L501
	movq	%rax, %rdi
	call	__asan_report_store8
.L501:
	movq	-232(%rbp), %rax
	movq	%rdx, 88(%rax)
	movq	-184(%rbp), %rax
	addq	$472, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L502
	movq	%rax, %rdi
	call	__asan_report_load8
.L502:
	movq	-184(%rbp), %rax
	movq	472(%rax), %rax
	testq	%rax, %rax
	je	.L503
	movl	-216(%rbp), %eax
	movslq	%eax, %rdx
	movq	-184(%rbp), %rax
	movq	472(%rax), %rax
	cmpq	%rax, %rdx
	jae	.L504
	movq	-184(%rbp), %rax
	movq	472(%rax), %rax
	movl	%eax, %edx
	movl	-216(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -208(%rbp)
	movl	-208(%rbp), %eax
	cltq
	movq	-184(%rbp), %rdx
	addq	$368, %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L505
	movq	%rdx, %rdi
	call	__asan_report_load8
.L505:
	movq	-184(%rbp), %rdx
	movq	368(%rdx), %rcx
	movl	-216(%rbp), %edx
	movslq	%edx, %rdx
	leaq	(%rcx,%rdx), %rdi
	movq	-184(%rbp), %rdx
	movq	368(%rdx), %rcx
	testq	%rax, %rax
	je	.L506
	movq	%rdi, %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	setne	%r9b
	movq	%rdx, %r8
	andl	$7, %r8d
	cmpb	%sil, %r8b
	setge	%sil
	andl	%esi, %r9d
	leaq	-1(%rax), %rsi
	addq	%rdi, %rsi
	movq	%rsi, %r8
	shrq	$3, %r8
	addq	$2147450880, %r8
	movzbl	(%r8), %r8d
	testb	%r8b, %r8b
	setne	%r11b
	movq	%rsi, %r10
	andl	$7, %r10d
	cmpb	%r8b, %r10b
	setge	%r8b
	andl	%r11d, %r8d
	testb	%r8b, %r8b
	je	.L507
	movq	%rsi, %rdi
	call	__asan_report_load1
.L507:
	testb	%r9b, %r9b
	je	.L506
	movq	%rdx, %rdi
	call	__asan_report_load1
.L506:
	testq	%rax, %rax
	je	.L508
	movq	%rcx, %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	setne	%r9b
	movq	%rdx, %r8
	andl	$7, %r8d
	cmpb	%sil, %r8b
	setge	%sil
	andl	%esi, %r9d
	leaq	-1(%rax), %rsi
	addq	%rcx, %rsi
	movq	%rsi, %r8
	shrq	$3, %r8
	addq	$2147450880, %r8
	movzbl	(%r8), %r8d
	testb	%r8b, %r8b
	setne	%r11b
	movq	%rsi, %r10
	andl	$7, %r10d
	cmpb	%r8b, %r10b
	setge	%r8b
	andl	%r11d, %r8d
	testb	%r8b, %r8b
	je	.L509
	movq	%rsi, %rdi
	call	__asan_report_store1
.L509:
	testb	%r9b, %r9b
	je	.L508
	movq	%rdx, %rdi
	call	__asan_report_store1
.L508:
	movq	%rax, %rdx
	movq	%rdi, %rsi
	movq	%rcx, %rdi
	call	memmove
	movl	-208(%rbp), %eax
	movslq	%eax, %rdx
	movq	-184(%rbp), %rax
	movq	%rdx, 472(%rax)
	movl	$0, -216(%rbp)
	jmp	.L503
.L504:
	movl	-216(%rbp), %ecx
	movq	-184(%rbp), %rax
	addq	$472, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L510
	movq	%rax, %rdi
	call	__asan_report_load8
.L510:
	movq	-184(%rbp), %rax
	movq	472(%rax), %rax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -216(%rbp)
	movq	-184(%rbp), %rax
	movq	$0, 472(%rax)
.L503:
	movq	-232(%rbp), %rax
	addq	$136, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L511
	movq	%rax, %rdi
	call	__asan_report_load8
.L511:
	movq	-232(%rbp), %rax
	movq	136(%rax), %rdx
	movl	-216(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, 136(%rax)
	movq	-232(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L512
	movq	%rax, %rdi
	call	__asan_report_load8
.L512:
	movq	-232(%rbp), %rax
	movq	8(%rax), %rax
	movq	-232(%rbp), %rdx
	movq	8(%rdx), %rdx
	leaq	200(%rdx), %rcx
	movq	%rcx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L513
	movq	%rcx, %rdi
	call	__asan_report_load8
.L513:
	movq	200(%rdx), %rcx
	movl	-216(%rbp), %edx
	movslq	%edx, %rdx
	leaq	(%rcx,%rdx), %rsi
	leaq	200(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L514
	movq	%rdx, %rdi
	call	__asan_report_store8
.L514:
	movq	%rsi, 200(%rax)
	movl	$0, -212(%rbp)
	jmp	.L515
.L520:
	movq	throttles(%rip), %rcx
	movl	-212(%rbp), %eax
	cltq
	addq	$4, %rax
	leaq	0(,%rax,4), %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%dl, %sil
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L516
	movq	%rax, %rdi
	call	__asan_report_load4
.L516:
	movq	-232(%rbp), %rax
	movl	-212(%rbp), %edx
	movslq	%edx, %rdx
	addq	$4, %rdx
	movl	(%rax,%rdx,4), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movq	throttles(%rip), %rsi
	movq	-232(%rbp), %rax
	movl	-212(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	$4, %rcx
	movl	(%rax,%rcx,4), %eax
	movslq	%eax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	leaq	32(%rax), %rcx
	movq	%rcx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L517
	movq	%rcx, %rdi
	call	__asan_report_load8
.L517:
	movq	32(%rax), %rcx
	movl	-216(%rbp), %eax
	cltq
	leaq	(%rcx,%rax), %rsi
	leaq	32(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L518
	movq	%rax, %rdi
	call	__asan_report_store8
.L518:
	movq	%rsi, 32(%rdx)
	addl	$1, -212(%rbp)
.L515:
	movq	-232(%rbp), %rax
	addq	$56, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L519
	movq	%rax, %rdi
	call	__asan_report_load4
.L519:
	movq	-232(%rbp), %rax
	movl	56(%rax), %eax
	cmpl	-212(%rbp), %eax
	jg	.L520
	movq	-232(%rbp), %rax
	addq	$136, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L521
	movq	%rax, %rdi
	call	__asan_report_load8
.L521:
	movq	-232(%rbp), %rax
	movq	136(%rax), %rcx
	movq	-232(%rbp), %rax
	subq	$-128, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L522
	movq	%rax, %rdi
	call	__asan_report_load8
.L522:
	movq	-232(%rbp), %rax
	movq	128(%rax), %rax
	cmpq	%rax, %rcx
	jl	.L523
	movq	-240(%rbp), %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L455
.L523:
	movq	-232(%rbp), %rax
	addq	$112, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L524
	movq	%rax, %rdi
	call	__asan_report_load8
.L524:
	movq	-232(%rbp), %rax
	movq	112(%rax), %rax
	cmpq	$100, %rax
	jle	.L525
	movq	-232(%rbp), %rax
	movq	112(%rax), %rax
	leaq	-100(%rax), %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, 112(%rax)
.L525:
	movq	-232(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L526
	movq	%rax, %rdi
	call	__asan_report_load8
.L526:
	movq	-232(%rbp), %rax
	movq	64(%rax), %rax
	cmpq	$-1, %rax
	je	.L455
	movq	-240(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L528
	movq	%rax, %rdi
	call	__asan_report_load8
.L528:
	movq	-240(%rbp), %rax
	movq	(%rax), %rcx
	movq	-232(%rbp), %rax
	addq	$80, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L529
	movq	%rax, %rdi
	call	__asan_report_load8
.L529:
	movq	-232(%rbp), %rax
	movq	80(%rax), %rax
	subq	%rax, %rcx
	movq	%rcx, %rax
	movq	%rax, -192(%rbp)
	cmpq	$0, -192(%rbp)
	jne	.L530
	movq	$1, -192(%rbp)
.L530:
	movq	-232(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L531
	movq	%rax, %rdi
	call	__asan_report_load8
.L531:
	movq	-232(%rbp), %rax
	movq	8(%rax), %rax
	leaq	200(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L532
	movq	%rdx, %rdi
	call	__asan_report_load8
.L532:
	movq	200(%rax), %rax
	cqto
	idivq	-192(%rbp)
	movq	%rax, %rcx
	movq	-232(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L533
	movq	%rax, %rdi
	call	__asan_report_load8
.L533:
	movq	-232(%rbp), %rax
	movq	64(%rax), %rax
	cmpq	%rax, %rcx
	jle	.L455
	movq	-232(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L534
	movq	%rax, %rdi
	call	__asan_report_store4
.L534:
	movq	-232(%rbp), %rax
	movl	$3, (%rax)
	movq	-184(%rbp), %rax
	addq	$704, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L535
	movq	%rax, %rdi
	call	__asan_report_load4
.L535:
	movq	-184(%rbp), %rax
	movl	704(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
	movq	-232(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L536
	movq	%rax, %rdi
	call	__asan_report_load8
.L536:
	movq	-232(%rbp), %rax
	movq	8(%rax), %rax
	leaq	200(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L537
	movq	%rdx, %rdi
	call	__asan_report_load8
.L537:
	movq	200(%rax), %rdx
	movq	-232(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L538
	movq	%rax, %rdi
	call	__asan_report_load8
.L538:
	movq	-232(%rbp), %rax
	movq	64(%rax), %rcx
	movq	%rdx, %rax
	cqto
	idivq	%rcx
	movl	%eax, %edx
	movq	-192(%rbp), %rax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -204(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L539
	movq	%rax, %rdi
	call	__asan_report_store8
.L539:
	movq	-232(%rbp), %rax
	movq	%rax, -144(%rbp)
	movq	-232(%rbp), %rax
	addq	$96, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L540
	movq	%rax, %rdi
	call	__asan_report_load8
.L540:
	movq	-232(%rbp), %rax
	movq	96(%rax), %rax
	testq	%rax, %rax
	je	.L541
	movl	$.LC128, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
.L541:
	cmpl	$0, -204(%rbp)
	jle	.L542
	movl	-204(%rbp), %eax
	cltq
	imulq	$1000, %rax, %rax
	jmp	.L543
.L542:
	movl	$500, %eax
.L543:
	movq	-144(%rbp), %rdx
	movq	-240(%rbp), %rdi
	movl	$0, %r8d
	movq	%rax, %rcx
	movl	$wakeup_connection, %esi
	call	tmr_create
	movq	%rax, %rdx
	movq	-232(%rbp), %rax
	addq	$96, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L544
	movq	%rax, %rdi
	call	__asan_report_store8
.L544:
	movq	-232(%rbp), %rax
	movq	%rdx, 96(%rax)
	movq	-232(%rbp), %rax
	movq	96(%rax), %rax
	testq	%rax, %rax
	jne	.L455
	movl	$.LC129, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L455:
	movq	$0, (%rbx)
	movl	$0, 8(%rbx)
	movl	$0, 16(%rbx)
	addq	$232, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	handle_send, .-handle_send
	.section	.rodata
	.align 8
.LC131:
	.string	"handle_linger 1 32 4096 3 buf "
	.text
	.type	handle_linger, @function
handle_linger:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$4200, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -4200(%rbp)
	movq	%rsi, -4208(%rbp)
	leaq	-4176(%rbp), %rax
	movq	$1102416563, (%rax)
	movq	$.LC131, 8(%rax)
	shrq	$3, %rax
	leaq	2147450880(%rax), %rbx
	movl	$-235802127, (%rbx)
	movl	$-202116109, 516(%rbx)
	movq	-4200(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L547
	movq	%rax, %rdi
	call	__asan_report_load8
.L547:
	movq	-4200(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	704(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L548
	movq	%rax, %rdi
	call	__asan_report_load4
.L548:
	movl	704(%rdx), %eax
	leaq	-4144(%rbp), %rcx
	movl	$4096, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -4180(%rbp)
	cmpl	$0, -4180(%rbp)
	jns	.L549
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L550
	movq	%rax, %rdi
	call	__asan_report_load4
.L550:
	movl	(%rdx), %eax
	cmpl	$4, %eax
	je	.L546
	call	__errno_location
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L552
	movq	%rax, %rdi
	call	__asan_report_load4
.L552:
	movl	(%rdx), %eax
	cmpl	$11, %eax
	je	.L546
.L549:
	cmpl	$0, -4180(%rbp)
	jg	.L546
	movq	-4208(%rbp), %rdx
	movq	-4200(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	really_clear_connection
.L546:
	movl	$0, (%rbx)
	movl	$0, 516(%rbx)
	addq	$4200, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	handle_linger, .-handle_linger
	.section	.rodata
	.align 32
.LC132:
	.string	"throttle sending count was negative - shouldn't happen!"
	.zero	40
	.text
	.type	check_throttles, @function
check_throttles:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	addq	$56, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L556
	movq	%rax, %rdi
	call	__asan_report_store4
.L556:
	movq	-40(%rbp), %rax
	movl	$0, 56(%rax)
	movq	-40(%rbp), %rax
	addq	$72, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L557
	movq	%rax, %rdi
	call	__asan_report_store8
.L557:
	movq	-40(%rbp), %rax
	movq	$-1, 72(%rax)
	movq	-40(%rbp), %rax
	movq	72(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L558
	movq	%rax, %rdi
	call	__asan_report_store8
.L558:
	movq	-40(%rbp), %rax
	movq	%rdx, 64(%rax)
	movl	$0, -28(%rbp)
	jmp	.L559
.L589:
	movq	-40(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L560
	movq	%rax, %rdi
	call	__asan_report_load8
.L560:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	240(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L561
	movq	%rdx, %rdi
	call	__asan_report_load8
.L561:
	movq	240(%rax), %rcx
	movq	throttles(%rip), %rsi
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rsi,%rax), %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L562
	movq	%rax, %rdi
	call	__asan_report_load8
.L562:
	movq	(%rdx), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	match
	testl	%eax, %eax
	je	.L563
	movq	throttles(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	24(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L564
	movq	%rdx, %rdi
	call	__asan_report_load8
.L564:
	movq	24(%rax), %rsi
	movq	throttles(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	8(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L565
	movq	%rdx, %rdi
	call	__asan_report_load8
.L565:
	movq	8(%rax), %rax
	addq	%rax, %rax
	cmpq	%rax, %rsi
	jle	.L566
	movl	$0, %eax
	jmp	.L567
.L566:
	movq	throttles(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	24(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L568
	movq	%rdx, %rdi
	call	__asan_report_load8
.L568:
	movq	24(%rax), %rsi
	movq	throttles(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	16(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L569
	movq	%rdx, %rdi
	call	__asan_report_load8
.L569:
	movq	16(%rax), %rax
	cmpq	%rax, %rsi
	jge	.L570
	movl	$0, %eax
	jmp	.L567
.L570:
	movq	throttles(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	leaq	40(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L571
	movq	%rax, %rdi
	call	__asan_report_load4
.L571:
	movl	40(%rdx), %eax
	testl	%eax, %eax
	jns	.L572
	movl	$.LC132, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
	movq	throttles(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	leaq	40(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L573
	movq	%rax, %rdi
	call	__asan_report_store4
.L573:
	movl	$0, 40(%rdx)
.L572:
	movq	-40(%rbp), %rax
	addq	$56, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L574
	movq	%rax, %rdi
	call	__asan_report_load4
.L574:
	movq	-40(%rbp), %rax
	movl	56(%rax), %eax
	leal	1(%rax), %ecx
	movq	-40(%rbp), %rdx
	movl	%ecx, 56(%rdx)
	movslq	%eax, %rdx
	addq	$4, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rdx, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L575
	movq	%rdx, %rdi
	call	__asan_report_store4
.L575:
	movq	-40(%rbp), %rdx
	cltq
	leaq	4(%rax), %rcx
	movl	-28(%rbp), %eax
	movl	%eax, (%rdx,%rcx,4)
	movq	throttles(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	40(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rdx, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L576
	movq	%rdx, %rdi
	call	__asan_report_load4
.L576:
	movl	40(%rax), %edx
	addl	$1, %edx
	movl	%edx, 40(%rax)
	movq	throttles(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	8(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L577
	movq	%rdx, %rdi
	call	__asan_report_load8
.L577:
	movq	8(%rax), %rsi
	movq	throttles(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	leaq	40(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%r8b
	movq	%rax, %rdi
	andl	$7, %edi
	addl	$3, %edi
	cmpb	%cl, %dil
	setge	%cl
	andl	%r8d, %ecx
	testb	%cl, %cl
	je	.L578
	movq	%rax, %rdi
	call	__asan_report_load4
.L578:
	movl	40(%rdx), %eax
	movslq	%eax, %rbx
	movq	%rsi, %rax
	cqto
	idivq	%rbx
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L579
	movq	%rax, %rdi
	call	__asan_report_load8
.L579:
	movq	-40(%rbp), %rax
	movq	64(%rax), %rax
	cmpq	$-1, %rax
	jne	.L580
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 64(%rax)
	jmp	.L581
.L580:
	movq	-40(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L582
	movq	%rax, %rdi
	call	__asan_report_load8
.L582:
	movq	-40(%rbp), %rax
	movq	64(%rax), %rdx
	movq	-24(%rbp), %rax
	cmpq	%rax, %rdx
	cmovg	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 64(%rax)
.L581:
	movq	throttles(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	16(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L583
	movq	%rdx, %rdi
	call	__asan_report_load8
.L583:
	movq	16(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	addq	$72, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L584
	movq	%rax, %rdi
	call	__asan_report_load8
.L584:
	movq	-40(%rbp), %rax
	movq	72(%rax), %rax
	cmpq	$-1, %rax
	jne	.L585
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 72(%rax)
	jmp	.L563
.L585:
	movq	-40(%rbp), %rax
	addq	$72, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L586
	movq	%rax, %rdi
	call	__asan_report_load8
.L586:
	movq	-40(%rbp), %rax
	movq	72(%rax), %rdx
	movq	-24(%rbp), %rax
	cmpq	%rax, %rdx
	cmovl	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 72(%rax)
.L563:
	addl	$1, -28(%rbp)
.L559:
	movl	numthrottles(%rip), %eax
	cmpl	%eax, -28(%rbp)
	jge	.L587
	movq	-40(%rbp), %rax
	addq	$56, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L588
	movq	%rax, %rdi
	call	__asan_report_load4
.L588:
	movq	-40(%rbp), %rax
	movl	56(%rax), %eax
	cmpl	$9, %eax
	jle	.L589
.L587:
	movl	$1, %eax
.L567:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	check_throttles, .-check_throttles
	.type	clear_throttles, @function
clear_throttles:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L591
.L595:
	movq	throttles(%rip), %rcx
	movl	-4(%rbp), %eax
	cltq
	addq	$4, %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%dl, %sil
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L592
	movq	%rax, %rdi
	call	__asan_report_load4
.L592:
	movq	-24(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	$4, %rdx
	movl	(%rax,%rdx,4), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	40(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rdx, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L593
	movq	%rdx, %rdi
	call	__asan_report_load4
.L593:
	movl	40(%rax), %edx
	subl	$1, %edx
	movl	%edx, 40(%rax)
	addl	$1, -4(%rbp)
.L591:
	movq	-24(%rbp), %rax
	addq	$56, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L594
	movq	%rax, %rdi
	call	__asan_report_load4
.L594:
	movq	-24(%rbp), %rax
	movl	56(%rax), %eax
	cmpl	-4(%rbp), %eax
	jg	.L595
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	clear_throttles, .-clear_throttles
	.section	.rodata
	.align 32
.LC133:
	.string	"throttle #%d '%.80s' rate %ld greatly exceeding limit %ld; %d sending"
	.zero	58
	.align 32
.LC134:
	.string	"throttle #%d '%.80s' rate %ld exceeding limit %ld; %d sending"
	.zero	34
	.align 32
.LC135:
	.string	"throttle #%d '%.80s' rate %ld lower than minimum %ld; %d sending"
	.zero	63
	.text
	.type	update_throttles, @function
update_throttles:
.LFB25:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -64(%rbp)
	movq	%rsi, -56(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L597
.L625:
	movq	throttles(%rip), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rax, %rcx
	movq	throttles(%rip), %rsi
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	leaq	24(%rax), %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L598
	movq	%rdx, %rdi
	call	__asan_report_load8
.L598:
	movq	24(%rax), %rax
	leaq	(%rax,%rax), %rdi
	movq	throttles(%rip), %rsi
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	leaq	32(%rax), %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L599
	movq	%rdx, %rdi
	call	__asan_report_load8
.L599:
	movq	32(%rax), %rax
	movq	%rax, %rdx
	shrq	$63, %rdx
	addq	%rdx, %rax
	sarq	%rax
	leaq	(%rdi,%rax), %rsi
	movabsq	$6148914691236517206, %rdx
	movq	%rsi, %rax
	imulq	%rdx
	movq	%rsi, %rax
	sarq	$63, %rax
	movq	%rdx, %rsi
	subq	%rax, %rsi
	leaq	24(%rcx), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L600
	movq	%rax, %rdi
	call	__asan_report_store8
.L600:
	movq	%rsi, 24(%rcx)
	movq	throttles(%rip), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	32(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L601
	movq	%rdx, %rdi
	call	__asan_report_store8
.L601:
	movq	$0, 32(%rax)
	movq	throttles(%rip), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	24(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L602
	movq	%rdx, %rdi
	call	__asan_report_load8
.L602:
	movq	24(%rax), %rsi
	movq	throttles(%rip), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	8(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L603
	movq	%rdx, %rdi
	call	__asan_report_load8
.L603:
	movq	8(%rax), %rax
	cmpq	%rax, %rsi
	jle	.L604
	movq	throttles(%rip), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	leaq	40(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L605
	movq	%rax, %rdi
	call	__asan_report_load4
.L605:
	movl	40(%rdx), %eax
	testl	%eax, %eax
	je	.L604
	movq	throttles(%rip), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	24(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L606
	movq	%rdx, %rdi
	call	__asan_report_load8
.L606:
	movq	24(%rax), %rsi
	movq	throttles(%rip), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	8(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L607
	movq	%rdx, %rdi
	call	__asan_report_load8
.L607:
	movq	8(%rax), %rax
	addq	%rax, %rax
	cmpq	%rax, %rsi
	jle	.L608
	movq	throttles(%rip), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	leaq	40(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L609
	movq	%rax, %rdi
	call	__asan_report_load4
.L609:
	movl	40(%rdx), %ecx
	movq	throttles(%rip), %rsi
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	leaq	8(%rax), %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L610
	movq	%rdx, %rdi
	call	__asan_report_load8
.L610:
	movq	8(%rax), %r8
	movq	throttles(%rip), %rsi
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	leaq	24(%rax), %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L611
	movq	%rdx, %rdi
	call	__asan_report_load8
.L611:
	movq	24(%rax), %rdi
	movq	throttles(%rip), %rsi
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rsi,%rax), %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L612
	movq	%rax, %rdi
	call	__asan_report_load8
.L612:
	movq	(%rdx), %rdx
	movl	-44(%rbp), %eax
	movl	%ecx, (%rsp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rdx, %rcx
	movl	%eax, %edx
	movl	$.LC133, %esi
	movl	$5, %edi
	movl	$0, %eax
	call	syslog
	jmp	.L604
.L608:
	movq	throttles(%rip), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	leaq	40(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L613
	movq	%rax, %rdi
	call	__asan_report_load4
.L613:
	movl	40(%rdx), %ecx
	movq	throttles(%rip), %rsi
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	leaq	8(%rax), %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L614
	movq	%rdx, %rdi
	call	__asan_report_load8
.L614:
	movq	8(%rax), %r8
	movq	throttles(%rip), %rsi
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	leaq	24(%rax), %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L615
	movq	%rdx, %rdi
	call	__asan_report_load8
.L615:
	movq	24(%rax), %rdi
	movq	throttles(%rip), %rsi
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rsi,%rax), %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L616
	movq	%rax, %rdi
	call	__asan_report_load8
.L616:
	movq	(%rdx), %rdx
	movl	-44(%rbp), %eax
	movl	%ecx, (%rsp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rdx, %rcx
	movl	%eax, %edx
	movl	$.LC134, %esi
	movl	$6, %edi
	movl	$0, %eax
	call	syslog
.L604:
	movq	throttles(%rip), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	24(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L617
	movq	%rdx, %rdi
	call	__asan_report_load8
.L617:
	movq	24(%rax), %rsi
	movq	throttles(%rip), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	16(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L618
	movq	%rdx, %rdi
	call	__asan_report_load8
.L618:
	movq	16(%rax), %rax
	cmpq	%rax, %rsi
	jge	.L619
	movq	throttles(%rip), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	leaq	40(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L620
	movq	%rax, %rdi
	call	__asan_report_load4
.L620:
	movl	40(%rdx), %eax
	testl	%eax, %eax
	je	.L619
	movq	throttles(%rip), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	leaq	40(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L621
	movq	%rax, %rdi
	call	__asan_report_load4
.L621:
	movl	40(%rdx), %ecx
	movq	throttles(%rip), %rsi
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	leaq	16(%rax), %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L622
	movq	%rdx, %rdi
	call	__asan_report_load8
.L622:
	movq	16(%rax), %r8
	movq	throttles(%rip), %rsi
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	leaq	24(%rax), %rdx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L623
	movq	%rdx, %rdi
	call	__asan_report_load8
.L623:
	movq	24(%rax), %rdi
	movq	throttles(%rip), %rsi
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rsi,%rax), %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	shrq	$3, %rsi
	addq	$2147450880, %rsi
	movzbl	(%rsi), %esi
	testb	%sil, %sil
	je	.L624
	movq	%rax, %rdi
	call	__asan_report_load8
.L624:
	movq	(%rdx), %rdx
	movl	-44(%rbp), %eax
	movl	%ecx, (%rsp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rdx, %rcx
	movl	%eax, %edx
	movl	$.LC135, %esi
	movl	$5, %edi
	movl	$0, %eax
	call	syslog
.L619:
	addl	$1, -44(%rbp)
.L597:
	movl	numthrottles(%rip), %eax
	cmpl	%eax, -44(%rbp)
	jl	.L625
	movl	$0, -36(%rbp)
	jmp	.L626
.L641:
	movq	connects(%rip), %rcx
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L627
	movq	%rax, %rdi
	call	__asan_report_load4
.L627:
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$2, %eax
	je	.L628
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$3, %eax
	jne	.L629
.L628:
	movq	-32(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L630
	movq	%rax, %rdi
	call	__asan_report_store8
.L630:
	movq	-32(%rbp), %rax
	movq	$-1, 64(%rax)
	movl	$0, -40(%rbp)
	jmp	.L631
.L640:
	movl	-40(%rbp), %eax
	cltq
	addq	$4, %rax
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L632
	movq	%rax, %rdi
	call	__asan_report_load4
.L632:
	movq	-32(%rbp), %rax
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	addq	$4, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%eax, -44(%rbp)
	movq	throttles(%rip), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	8(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L633
	movq	%rdx, %rdi
	call	__asan_report_load8
.L633:
	movq	8(%rax), %rsi
	movq	throttles(%rip), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	leaq	40(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%r8b
	movq	%rax, %rdi
	andl	$7, %edi
	addl	$3, %edi
	cmpb	%cl, %dil
	setge	%cl
	andl	%r8d, %ecx
	testb	%cl, %cl
	je	.L634
	movq	%rax, %rdi
	call	__asan_report_load4
.L634:
	movl	40(%rdx), %eax
	movslq	%eax, %rbx
	movq	%rsi, %rax
	cqto
	idivq	%rbx
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L635
	movq	%rax, %rdi
	call	__asan_report_load8
.L635:
	movq	-32(%rbp), %rax
	movq	64(%rax), %rax
	cmpq	$-1, %rax
	jne	.L636
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 64(%rax)
	jmp	.L637
.L636:
	movq	-32(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L638
	movq	%rax, %rdi
	call	__asan_report_load8
.L638:
	movq	-32(%rbp), %rax
	movq	64(%rax), %rdx
	movq	-24(%rbp), %rax
	cmpq	%rax, %rdx
	cmovg	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 64(%rax)
.L637:
	addl	$1, -40(%rbp)
.L631:
	movq	-32(%rbp), %rax
	addq	$56, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L639
	movq	%rax, %rdi
	call	__asan_report_load4
.L639:
	movq	-32(%rbp), %rax
	movl	56(%rax), %eax
	cmpl	-40(%rbp), %eax
	jg	.L640
.L629:
	addl	$1, -36(%rbp)
.L626:
	movl	max_connects(%rip), %eax
	cmpl	%eax, -36(%rbp)
	jl	.L641
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	update_throttles, .-update_throttles
	.type	finish_connection, @function
finish_connection:
.LFB26:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L643
	movq	%rax, %rdi
	call	__asan_report_load8
.L643:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	httpd_write_response
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	clear_connection
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	finish_connection, .-finish_connection
	.section	.rodata
	.align 8
.LC136:
	.string	"clear_connection 1 32 8 11 client_data "
	.align 32
.LC137:
	.string	"replacing non-null linger_timer!"
	.zero	63
	.align 32
.LC138:
	.string	"tmr_create(linger_clear_connection) failed"
	.zero	53
	.text
	.type	clear_connection, @function
clear_connection:
.LFB27:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	leaq	-112(%rbp), %rax
	movq	$1102416563, (%rax)
	movq	$.LC136, 8(%rax)
	shrq	$3, %rax
	leaq	2147450880(%rax), %rbx
	movl	$-235802127, (%rbx)
	movl	$-185273344, 4(%rbx)
	movl	$-202116109, 8(%rbx)
	movq	-120(%rbp), %rax
	addq	$96, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L645
	movq	%rax, %rdi
	call	__asan_report_load8
.L645:
	movq	-120(%rbp), %rax
	movq	96(%rax), %rax
	testq	%rax, %rax
	je	.L646
	movq	-120(%rbp), %rax
	movq	96(%rax), %rax
	movq	%rax, %rdi
	call	tmr_cancel
	movq	-120(%rbp), %rax
	addq	$96, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L647
	movq	%rax, %rdi
	call	__asan_report_store8
.L647:
	movq	-120(%rbp), %rax
	movq	$0, 96(%rax)
.L646:
	movq	-120(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L648
	movq	%rax, %rdi
	call	__asan_report_load4
.L648:
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$4, %eax
	jne	.L649
	movq	-120(%rbp), %rax
	addq	$104, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L650
	movq	%rax, %rdi
	call	__asan_report_load8
.L650:
	movq	-120(%rbp), %rax
	movq	104(%rax), %rax
	movq	%rax, %rdi
	call	tmr_cancel
	movq	-120(%rbp), %rax
	addq	$104, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L651
	movq	%rax, %rdi
	call	__asan_report_store8
.L651:
	movq	-120(%rbp), %rax
	movq	$0, 104(%rax)
	movq	-120(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L652
	movq	%rax, %rdi
	call	__asan_report_load8
.L652:
	movq	-120(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	556(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L653
	movq	%rax, %rdi
	call	__asan_report_store4
.L653:
	movl	$0, 556(%rdx)
.L649:
	movq	-120(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L654
	movq	%rax, %rdi
	call	__asan_report_load8
.L654:
	movq	-120(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	556(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L655
	movq	%rax, %rdi
	call	__asan_report_load4
.L655:
	movl	556(%rdx), %eax
	testl	%eax, %eax
	je	.L656
	movq	-120(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L657
	movq	%rax, %rdi
	call	__asan_report_load4
.L657:
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$3, %eax
	je	.L658
	movq	-120(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	704(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L659
	movq	%rax, %rdi
	call	__asan_report_load4
.L659:
	movl	704(%rdx), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
.L658:
	movq	-120(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L660
	movq	%rax, %rdi
	call	__asan_report_store4
.L660:
	movq	-120(%rbp), %rax
	movl	$4, (%rax)
	movq	-120(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L661
	movq	%rax, %rdi
	call	__asan_report_load8
.L661:
	movq	-120(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	704(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L662
	movq	%rax, %rdi
	call	__asan_report_load4
.L662:
	movl	704(%rdx), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	shutdown
	movq	-120(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L663
	movq	%rax, %rdi
	call	__asan_report_load8
.L663:
	movq	-120(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	704(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L664
	movq	%rax, %rdi
	call	__asan_report_load4
.L664:
	movl	704(%rdx), %eax
	movq	-120(%rbp), %rcx
	movl	$0, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	fdwatch_add_fd
	leaq	-80(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L665
	movq	%rax, %rdi
	call	__asan_report_store8
.L665:
	movq	-120(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-120(%rbp), %rax
	addq	$104, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L666
	movq	%rax, %rdi
	call	__asan_report_load8
.L666:
	movq	-120(%rbp), %rax
	movq	104(%rax), %rax
	testq	%rax, %rax
	je	.L667
	movl	$.LC137, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
.L667:
	movq	-80(%rbp), %rdx
	movq	-128(%rbp), %rax
	movl	$0, %r8d
	movl	$500, %ecx
	movl	$linger_clear_connection, %esi
	movq	%rax, %rdi
	call	tmr_create
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	addq	$104, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L668
	movq	%rax, %rdi
	call	__asan_report_store8
.L668:
	movq	-120(%rbp), %rax
	movq	%rdx, 104(%rax)
	movq	-120(%rbp), %rax
	movq	104(%rax), %rax
	testq	%rax, %rax
	jne	.L644
	movl	$.LC138, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	call	__asan_handle_no_return
	movl	$1, %edi
	call	exit
.L656:
	movq	-128(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	really_clear_connection
.L644:
	movq	$0, (%rbx)
	movl	$0, 8(%rbx)
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	clear_connection, .-clear_connection
	.type	really_clear_connection, @function
really_clear_connection:
.LFB28:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L671
	movq	%rax, %rdi
	call	__asan_report_load8
.L671:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	leaq	200(%rax), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L672
	movq	%rdx, %rdi
	call	__asan_report_load8
.L672:
	movq	200(%rax), %rdx
	movq	stats_bytes(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, stats_bytes(%rip)
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L673
	movq	%rax, %rdi
	call	__asan_report_load4
.L673:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$3, %eax
	je	.L674
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	704(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L675
	movq	%rax, %rdi
	call	__asan_report_load4
.L675:
	movl	704(%rdx), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
.L674:
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L676
	movq	%rax, %rdi
	call	__asan_report_load8
.L676:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	httpd_close_conn
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	clear_throttles
	movq	-8(%rbp), %rax
	addq	$104, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L677
	movq	%rax, %rdi
	call	__asan_report_load8
.L677:
	movq	-8(%rbp), %rax
	movq	104(%rax), %rax
	testq	%rax, %rax
	je	.L678
	movq	-8(%rbp), %rax
	movq	104(%rax), %rax
	movq	%rax, %rdi
	call	tmr_cancel
	movq	-8(%rbp), %rax
	addq	$104, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L679
	movq	%rax, %rdi
	call	__asan_report_store8
.L679:
	movq	-8(%rbp), %rax
	movq	$0, 104(%rax)
.L678:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L680
	movq	%rax, %rdi
	call	__asan_report_store4
.L680:
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	movl	first_free_connect(%rip), %ecx
	movq	-8(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%dl, %sil
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L681
	movq	%rax, %rdi
	call	__asan_report_store4
.L681:
	movq	-8(%rbp), %rax
	movl	%ecx, 4(%rax)
	movq	-8(%rbp), %rdx
	movq	connects(%rip), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	sarq	$4, %rax
	movq	%rax, %rdx
	movabsq	$-8198552921648689607, %rax
	imulq	%rdx, %rax
	movl	%eax, first_free_connect(%rip)
	movl	num_connects(%rip), %eax
	subl	$1, %eax
	movl	%eax, num_connects(%rip)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	really_clear_connection, .-really_clear_connection
	.section	.rodata
	.align 32
.LC139:
	.string	"%.80s connection timed out reading"
	.zero	61
	.align 32
.LC140:
	.string	"%.80s connection timed out sending"
	.zero	61
	.text
	.type	idle, @function
idle:
.LFB29:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -32(%rbp)
	movq	%rsi, -24(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L683
.L697:
	movq	connects(%rip), %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L684
	movq	%rax, %rdi
	call	__asan_report_load4
.L684:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	.L686
	cmpl	$1, %eax
	jl	.L685
	cmpl	$3, %eax
	jg	.L685
	jmp	.L698
.L686:
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L688
	movq	%rax, %rdi
	call	__asan_report_load8
.L688:
	movq	-24(%rbp), %rax
	movq	(%rax), %rcx
	movq	-8(%rbp), %rax
	addq	$88, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L689
	movq	%rax, %rdi
	call	__asan_report_load8
.L689:
	movq	-8(%rbp), %rax
	movq	88(%rax), %rax
	subq	%rax, %rcx
	movq	%rcx, %rax
	cmpq	$59, %rax
	jle	.L690
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L691
	movq	%rax, %rdi
	call	__asan_report_load8
.L691:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	httpd_ntoa
	movq	%rax, %rdx
	movl	$.LC139, %esi
	movl	$6, %edi
	movl	$0, %eax
	call	syslog
	movq	httpd_err408form(%rip), %rsi
	movq	httpd_err408title(%rip), %rdx
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	je	.L692
	movq	%rax, %rdi
	call	__asan_report_load8
.L692:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	$.LC48, %r9d
	movq	%rsi, %r8
	movl	$.LC48, %ecx
	movl	$408, %esi
	movq	%rax, %rdi
	call	httpd_send_err
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L685
.L690:
	jmp	.L685
.L698:
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L693
	movq	%rax, %rdi
	call	__asan_report_load8
.L693:
	movq	-24(%rbp), %rax
	movq	(%rax), %rcx
	movq	-8(%rbp), %rax
	addq	$88, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L694
	movq	%rax, %rdi
	call	__asan_report_load8
.L694:
	movq	-8(%rbp), %rax
	movq	88(%rax), %rax
	subq	%rax, %rcx
	movq	%rcx, %rax
	cmpq	$299, %rax
	jle	.L695
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L696
	movq	%rax, %rdi
	call	__asan_report_load8
.L696:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	httpd_ntoa
	movq	%rax, %rdx
	movl	$.LC140, %esi
	movl	$6, %edi
	movl	$0, %eax
	call	syslog
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	clear_connection
	jmp	.L699
.L695:
.L699:
	nop
.L685:
	addl	$1, -12(%rbp)
.L683:
	movl	max_connects(%rip), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L697
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	idle, .-idle
	.type	wakeup_connection, @function
wakeup_connection:
.LFB30:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -32(%rbp)
	movq	%rsi, -24(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L701
	movq	%rax, %rdi
	call	__asan_report_load8
.L701:
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$96, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L702
	movq	%rax, %rdi
	call	__asan_report_store8
.L702:
	movq	-8(%rbp), %rax
	movq	$0, 96(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	setne	%sil
	movq	%rax, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L703
	movq	%rax, %rdi
	call	__asan_report_load4
.L703:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$3, %eax
	jne	.L700
	movq	-8(%rbp), %rax
	movl	$2, (%rax)
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L705
	movq	%rax, %rdi
	call	__asan_report_load8
.L705:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	leaq	704(%rdx), %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	addq	$2147450880, %rcx
	movzbl	(%rcx), %ecx
	testb	%cl, %cl
	setne	%dil
	movq	%rax, %rsi
	andl	$7, %esi
	addl	$3, %esi
	cmpb	%cl, %sil
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L706
	movq	%rax, %rdi
	call	__asan_report_load4
.L706:
	movl	704(%rdx), %eax
	movq	-8(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	fdwatch_add_fd
.L700:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	wakeup_connection, .-wakeup_connection
	.type	linger_clear_connection, @function
linger_clear_connection:
.LFB31:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -32(%rbp)
	movq	%rsi, -24(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L708
	movq	%rax, %rdi
	call	__asan_report_load8
.L708:
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$104, %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L709
	movq	%rax, %rdi
	call	__asan_report_store8
.L709:
	movq	-8(%rbp), %rax
	movq	$0, 104(%rax)
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	really_clear_connection
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	linger_clear_connection, .-linger_clear_connection
	.type	occasional, @function
occasional:
.LFB32:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	mmc_cleanup
	call	tmr_cleanup
	movl	$1, watchdog_flag(%rip)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	occasional, .-occasional
	.type	show_stats, @function
show_stats:
.LFB33:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	logstats
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	show_stats, .-show_stats
	.section	.rodata
.LC141:
	.string	"logstats 1 32 16 2 tv "
	.align 32
.LC142:
	.string	"up %ld seconds, stats for %ld seconds:"
	.zero	57
	.text
	.type	logstats, @function
logstats:
.LFB34:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$152, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -152(%rbp)
	leaq	-112(%rbp), %rax
	movq	$1102416563, (%rax)
	movq	$.LC141, 8(%rax)
	shrq	$3, %rax
	leaq	2147450880(%rax), %rbx
	movl	$-235802127, (%rbx)
	movl	$-185335808, 4(%rbx)
	movl	$-202116109, 8(%rbx)
	cmpq	$0, -152(%rbp)
	jne	.L713
	leaq	-80(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	leaq	-80(%rbp), %rax
	movq	%rax, -152(%rbp)
.L713:
	movq	-152(%rbp), %rax
	movq	%rax, %rdx
	shrq	$3, %rdx
	addq	$2147450880, %rdx
	movzbl	(%rdx), %edx
	testb	%dl, %dl
	je	.L714
	movq	%rax, %rdi
	call	__asan_report_load8
.L714:
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -128(%rbp)
	movq	start_time(%rip), %rax
	movq	-128(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -120(%rbp)
	movq	stats_time(%rip), %rax
	movq	-128(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -136(%rbp)
	cmpq	$0, -136(%rbp)
	jne	.L715
	movq	$1, -136(%rbp)
.L715:
	movq	-128(%rbp), %rax
	movq	%rax, stats_time(%rip)
	movq	-136(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$.LC142, %esi
	movl	$6, %edi
	movl	$0, %eax
	call	syslog
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	thttpd_logstats
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	httpd_logstats
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	mmc_logstats
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	fdwatch_logstats
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_logstats
	movq	$0, (%rbx)
	movl	$0, 8(%rbx)
	addq	$152, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	logstats, .-logstats
	.section	.rodata
	.align 32
.LC143:
	.string	"  thttpd - %ld connections (%g/sec), %d max simultaneous, %lld bytes (%g/sec), %d httpd_conns allocated"
	.zero	56
	.text
	.type	thttpd_logstats, @function
thttpd_logstats:
.LFB35:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jle	.L717
	movl	httpd_conn_count(%rip), %esi
	movq	stats_bytes(%rip), %rax
	cvtsi2ssq	%rax, %xmm0
	cvtsi2ssq	-8(%rbp), %xmm1
	divss	%xmm1, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm1
	movq	stats_bytes(%rip), %rcx
	movl	stats_simultaneous(%rip), %edx
	movq	stats_connections(%rip), %rax
	cvtsi2ssq	%rax, %xmm0
	cvtsi2ssq	-8(%rbp), %xmm2
	divss	%xmm2, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movq	stats_connections(%rip), %rax
	movl	%esi, %r9d
	movq	%rcx, %r8
	movl	%edx, %ecx
	movq	%rax, %rdx
	movl	$.LC143, %esi
	movl	$6, %edi
	movl	$2, %eax
	call	syslog
.L717:
	movq	$0, stats_connections(%rip)
	movq	$0, stats_bytes(%rip)
	movl	$0, stats_simultaneous(%rip)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	thttpd_logstats, .-thttpd_logstats
	.section	.rodata
.LC144:
	.string	"watchdog_flag (thttpd.c)"
.LC145:
	.string	"got_usr1 (thttpd.c)"
.LC146:
	.string	"got_hup (thttpd.c)"
.LC147:
	.string	"terminate (thttpd.c)"
.LC148:
	.string	"hs (thttpd.c)"
.LC149:
	.string	"httpd_conn_count (thttpd.c)"
.LC150:
	.string	"first_free_connect (thttpd.c)"
.LC151:
	.string	"max_connects (thttpd.c)"
.LC152:
	.string	"num_connects (thttpd.c)"
.LC153:
	.string	"connects (thttpd.c)"
.LC154:
	.string	"maxthrottles (thttpd.c)"
.LC155:
	.string	"numthrottles (thttpd.c)"
.LC156:
	.string	"throttles (thttpd.c)"
.LC157:
	.string	"max_age (thttpd.c)"
.LC158:
	.string	"p3p (thttpd.c)"
.LC159:
	.string	"charset (thttpd.c)"
.LC160:
	.string	"user (thttpd.c)"
.LC161:
	.string	"pidfile (thttpd.c)"
.LC162:
	.string	"hostname (thttpd.c)"
.LC163:
	.string	"throttlefile (thttpd.c)"
.LC164:
	.string	"logfile (thttpd.c)"
.LC165:
	.string	"local_pattern (thttpd.c)"
.LC166:
	.string	"no_empty_referers (thttpd.c)"
.LC167:
	.string	"url_pattern (thttpd.c)"
.LC168:
	.string	"cgi_limit (thttpd.c)"
.LC169:
	.string	"cgi_pattern (thttpd.c)"
.LC170:
	.string	"do_global_passwd (thttpd.c)"
.LC171:
	.string	"do_vhost (thttpd.c)"
.LC172:
	.string	"no_symlink_check (thttpd.c)"
.LC173:
	.string	"no_log (thttpd.c)"
.LC174:
	.string	"do_chroot (thttpd.c)"
.LC175:
	.string	"data_dir (thttpd.c)"
.LC176:
	.string	"dir (thttpd.c)"
.LC177:
	.string	"port (thttpd.c)"
.LC178:
	.string	"debug (thttpd.c)"
.LC179:
	.string	"argv0 (thttpd.c)"
.LC180:
	.string	"*.LC140 (thttpd.c)"
.LC181:
	.string	"*.LC20 (thttpd.c)"
.LC182:
	.string	"*.LC97 (thttpd.c)"
.LC183:
	.string	"*.LC6 (thttpd.c)"
.LC184:
	.string	"*.LC41 (thttpd.c)"
.LC185:
	.string	"*.LC118 (thttpd.c)"
.LC186:
	.string	"*.LC119 (thttpd.c)"
.LC187:
	.string	"*.LC107 (thttpd.c)"
.LC188:
	.string	"*.LC133 (thttpd.c)"
.LC189:
	.string	"*.LC33 (thttpd.c)"
.LC190:
	.string	"*.LC36 (thttpd.c)"
.LC191:
	.string	"*.LC69 (thttpd.c)"
.LC192:
	.string	"*.LC93 (thttpd.c)"
.LC193:
	.string	"*.LC60 (thttpd.c)"
.LC194:
	.string	"*.LC115 (thttpd.c)"
.LC195:
	.string	"*.LC10 (thttpd.c)"
.LC196:
	.string	"*.LC5 (thttpd.c)"
.LC197:
	.string	"*.LC54 (thttpd.c)"
.LC198:
	.string	"*.LC27 (thttpd.c)"
.LC199:
	.string	"*.LC34 (thttpd.c)"
.LC200:
	.string	"*.LC94 (thttpd.c)"
.LC201:
	.string	"*.LC28 (thttpd.c)"
.LC202:
	.string	"*.LC90 (thttpd.c)"
.LC203:
	.string	"*.LC40 (thttpd.c)"
.LC204:
	.string	"*.LC55 (thttpd.c)"
.LC205:
	.string	"*.LC103 (thttpd.c)"
.LC206:
	.string	"*.LC110 (thttpd.c)"
.LC207:
	.string	"*.LC87 (thttpd.c)"
.LC208:
	.string	"*.LC73 (thttpd.c)"
.LC209:
	.string	"*.LC135 (thttpd.c)"
.LC210:
	.string	"*.LC62 (thttpd.c)"
.LC211:
	.string	"*.LC112 (thttpd.c)"
.LC212:
	.string	"*.LC114 (thttpd.c)"
.LC213:
	.string	"*.LC116 (thttpd.c)"
.LC214:
	.string	"*.LC19 (thttpd.c)"
.LC215:
	.string	"*.LC89 (thttpd.c)"
.LC216:
	.string	"*.LC98 (thttpd.c)"
.LC217:
	.string	"*.LC49 (thttpd.c)"
.LC218:
	.string	"*.LC56 (thttpd.c)"
.LC219:
	.string	"*.LC99 (thttpd.c)"
.LC220:
	.string	"*.LC22 (thttpd.c)"
.LC221:
	.string	"*.LC61 (thttpd.c)"
.LC222:
	.string	"*.LC88 (thttpd.c)"
.LC223:
	.string	"*.LC21 (thttpd.c)"
.LC224:
	.string	"*.LC7 (thttpd.c)"
.LC225:
	.string	"*.LC42 (thttpd.c)"
.LC226:
	.string	"*.LC25 (thttpd.c)"
.LC227:
	.string	"*.LC2 (thttpd.c)"
.LC228:
	.string	"*.LC39 (thttpd.c)"
.LC229:
	.string	"*.LC47 (thttpd.c)"
.LC230:
	.string	"*.LC109 (thttpd.c)"
.LC231:
	.string	"*.LC32 (thttpd.c)"
.LC232:
	.string	"*.LC101 (thttpd.c)"
.LC233:
	.string	"*.LC129 (thttpd.c)"
.LC234:
	.string	"*.LC13 (thttpd.c)"
.LC235:
	.string	"*.LC83 (thttpd.c)"
.LC236:
	.string	"*.LC31 (thttpd.c)"
.LC237:
	.string	"*.LC12 (thttpd.c)"
.LC238:
	.string	"*.LC45 (thttpd.c)"
.LC239:
	.string	"*.LC79 (thttpd.c)"
.LC240:
	.string	"*.LC50 (thttpd.c)"
.LC241:
	.string	"*.LC72 (thttpd.c)"
.LC242:
	.string	"*.LC125 (thttpd.c)"
.LC243:
	.string	"*.LC66 (thttpd.c)"
.LC244:
	.string	"*.LC63 (thttpd.c)"
.LC245:
	.string	"*.LC64 (thttpd.c)"
.LC246:
	.string	"*.LC17 (thttpd.c)"
.LC247:
	.string	"*.LC75 (thttpd.c)"
.LC248:
	.string	"*.LC24 (thttpd.c)"
.LC249:
	.string	"*.LC23 (thttpd.c)"
.LC250:
	.string	"*.LC143 (thttpd.c)"
.LC251:
	.string	"*.LC117 (thttpd.c)"
.LC252:
	.string	"*.LC26 (thttpd.c)"
.LC253:
	.string	"*.LC105 (thttpd.c)"
.LC254:
	.string	"*.LC29 (thttpd.c)"
.LC255:
	.string	"*.LC76 (thttpd.c)"
.LC256:
	.string	"*.LC67 (thttpd.c)"
.LC257:
	.string	"*.LC80 (thttpd.c)"
.LC258:
	.string	"*.LC100 (thttpd.c)"
.LC259:
	.string	"*.LC65 (thttpd.c)"
.LC260:
	.string	"*.LC84 (thttpd.c)"
.LC261:
	.string	"*.LC8 (thttpd.c)"
.LC262:
	.string	"*.LC91 (thttpd.c)"
.LC263:
	.string	"*.LC48 (thttpd.c)"
.LC264:
	.string	"*.LC30 (thttpd.c)"
.LC265:
	.string	"*.LC111 (thttpd.c)"
.LC266:
	.string	"*.LC130 (thttpd.c)"
.LC267:
	.string	"*.LC43 (thttpd.c)"
.LC268:
	.string	"*.LC139 (thttpd.c)"
.LC269:
	.string	"*.LC15 (thttpd.c)"
.LC270:
	.string	"*.LC142 (thttpd.c)"
.LC271:
	.string	"*.LC78 (thttpd.c)"
.LC272:
	.string	"*.LC70 (thttpd.c)"
.LC273:
	.string	"*.LC120 (thttpd.c)"
.LC274:
	.string	"*.LC53 (thttpd.c)"
.LC275:
	.string	"*.LC68 (thttpd.c)"
.LC276:
	.string	"*.LC57 (thttpd.c)"
.LC277:
	.string	"*.LC138 (thttpd.c)"
.LC278:
	.string	"*.LC132 (thttpd.c)"
.LC279:
	.string	"*.LC44 (thttpd.c)"
.LC280:
	.string	"*.LC134 (thttpd.c)"
.LC281:
	.string	"*.LC137 (thttpd.c)"
.LC282:
	.string	"*.LC104 (thttpd.c)"
.LC283:
	.string	"*.LC38 (thttpd.c)"
.LC284:
	.string	"*.LC37 (thttpd.c)"
.LC285:
	.string	"*.LC128 (thttpd.c)"
.LC286:
	.string	"*.LC3 (thttpd.c)"
.LC287:
	.string	"*.LC81 (thttpd.c)"
.LC288:
	.string	"*.LC58 (thttpd.c)"
.LC289:
	.string	"*.LC4 (thttpd.c)"
.LC290:
	.string	"*.LC18 (thttpd.c)"
.LC291:
	.string	"*.LC14 (thttpd.c)"
.LC292:
	.string	"*.LC123 (thttpd.c)"
.LC293:
	.string	"*.LC92 (thttpd.c)"
.LC294:
	.string	"*.LC35 (thttpd.c)"
.LC295:
	.string	"*.LC102 (thttpd.c)"
.LC296:
	.string	"*.LC85 (thttpd.c)"
.LC297:
	.string	"*.LC124 (thttpd.c)"
.LC298:
	.string	"*.LC0 (thttpd.c)"
.LC299:
	.string	"*.LC51 (thttpd.c)"
.LC300:
	.string	"*.LC71 (thttpd.c)"
.LC301:
	.string	"*.LC96 (thttpd.c)"
.LC302:
	.string	"*.LC52 (thttpd.c)"
.LC303:
	.string	"*.LC59 (thttpd.c)"
.LC304:
	.string	"*.LC95 (thttpd.c)"
.LC305:
	.string	"*.LC86 (thttpd.c)"
.LC306:
	.string	"*.LC106 (thttpd.c)"
.LC307:
	.string	"*.LC46 (thttpd.c)"
.LC308:
	.string	"*.LC11 (thttpd.c)"
.LC309:
	.string	"*.LC82 (thttpd.c)"
.LC310:
	.string	"*.LC16 (thttpd.c)"
.LC311:
	.string	"*.LC77 (thttpd.c)"
	.data
	.align 32
	.type	.LASAN0, @object
	.size	.LASAN0, 6720
.LASAN0:
	.quad	watchdog_flag
	.quad	4
	.quad	64
	.quad	.LC144
	.quad	0
	.quad	got_usr1
	.quad	4
	.quad	64
	.quad	.LC145
	.quad	0
	.quad	got_hup
	.quad	4
	.quad	64
	.quad	.LC146
	.quad	0
	.quad	terminate
	.quad	4
	.quad	64
	.quad	.LC147
	.quad	0
	.quad	hs
	.quad	8
	.quad	64
	.quad	.LC148
	.quad	0
	.quad	httpd_conn_count
	.quad	4
	.quad	64
	.quad	.LC149
	.quad	0
	.quad	first_free_connect
	.quad	4
	.quad	64
	.quad	.LC150
	.quad	0
	.quad	max_connects
	.quad	4
	.quad	64
	.quad	.LC151
	.quad	0
	.quad	num_connects
	.quad	4
	.quad	64
	.quad	.LC152
	.quad	0
	.quad	connects
	.quad	8
	.quad	64
	.quad	.LC153
	.quad	0
	.quad	maxthrottles
	.quad	4
	.quad	64
	.quad	.LC154
	.quad	0
	.quad	numthrottles
	.quad	4
	.quad	64
	.quad	.LC155
	.quad	0
	.quad	throttles
	.quad	8
	.quad	64
	.quad	.LC156
	.quad	0
	.quad	max_age
	.quad	4
	.quad	64
	.quad	.LC157
	.quad	0
	.quad	p3p
	.quad	8
	.quad	64
	.quad	.LC158
	.quad	0
	.quad	charset
	.quad	8
	.quad	64
	.quad	.LC159
	.quad	0
	.quad	user
	.quad	8
	.quad	64
	.quad	.LC160
	.quad	0
	.quad	pidfile
	.quad	8
	.quad	64
	.quad	.LC161
	.quad	0
	.quad	hostname
	.quad	8
	.quad	64
	.quad	.LC162
	.quad	0
	.quad	throttlefile
	.quad	8
	.quad	64
	.quad	.LC163
	.quad	0
	.quad	logfile
	.quad	8
	.quad	64
	.quad	.LC164
	.quad	0
	.quad	local_pattern
	.quad	8
	.quad	64
	.quad	.LC165
	.quad	0
	.quad	no_empty_referers
	.quad	4
	.quad	64
	.quad	.LC166
	.quad	0
	.quad	url_pattern
	.quad	8
	.quad	64
	.quad	.LC167
	.quad	0
	.quad	cgi_limit
	.quad	4
	.quad	64
	.quad	.LC168
	.quad	0
	.quad	cgi_pattern
	.quad	8
	.quad	64
	.quad	.LC169
	.quad	0
	.quad	do_global_passwd
	.quad	4
	.quad	64
	.quad	.LC170
	.quad	0
	.quad	do_vhost
	.quad	4
	.quad	64
	.quad	.LC171
	.quad	0
	.quad	no_symlink_check
	.quad	4
	.quad	64
	.quad	.LC172
	.quad	0
	.quad	no_log
	.quad	4
	.quad	64
	.quad	.LC173
	.quad	0
	.quad	do_chroot
	.quad	4
	.quad	64
	.quad	.LC174
	.quad	0
	.quad	data_dir
	.quad	8
	.quad	64
	.quad	.LC175
	.quad	0
	.quad	dir
	.quad	8
	.quad	64
	.quad	.LC176
	.quad	0
	.quad	port
	.quad	2
	.quad	64
	.quad	.LC177
	.quad	0
	.quad	debug
	.quad	4
	.quad	64
	.quad	.LC178
	.quad	0
	.quad	argv0
	.quad	8
	.quad	64
	.quad	.LC179
	.quad	0
	.quad	.LC140
	.quad	35
	.quad	96
	.quad	.LC180
	.quad	0
	.quad	.LC20
	.quad	11
	.quad	64
	.quad	.LC181
	.quad	0
	.quad	.LC97
	.quad	13
	.quad	64
	.quad	.LC182
	.quad	0
	.quad	.LC6
	.quad	19
	.quad	64
	.quad	.LC183
	.quad	0
	.quad	.LC41
	.quad	16
	.quad	64
	.quad	.LC184
	.quad	0
	.quad	.LC118
	.quad	3
	.quad	64
	.quad	.LC185
	.quad	0
	.quad	.LC119
	.quad	39
	.quad	96
	.quad	.LC186
	.quad	0
	.quad	.LC107
	.quad	36
	.quad	96
	.quad	.LC187
	.quad	0
	.quad	.LC133
	.quad	70
	.quad	128
	.quad	.LC188
	.quad	0
	.quad	.LC33
	.quad	20
	.quad	64
	.quad	.LC189
	.quad	0
	.quad	.LC36
	.quad	24
	.quad	64
	.quad	.LC190
	.quad	0
	.quad	.LC69
	.quad	3
	.quad	64
	.quad	.LC191
	.quad	0
	.quad	.LC93
	.quad	5
	.quad	64
	.quad	.LC192
	.quad	0
	.quad	.LC60
	.quad	3
	.quad	64
	.quad	.LC193
	.quad	0
	.quad	.LC115
	.quad	16
	.quad	64
	.quad	.LC194
	.quad	0
	.quad	.LC10
	.quad	29
	.quad	64
	.quad	.LC195
	.quad	0
	.quad	.LC5
	.quad	2
	.quad	64
	.quad	.LC196
	.quad	0
	.quad	.LC54
	.quad	3
	.quad	64
	.quad	.LC197
	.quad	0
	.quad	.LC27
	.quad	12
	.quad	64
	.quad	.LC198
	.quad	0
	.quad	.LC34
	.quad	15
	.quad	64
	.quad	.LC199
	.quad	0
	.quad	.LC94
	.quad	8
	.quad	64
	.quad	.LC200
	.quad	0
	.quad	.LC28
	.quad	7
	.quad	64
	.quad	.LC201
	.quad	0
	.quad	.LC90
	.quad	16
	.quad	64
	.quad	.LC202
	.quad	0
	.quad	.LC40
	.quad	12
	.quad	64
	.quad	.LC203
	.quad	0
	.quad	.LC55
	.quad	5
	.quad	64
	.quad	.LC204
	.quad	0
	.quad	.LC103
	.quad	32
	.quad	64
	.quad	.LC205
	.quad	0
	.quad	.LC110
	.quad	26
	.quad	64
	.quad	.LC206
	.quad	0
	.quad	.LC87
	.quad	7
	.quad	64
	.quad	.LC207
	.quad	0
	.quad	.LC73
	.quad	219
	.quad	256
	.quad	.LC208
	.quad	0
	.quad	.LC135
	.quad	65
	.quad	128
	.quad	.LC209
	.quad	0
	.quad	.LC62
	.quad	3
	.quad	64
	.quad	.LC210
	.quad	0
	.quad	.LC112
	.quad	39
	.quad	96
	.quad	.LC211
	.quad	0
	.quad	.LC114
	.quad	20
	.quad	64
	.quad	.LC212
	.quad	0
	.quad	.LC116
	.quad	33
	.quad	96
	.quad	.LC213
	.quad	0
	.quad	.LC19
	.quad	15
	.quad	64
	.quad	.LC214
	.quad	0
	.quad	.LC89
	.quad	7
	.quad	64
	.quad	.LC215
	.quad	0
	.quad	.LC98
	.quad	15
	.quad	64
	.quad	.LC216
	.quad	0
	.quad	.LC49
	.quad	3
	.quad	64
	.quad	.LC217
	.quad	0
	.quad	.LC56
	.quad	4
	.quad	64
	.quad	.LC218
	.quad	0
	.quad	.LC99
	.quad	8
	.quad	64
	.quad	.LC219
	.quad	0
	.quad	.LC22
	.quad	2
	.quad	64
	.quad	.LC220
	.quad	0
	.quad	.LC61
	.quad	3
	.quad	64
	.quad	.LC221
	.quad	0
	.quad	.LC88
	.quad	9
	.quad	64
	.quad	.LC222
	.quad	0
	.quad	.LC21
	.quad	6
	.quad	64
	.quad	.LC223
	.quad	0
	.quad	.LC7
	.quad	2
	.quad	64
	.quad	.LC224
	.quad	0
	.quad	.LC42
	.quad	12
	.quad	64
	.quad	.LC225
	.quad	0
	.quad	.LC25
	.quad	4
	.quad	64
	.quad	.LC226
	.quad	0
	.quad	.LC2
	.quad	16
	.quad	64
	.quad	.LC227
	.quad	0
	.quad	.LC39
	.quad	15
	.quad	64
	.quad	.LC228
	.quad	0
	.quad	.LC47
	.quad	11
	.quad	64
	.quad	.LC229
	.quad	0
	.quad	.LC109
	.quad	3
	.quad	64
	.quad	.LC230
	.quad	0
	.quad	.LC32
	.quad	13
	.quad	64
	.quad	.LC231
	.quad	0
	.quad	.LC101
	.quad	4
	.quad	64
	.quad	.LC232
	.quad	0
	.quad	.LC129
	.quad	37
	.quad	96
	.quad	.LC233
	.quad	0
	.quad	.LC13
	.quad	25
	.quad	64
	.quad	.LC234
	.quad	0
	.quad	.LC83
	.quad	10
	.quad	64
	.quad	.LC235
	.quad	0
	.quad	.LC31
	.quad	18
	.quad	64
	.quad	.LC236
	.quad	0
	.quad	.LC12
	.quad	23
	.quad	64
	.quad	.LC237
	.quad	0
	.quad	.LC45
	.quad	13
	.quad	64
	.quad	.LC238
	.quad	0
	.quad	.LC79
	.quad	4
	.quad	64
	.quad	.LC239
	.quad	0
	.quad	.LC50
	.quad	26
	.quad	64
	.quad	.LC240
	.quad	0
	.quad	.LC72
	.quad	3
	.quad	64
	.quad	.LC241
	.quad	0
	.quad	.LC125
	.quad	39
	.quad	96
	.quad	.LC242
	.quad	0
	.quad	.LC66
	.quad	3
	.quad	64
	.quad	.LC243
	.quad	0
	.quad	.LC63
	.quad	3
	.quad	64
	.quad	.LC244
	.quad	0
	.quad	.LC64
	.quad	3
	.quad	64
	.quad	.LC245
	.quad	0
	.quad	.LC17
	.quad	72
	.quad	128
	.quad	.LC246
	.quad	0
	.quad	.LC75
	.quad	2
	.quad	64
	.quad	.LC247
	.quad	0
	.quad	.LC24
	.quad	2
	.quad	64
	.quad	.LC248
	.quad	0
	.quad	.LC23
	.quad	12
	.quad	64
	.quad	.LC249
	.quad	0
	.quad	.LC143
	.quad	104
	.quad	160
	.quad	.LC250
	.quad	0
	.quad	.LC117
	.quad	38
	.quad	96
	.quad	.LC251
	.quad	0
	.quad	.LC26
	.quad	31
	.quad	64
	.quad	.LC252
	.quad	0
	.quad	.LC105
	.quad	37
	.quad	96
	.quad	.LC253
	.quad	0
	.quad	.LC29
	.quad	74
	.quad	128
	.quad	.LC254
	.quad	0
	.quad	.LC76
	.quad	5
	.quad	64
	.quad	.LC255
	.quad	0
	.quad	.LC67
	.quad	5
	.quad	64
	.quad	.LC256
	.quad	0
	.quad	.LC80
	.quad	9
	.quad	64
	.quad	.LC257
	.quad	0
	.quad	.LC100
	.quad	8
	.quad	64
	.quad	.LC258
	.quad	0
	.quad	.LC65
	.quad	5
	.quad	64
	.quad	.LC259
	.quad	0
	.quad	.LC84
	.quad	9
	.quad	64
	.quad	.LC260
	.quad	0
	.quad	.LC8
	.quad	22
	.quad	64
	.quad	.LC261
	.quad	0
	.quad	.LC91
	.quad	9
	.quad	64
	.quad	.LC262
	.quad	0
	.quad	.LC48
	.quad	1
	.quad	64
	.quad	.LC263
	.quad	0
	.quad	.LC30
	.quad	79
	.quad	128
	.quad	.LC264
	.quad	0
	.quad	.LC111
	.quad	25
	.quad	64
	.quad	.LC265
	.quad	0
	.quad	.LC130
	.quad	25
	.quad	64
	.quad	.LC266
	.quad	0
	.quad	.LC43
	.quad	58
	.quad	96
	.quad	.LC267
	.quad	0
	.quad	.LC139
	.quad	35
	.quad	96
	.quad	.LC268
	.quad	0
	.quad	.LC15
	.quad	11
	.quad	64
	.quad	.LC269
	.quad	0
	.quad	.LC142
	.quad	39
	.quad	96
	.quad	.LC270
	.quad	0
	.quad	.LC78
	.quad	5
	.quad	64
	.quad	.LC271
	.quad	0
	.quad	.LC70
	.quad	3
	.quad	64
	.quad	.LC272
	.quad	0
	.quad	.LC120
	.quad	44
	.quad	96
	.quad	.LC273
	.quad	0
	.quad	.LC53
	.quad	3
	.quad	64
	.quad	.LC274
	.quad	0
	.quad	.LC68
	.quad	3
	.quad	64
	.quad	.LC275
	.quad	0
	.quad	.LC57
	.quad	3
	.quad	64
	.quad	.LC276
	.quad	0
	.quad	.LC138
	.quad	43
	.quad	96
	.quad	.LC277
	.quad	0
	.quad	.LC132
	.quad	56
	.quad	96
	.quad	.LC278
	.quad	0
	.quad	.LC44
	.quad	38
	.quad	96
	.quad	.LC279
	.quad	0
	.quad	.LC134
	.quad	62
	.quad	96
	.quad	.LC280
	.quad	0
	.quad	.LC137
	.quad	33
	.quad	96
	.quad	.LC281
	.quad	0
	.quad	.LC104
	.quad	34
	.quad	96
	.quad	.LC282
	.quad	0
	.quad	.LC38
	.quad	30
	.quad	64
	.quad	.LC283
	.quad	0
	.quad	.LC37
	.quad	36
	.quad	96
	.quad	.LC284
	.quad	0
	.quad	.LC128
	.quad	33
	.quad	96
	.quad	.LC285
	.quad	0
	.quad	.LC3
	.quad	8
	.quad	64
	.quad	.LC286
	.quad	0
	.quad	.LC81
	.quad	9
	.quad	64
	.quad	.LC287
	.quad	0
	.quad	.LC58
	.quad	5
	.quad	64
	.quad	.LC288
	.quad	0
	.quad	.LC4
	.quad	5
	.quad	64
	.quad	.LC289
	.quad	0
	.quad	.LC18
	.quad	20
	.quad	64
	.quad	.LC290
	.quad	0
	.quad	.LC14
	.quad	10
	.quad	64
	.quad	.LC291
	.quad	0
	.quad	.LC123
	.quad	22
	.quad	64
	.quad	.LC292
	.quad	0
	.quad	.LC92
	.quad	10
	.quad	64
	.quad	.LC293
	.quad	0
	.quad	.LC35
	.quad	30
	.quad	64
	.quad	.LC294
	.quad	0
	.quad	.LC102
	.quad	8
	.quad	64
	.quad	.LC295
	.quad	0
	.quad	.LC85
	.quad	11
	.quad	64
	.quad	.LC296
	.quad	0
	.quad	.LC124
	.quad	36
	.quad	96
	.quad	.LC297
	.quad	0
	.quad	.LC0
	.quad	25
	.quad	64
	.quad	.LC298
	.quad	0
	.quad	.LC51
	.quad	3
	.quad	64
	.quad	.LC299
	.quad	0
	.quad	.LC71
	.quad	3
	.quad	64
	.quad	.LC300
	.quad	0
	.quad	.LC96
	.quad	8
	.quad	64
	.quad	.LC301
	.quad	0
	.quad	.LC52
	.quad	3
	.quad	64
	.quad	.LC302
	.quad	0
	.quad	.LC59
	.quad	3
	.quad	64
	.quad	.LC303
	.quad	0
	.quad	.LC95
	.quad	6
	.quad	64
	.quad	.LC304
	.quad	0
	.quad	.LC86
	.quad	5
	.quad	64
	.quad	.LC305
	.quad	0
	.quad	.LC106
	.quad	31
	.quad	64
	.quad	.LC306
	.quad	0
	.quad	.LC46
	.quad	7
	.quad	64
	.quad	.LC307
	.quad	0
	.quad	.LC11
	.quad	34
	.quad	96
	.quad	.LC308
	.quad	0
	.quad	.LC82
	.quad	8
	.quad	64
	.quad	.LC309
	.quad	0
	.quad	.LC16
	.quad	67
	.quad	128
	.quad	.LC310
	.quad	0
	.quad	.LC77
	.quad	6
	.quad	64
	.quad	.LC311
	.quad	0
	.text
	.type	_GLOBAL__sub_D_00099_0_terminate, @function
_GLOBAL__sub_D_00099_0_terminate:
.LFB36:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$168, %esi
	movl	$.LASAN0, %edi
	call	__asan_unregister_globals
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	_GLOBAL__sub_D_00099_0_terminate, .-_GLOBAL__sub_D_00099_0_terminate
	.section	.fini_array.00099,"aw"
	.align 8
	.quad	_GLOBAL__sub_D_00099_0_terminate
	.text
	.type	_GLOBAL__sub_I_00099_1_terminate, @function
_GLOBAL__sub_I_00099_1_terminate:
.LFB37:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	__asan_init_v1
	movl	$168, %esi
	movl	$.LASAN0, %edi
	call	__asan_register_globals
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	_GLOBAL__sub_I_00099_1_terminate, .-_GLOBAL__sub_I_00099_1_terminate
	.section	.init_array.00099,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_00099_1_terminate
	.ident	"GCC: (GNU) 4.8.3 20140911 (Red Hat 4.8.3-9)"
	.section	.note.GNU-stack,"",@progbits

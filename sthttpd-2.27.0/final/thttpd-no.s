	.file	"thttpd.c"
	.local	argv0
	.comm	argv0,8,8
	.local	debug
	.comm	debug,4,4
	.local	port
	.comm	port,2,2
	.local	dir
	.comm	dir,8,8
	.local	data_dir
	.comm	data_dir,8,8
	.local	do_chroot
	.comm	do_chroot,4,4
	.local	no_log
	.comm	no_log,4,4
	.local	no_symlink_check
	.comm	no_symlink_check,4,4
	.local	do_vhost
	.comm	do_vhost,4,4
	.local	do_global_passwd
	.comm	do_global_passwd,4,4
	.local	cgi_pattern
	.comm	cgi_pattern,8,8
	.local	cgi_limit
	.comm	cgi_limit,4,4
	.local	url_pattern
	.comm	url_pattern,8,8
	.local	no_empty_referers
	.comm	no_empty_referers,4,4
	.local	local_pattern
	.comm	local_pattern,8,8
	.local	logfile
	.comm	logfile,8,8
	.local	throttlefile
	.comm	throttlefile,8,8
	.local	hostname
	.comm	hostname,8,8
	.local	pidfile
	.comm	pidfile,8,8
	.local	user
	.comm	user,8,8
	.local	charset
	.comm	charset,8,8
	.local	p3p
	.comm	p3p,8,8
	.local	max_age
	.comm	max_age,4,4
	.local	throttles
	.comm	throttles,8,8
	.local	numthrottles
	.comm	numthrottles,4,4
	.local	maxthrottles
	.comm	maxthrottles,4,4
	.local	connects
	.comm	connects,8,8
	.local	num_connects
	.comm	num_connects,4,4
	.local	max_connects
	.comm	max_connects,4,4
	.local	first_free_connect
	.comm	first_free_connect,4,4
	.local	httpd_conn_count
	.comm	httpd_conn_count,4,4
	.local	hs
	.comm	hs,8,8
	.globl	terminate
	.bss
	.align 4
	.type	terminate, @object
	.size	terminate, 4
terminate:
	.zero	4
	.comm	start_time,8,8
	.comm	stats_time,8,8
	.comm	stats_connections,8,8
	.comm	stats_bytes,8,8
	.comm	stats_simultaneous,4,4
	.local	got_hup
	.comm	got_hup,4,4
	.local	got_usr1
	.comm	got_usr1,4,4
	.local	watchdog_flag
	.comm	watchdog_flag,4,4
	.section	.rodata
.LC0:
	.string	"exiting due to signal %d"
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
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE2:
	.size	handle_term, .-handle_term
	.section	.rodata
.LC1:
	.string	"child wait - %m"
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
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	call	__errno_location
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
.L10:
	leaq	-12(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$-1, %edi
	call	waitpid
	movl	%eax, -8(%rbp)
	cmpl	$0, -8(%rbp)
	jne	.L3
	jmp	.L4
.L3:
	cmpl	$0, -8(%rbp)
	jns	.L5
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L6
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$11, %eax
	jne	.L7
.L6:
	jmp	.L8
.L7:
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$10, %eax
	je	.L9
	movl	$.LC1, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
	jmp	.L4
.L9:
	jmp	.L4
.L5:
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L8
	movq	hs(%rip), %rax
	movl	36(%rax), %edx
	subl	$1, %edx
	movl	%edx, 36(%rax)
	movq	hs(%rip), %rax
	movl	36(%rax), %eax
	testl	%eax, %eax
	jns	.L8
	movq	hs(%rip), %rax
	movl	$0, 36(%rax)
	jmp	.L10
.L8:
	jmp	.L10
.L4:
	call	__errno_location
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	leave
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
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	$1, got_hup(%rip)
	call	__errno_location
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	handle_hup, .-handle_hup
	.section	.rodata
.LC2:
	.string	"exiting"
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
	jne	.L13
	call	shut_down
	movl	$.LC2, %esi
	movl	$5, %edi
	movl	$0, %eax
	call	syslog
	call	closelog
	movl	$0, %edi
	call	exit
.L13:
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
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	$0, %edi
	call	logstats
	call	__errno_location
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	handle_usr2, .-handle_usr2
	.section	.rodata
.LC3:
	.string	"/tmp"
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
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	watchdog_flag(%rip), %eax
	testl	%eax, %eax
	jne	.L16
	movl	$.LC3, %edi
	call	chdir
	call	abort
.L16:
	movl	$0, watchdog_flag(%rip)
	movl	$360, %edi
	call	alarm
	call	__errno_location
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	handle_alrm, .-handle_alrm
	.section	.rodata
.LC4:
	.string	"-"
.LC5:
	.string	"re-opening logfile"
.LC6:
	.string	"a"
.LC7:
	.string	"re-opening %.80s - %m"
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
	jne	.L18
	movq	hs(%rip), %rax
	testq	%rax, %rax
	jne	.L19
.L18:
	jmp	.L17
.L19:
	movq	logfile(%rip), %rax
	testq	%rax, %rax
	je	.L17
	movq	logfile(%rip), %rax
	movl	$.LC4, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	je	.L17
	movl	$.LC5, %esi
	movl	$5, %edi
	movl	$0, %eax
	call	syslog
	movq	logfile(%rip), %rax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	movq	logfile(%rip), %rax
	movl	$384, %esi
	movq	%rax, %rdi
	call	chmod
	movl	%eax, -12(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L21
	cmpl	$0, -12(%rbp)
	je	.L22
.L21:
	movq	logfile(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC7, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	jmp	.L17
.L22:
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
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	re_open_logfile, .-re_open_logfile
	.section	.rodata
.LC8:
	.string	"can't find any valid address"
	.align 8
.LC9:
	.string	"%s: can't find any valid address\n"
.LC10:
	.string	"unknown user - '%.80s'"
.LC11:
	.string	"%s: unknown user - '%s'\n"
.LC12:
	.string	"/dev/null"
.LC13:
	.string	"%.80s - %m"
	.align 8
.LC14:
	.string	"logfile is not an absolute path, you may not be able to re-open it"
	.align 8
.LC15:
	.string	"%s: logfile is not an absolute path, you may not be able to re-open it\n"
.LC16:
	.string	"fchown logfile - %m"
.LC17:
	.string	"fchown logfile"
.LC18:
	.string	"chdir - %m"
.LC19:
	.string	"chdir"
.LC20:
	.string	"daemon - %m"
.LC21:
	.string	"w"
.LC22:
	.string	"%d\n"
	.align 8
.LC23:
	.string	"fdwatch initialization failure"
.LC24:
	.string	"chroot - %m"
.LC25:
	.string	"chroot"
	.align 8
.LC26:
	.string	"logfile is not within the chroot tree, you will not be able to re-open it"
	.align 8
.LC27:
	.string	"%s: logfile is not within the chroot tree, you will not be able to re-open it\n"
.LC28:
	.string	"chroot chdir - %m"
.LC29:
	.string	"chroot chdir"
.LC30:
	.string	"data_dir chdir - %m"
.LC31:
	.string	"data_dir chdir"
.LC32:
	.string	"tmr_create(occasional) failed"
.LC33:
	.string	"tmr_create(idle) failed"
	.align 8
.LC34:
	.string	"tmr_create(update_throttles) failed"
.LC35:
	.string	"tmr_create(show_stats) failed"
.LC36:
	.string	"setgroups - %m"
.LC37:
	.string	"setgid - %m"
.LC38:
	.string	"initgroups - %m"
.LC39:
	.string	"setuid - %m"
	.align 8
.LC40:
	.string	"started as root without requesting chroot(), warning only"
	.align 8
.LC41:
	.string	"out of memory allocating a connecttab"
.LC42:
	.string	"fdwatch - %m"
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
	subq	$4616, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -4532(%rbp)
	movq	%rsi, -4544(%rbp)
	movl	$32767, -60(%rbp)
	movl	$32767, -64(%rbp)
	movq	-4544(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, argv0(%rip)
	movq	argv0(%rip), %rax
	movl	$47, %esi
	movq	%rax, %rdi
	call	strrchr
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	je	.L24
	addq	$1, -56(%rbp)
	jmp	.L25
.L24:
	movq	argv0(%rip), %rax
	movq	%rax, -56(%rbp)
.L25:
	movq	-56(%rbp), %rax
	movl	$24, %edx
	movl	$9, %esi
	movq	%rax, %rdi
	call	openlog
	movq	-4544(%rbp), %rdx
	movl	-4532(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	parse_args
	call	tzset
	leaq	-4504(%rbp), %rsi
	leaq	-4496(%rbp), %rcx
	leaq	-4500(%rbp), %rdx
	leaq	-4368(%rbp), %rax
	movq	%rsi, %r9
	movl	$128, %r8d
	movl	$128, %esi
	movq	%rax, %rdi
	call	lookup_hostname
	movl	-4500(%rbp), %eax
	testl	%eax, %eax
	jne	.L26
	movl	-4504(%rbp), %eax
	testl	%eax, %eax
	jne	.L26
	movl	$.LC8, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movl	$.LC9, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
.L26:
	movl	$0, numthrottles(%rip)
	movl	$0, maxthrottles(%rip)
	movq	$0, throttles(%rip)
	movq	throttlefile(%rip), %rax
	testq	%rax, %rax
	je	.L27
	movq	throttlefile(%rip), %rax
	movq	%rax, %rdi
	call	read_throttlefile
.L27:
	call	getuid
	testl	%eax, %eax
	jne	.L28
	movq	user(%rip), %rax
	movq	%rax, %rdi
	call	getpwnam
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L29
	movq	user(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC10, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movq	user(%rip), %rcx
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movl	$.LC11, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
.L29:
	movq	-88(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, -60(%rbp)
	movq	-88(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, -64(%rbp)
.L28:
	movq	logfile(%rip), %rax
	testq	%rax, %rax
	je	.L30
	movq	logfile(%rip), %rax
	movl	$.LC12, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L31
	movl	$1, no_log(%rip)
	movq	$0, -72(%rbp)
	jmp	.L37
.L31:
	movq	logfile(%rip), %rax
	movl	$.LC4, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L33
	movq	stdout(%rip), %rax
	movq	%rax, -72(%rbp)
	jmp	.L37
.L33:
	movq	logfile(%rip), %rax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -72(%rbp)
	movq	logfile(%rip), %rax
	movl	$384, %esi
	movq	%rax, %rdi
	call	chmod
	movl	%eax, -92(%rbp)
	cmpq	$0, -72(%rbp)
	je	.L34
	cmpl	$0, -92(%rbp)
	je	.L35
.L34:
	movq	logfile(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC13, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movq	logfile(%rip), %rax
	movq	%rax, %rdi
	call	perror
	movl	$1, %edi
	call	exit
.L35:
	movq	logfile(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	je	.L36
	movl	$.LC14, %esi
	movl	$4, %edi
	movl	$0, %eax
	call	syslog
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movl	$.LC15, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
.L36:
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	fileno
	movl	$1, %edx
	movl	$2, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	fcntl
	call	getuid
	testl	%eax, %eax
	jne	.L37
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	fileno
	movl	-64(%rbp), %edx
	movl	-60(%rbp), %ecx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	fchown
	testl	%eax, %eax
	jns	.L37
	movl	$.LC16, %esi
	movl	$4, %edi
	movl	$0, %eax
	call	syslog
	movl	$.LC17, %edi
	call	perror
	jmp	.L37
.L30:
	movq	$0, -72(%rbp)
.L37:
	movq	dir(%rip), %rax
	testq	%rax, %rax
	je	.L38
	movq	dir(%rip), %rax
	movq	%rax, %rdi
	call	chdir
	testl	%eax, %eax
	jns	.L38
	movl	$.LC18, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$.LC19, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L38:
	leaq	-4240(%rbp), %rax
	movl	$4096, %esi
	movq	%rax, %rdi
	call	getcwd
	leaq	-4240(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	subq	$1, %rax
	movzbl	-4240(%rbp,%rax), %eax
	cmpb	$47, %al
	je	.L39
	leaq	-4240(%rbp), %rax
	movq	$-1, %rcx
	movq	%rax, %rdx
	movl	$0, %eax
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	leaq	-4240(%rbp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
.L39:
	movl	debug(%rip), %eax
	testl	%eax, %eax
	jne	.L40
	movq	stdin(%rip), %rax
	movq	%rax, %rdi
	call	fclose
	movq	stdout(%rip), %rax
	cmpq	%rax, -72(%rbp)
	je	.L41
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fclose
.L41:
	movq	stderr(%rip), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$1, %esi
	movl	$1, %edi
	call	daemon
	testl	%eax, %eax
	jns	.L42
	movl	$.LC20, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L40:
	call	setsid
.L42:
	movq	pidfile(%rip), %rax
	testq	%rax, %rax
	je	.L43
	movq	pidfile(%rip), %rax
	movl	$.LC21, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jne	.L44
	movq	pidfile(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC13, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L44:
	call	getpid
	movl	%eax, %edx
	movq	-104(%rbp), %rax
	movl	$.LC22, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
.L43:
	call	fdwatch_get_nfiles
	movl	%eax, max_connects(%rip)
	movl	max_connects(%rip), %eax
	testl	%eax, %eax
	jns	.L45
	movl	$.LC23, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L45:
	movl	max_connects(%rip), %eax
	subl	$10, %eax
	movl	%eax, max_connects(%rip)
	movl	do_chroot(%rip), %eax
	testl	%eax, %eax
	je	.L46
	leaq	-4240(%rbp), %rax
	movq	%rax, %rdi
	call	chroot
	testl	%eax, %eax
	jns	.L47
	movl	$.LC24, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$.LC25, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L47:
	movq	logfile(%rip), %rax
	testq	%rax, %rax
	je	.L48
	movq	logfile(%rip), %rax
	movl	$.LC4, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	je	.L48
	leaq	-4240(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movq	logfile(%rip), %rax
	leaq	-4240(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L49
	movq	logfile(%rip), %rbx
	leaq	-4240(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	subq	$1, %rax
	leaq	(%rbx,%rax), %rdx
	movq	logfile(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L48
.L49:
	movl	$.LC26, %esi
	movl	$4, %edi
	movl	$0, %eax
	call	syslog
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movl	$.LC27, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
.L48:
	leaq	-4240(%rbp), %rax
	movw	$47, (%rax)
	leaq	-4240(%rbp), %rax
	movq	%rax, %rdi
	call	chdir
	testl	%eax, %eax
	jns	.L46
	movl	$.LC28, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$.LC29, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L46:
	movq	data_dir(%rip), %rax
	testq	%rax, %rax
	je	.L50
	movq	data_dir(%rip), %rax
	movq	%rax, %rdi
	call	chdir
	testl	%eax, %eax
	jns	.L50
	movl	$.LC30, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$.LC31, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L50:
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
	movq	%rax, -4552(%rbp)
	movq	url_pattern(%rip), %r15
	movl	do_global_passwd(%rip), %r14d
	movl	do_vhost(%rip), %r13d
	movl	no_symlink_check(%rip), %r12d
	movl	no_log(%rip), %ebx
	movl	max_age(%rip), %r11d
	movq	p3p(%rip), %r9
	movq	charset(%rip), %r8
	movl	cgi_limit(%rip), %eax
	movl	%eax, -4536(%rbp)
	movq	cgi_pattern(%rip), %rax
	movq	%rax, -4560(%rbp)
	movzwl	port(%rip), %eax
	movzwl	%ax, %r10d
	movl	-4504(%rbp), %eax
	testl	%eax, %eax
	je	.L51
	leaq	-4496(%rbp), %rdx
	jmp	.L52
.L51:
	movl	$0, %edx
.L52:
	movl	-4500(%rbp), %eax
	testl	%eax, %eax
	je	.L53
	leaq	-4368(%rbp), %rsi
	jmp	.L54
.L53:
	movl	$0, %esi
.L54:
	movq	hostname(%rip), %rdi
	movl	%ecx, 88(%rsp)
	movq	-4552(%rbp), %rax
	movq	%rax, 80(%rsp)
	movq	%r15, 72(%rsp)
	movl	%r14d, 64(%rsp)
	movl	%r13d, 56(%rsp)
	movl	%r12d, 48(%rsp)
	movq	-72(%rbp), %rax
	movq	%rax, 40(%rsp)
	movl	%ebx, 32(%rsp)
	leaq	-4240(%rbp), %rax
	movq	%rax, 24(%rsp)
	movl	%r11d, 16(%rsp)
	movq	%r9, 8(%rsp)
	movq	%r8, (%rsp)
	movl	-4536(%rbp), %r9d
	movq	-4560(%rbp), %r8
	movl	%r10d, %ecx
	call	httpd_initialize
	movq	%rax, hs(%rip)
	movq	hs(%rip), %rax
	testq	%rax, %rax
	jne	.L55
	movl	$1, %edi
	call	exit
.L55:
	movl	$1, %r8d
	movl	$120000, %ecx
	movq	JunkClientData(%rip), %rdx
	movl	$occasional, %esi
	movl	$0, %edi
	call	tmr_create
	testq	%rax, %rax
	jne	.L56
	movl	$.LC32, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L56:
	movl	$1, %r8d
	movl	$5000, %ecx
	movq	JunkClientData(%rip), %rdx
	movl	$idle, %esi
	movl	$0, %edi
	call	tmr_create
	testq	%rax, %rax
	jne	.L57
	movl	$.LC33, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L57:
	movl	numthrottles(%rip), %eax
	testl	%eax, %eax
	jle	.L58
	movl	$1, %r8d
	movl	$2000, %ecx
	movq	JunkClientData(%rip), %rdx
	movl	$update_throttles, %esi
	movl	$0, %edi
	call	tmr_create
	testq	%rax, %rax
	jne	.L58
	movl	$.LC34, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L58:
	movl	$1, %r8d
	movl	$3600000, %ecx
	movq	JunkClientData(%rip), %rdx
	movl	$show_stats, %esi
	movl	$0, %edi
	call	tmr_create
	testq	%rax, %rax
	jne	.L59
	movl	$.LC35, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L59:
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
	jne	.L60
	movl	$0, %esi
	movl	$0, %edi
	call	setgroups
	testl	%eax, %eax
	jns	.L61
	movl	$.LC36, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L61:
	movl	-64(%rbp), %eax
	movl	%eax, %edi
	call	setgid
	testl	%eax, %eax
	jns	.L62
	movl	$.LC37, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L62:
	movq	user(%rip), %rax
	movl	-64(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	initgroups
	testl	%eax, %eax
	jns	.L63
	movl	$.LC38, %esi
	movl	$4, %edi
	movl	$0, %eax
	call	syslog
.L63:
	movl	-60(%rbp), %eax
	movl	%eax, %edi
	call	setuid
	testl	%eax, %eax
	jns	.L64
	movl	$.LC39, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L64:
	movl	do_chroot(%rip), %eax
	testl	%eax, %eax
	jne	.L60
	movl	$.LC40, %esi
	movl	$4, %edi
	movl	$0, %eax
	call	syslog
.L60:
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
	jne	.L65
	movl	$.LC41, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L65:
	movl	$0, -76(%rbp)
	jmp	.L66
.L67:
	movq	connects(%rip), %rcx
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	$0, (%rax)
	movq	connects(%rip), %rcx
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	-76(%rbp), %edx
	addl	$1, %edx
	movl	%edx, 4(%rax)
	movq	connects(%rip), %rcx
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	$0, 8(%rax)
	addl	$1, -76(%rbp)
.L66:
	movl	max_connects(%rip), %eax
	cmpl	%eax, -76(%rbp)
	jl	.L67
	movq	connects(%rip), %rcx
	movl	max_connects(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	subq	$144, %rax
	addq	%rcx, %rax
	movl	$-1, 4(%rax)
	movl	$0, first_free_connect(%rip)
	movl	$0, num_connects(%rip)
	movl	$0, httpd_conn_count(%rip)
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L68
	movq	hs(%rip), %rax
	movl	72(%rax), %eax
	cmpl	$-1, %eax
	je	.L69
	movq	hs(%rip), %rax
	movl	72(%rax), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	fdwatch_add_fd
.L69:
	movq	hs(%rip), %rax
	movl	76(%rax), %eax
	cmpl	$-1, %eax
	je	.L68
	movq	hs(%rip), %rax
	movl	76(%rax), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	fdwatch_add_fd
.L68:
	leaq	-4528(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_prepare_timeval
	jmp	.L70
.L87:
	movl	got_hup(%rip), %eax
	testl	%eax, %eax
	je	.L71
	call	re_open_logfile
	movl	$0, got_hup(%rip)
.L71:
	leaq	-4528(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_mstimeout
	movq	%rax, %rdi
	call	fdwatch
	movl	%eax, -108(%rbp)
	cmpl	$0, -108(%rbp)
	jns	.L72
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L73
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$11, %eax
	jne	.L74
.L73:
	jmp	.L70
.L74:
	movl	$.LC42, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L72:
	leaq	-4528(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_prepare_timeval
	cmpl	$0, -108(%rbp)
	jne	.L75
	leaq	-4528(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_run
	jmp	.L70
.L75:
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L76
	movq	hs(%rip), %rax
	movl	76(%rax), %eax
	cmpl	$-1, %eax
	je	.L76
	movq	hs(%rip), %rax
	movl	76(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_check_fd
	testl	%eax, %eax
	je	.L76
	movq	hs(%rip), %rax
	movl	76(%rax), %edx
	leaq	-4528(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	handle_newconnect
	testl	%eax, %eax
	je	.L76
	jmp	.L70
.L76:
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L77
	movq	hs(%rip), %rax
	movl	72(%rax), %eax
	cmpl	$-1, %eax
	je	.L77
	movq	hs(%rip), %rax
	movl	72(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_check_fd
	testl	%eax, %eax
	je	.L77
	movq	hs(%rip), %rax
	movl	72(%rax), %edx
	leaq	-4528(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	handle_newconnect
	testl	%eax, %eax
	je	.L77
	jmp	.L70
.L77:
	jmp	.L78
.L84:
	cmpq	$0, -120(%rbp)
	jne	.L79
	jmp	.L78
.L79:
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -128(%rbp)
	movq	-128(%rbp), %rax
	movl	704(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_check_fd
	testl	%eax, %eax
	jne	.L80
	leaq	-4528(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	clear_connection
	jmp	.L78
.L80:
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$2, %eax
	je	.L81
	cmpl	$4, %eax
	je	.L82
	cmpl	$1, %eax
	jne	.L78
	leaq	-4528(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	handle_read
	jmp	.L78
.L81:
	leaq	-4528(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	handle_send
	jmp	.L78
.L82:
	leaq	-4528(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	handle_linger
	nop
.L78:
	call	fdwatch_get_next_client_data
	movq	%rax, -120(%rbp)
	cmpq	$-1, -120(%rbp)
	jne	.L84
	leaq	-4528(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_run
	movl	got_usr1(%rip), %eax
	testl	%eax, %eax
	je	.L70
	movl	terminate(%rip), %eax
	testl	%eax, %eax
	jne	.L70
	movl	$1, terminate(%rip)
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L70
	movq	hs(%rip), %rax
	movl	72(%rax), %eax
	cmpl	$-1, %eax
	je	.L85
	movq	hs(%rip), %rax
	movl	72(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
.L85:
	movq	hs(%rip), %rax
	movl	76(%rax), %eax
	cmpl	$-1, %eax
	je	.L86
	movq	hs(%rip), %rax
	movl	76(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
.L86:
	movq	hs(%rip), %rax
	movq	%rax, %rdi
	call	httpd_unlisten
.L70:
	movl	terminate(%rip), %eax
	testl	%eax, %eax
	je	.L87
	movl	num_connects(%rip), %eax
	testl	%eax, %eax
	jg	.L87
	call	shut_down
	movl	$.LC2, %esi
	movl	$5, %edi
	movl	$0, %eax
	call	syslog
	call	closelog
	movl	$0, %edi
	call	exit
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.section	.rodata
.LC43:
	.string	"nobody"
.LC44:
	.string	"iso-8859-1"
.LC45:
	.string	""
.LC46:
	.string	"-V"
.LC47:
	.string	"thttpd/2.27.0 Oct 3, 2014"
.LC48:
	.string	"-C"
.LC49:
	.string	"-p"
.LC50:
	.string	"-d"
.LC51:
	.string	"-r"
.LC52:
	.string	"-nor"
.LC53:
	.string	"-dd"
.LC54:
	.string	"-s"
.LC55:
	.string	"-nos"
.LC56:
	.string	"-u"
.LC57:
	.string	"-c"
.LC58:
	.string	"-t"
.LC59:
	.string	"-h"
.LC60:
	.string	"-l"
.LC61:
	.string	"-v"
.LC62:
	.string	"-nov"
.LC63:
	.string	"-g"
.LC64:
	.string	"-nog"
.LC65:
	.string	"-i"
.LC66:
	.string	"-T"
.LC67:
	.string	"-P"
.LC68:
	.string	"-M"
.LC69:
	.string	"-D"
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
	movq	$.LC43, user(%rip)
	movq	$.LC44, charset(%rip)
	movq	$.LC45, p3p(%rip)
	movl	$-1, max_age(%rip)
	movl	$1, -4(%rbp)
	jmp	.L89
.L115:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC46, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L90
	movl	$.LC47, %edi
	call	puts
	movl	$0, %edi
	call	exit
.L90:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC48, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L91
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L91
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	read_config
	jmp	.L92
.L91:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC49, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L93
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L93
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movw	%ax, port(%rip)
	jmp	.L92
.L93:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC50, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L94
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L94
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, dir(%rip)
	jmp	.L92
.L94:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC51, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L95
	movl	$1, do_chroot(%rip)
	movl	$1, no_symlink_check(%rip)
	jmp	.L92
.L95:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC52, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L96
	movl	$0, do_chroot(%rip)
	movl	$0, no_symlink_check(%rip)
	jmp	.L92
.L96:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC53, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L97
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L97
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, data_dir(%rip)
	jmp	.L92
.L97:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC54, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L98
	movl	$0, no_symlink_check(%rip)
	jmp	.L92
.L98:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC55, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L99
	movl	$1, no_symlink_check(%rip)
	jmp	.L92
.L99:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC56, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L100
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L100
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, user(%rip)
	jmp	.L92
.L100:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC57, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L101
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L101
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, cgi_pattern(%rip)
	jmp	.L92
.L101:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC58, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L102
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L102
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, throttlefile(%rip)
	jmp	.L92
.L102:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC59, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L103
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L103
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, hostname(%rip)
	jmp	.L92
.L103:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC60, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L104
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L104
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, logfile(%rip)
	jmp	.L92
.L104:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC61, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L105
	movl	$1, do_vhost(%rip)
	jmp	.L92
.L105:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC62, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L106
	movl	$0, do_vhost(%rip)
	jmp	.L92
.L106:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC63, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L107
	movl	$1, do_global_passwd(%rip)
	jmp	.L92
.L107:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC64, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L108
	movl	$0, do_global_passwd(%rip)
	jmp	.L92
.L108:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC65, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L109
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L109
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, pidfile(%rip)
	jmp	.L92
.L109:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC66, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L110
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L110
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, charset(%rip)
	jmp	.L92
.L110:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC67, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L111
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L111
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, p3p(%rip)
	jmp	.L92
.L111:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC68, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L112
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L112
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, max_age(%rip)
	jmp	.L92
.L112:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$.LC69, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L113
	movl	$1, debug(%rip)
	jmp	.L92
.L113:
	call	usage
.L92:
	addl	$1, -4(%rbp)
.L89:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.L114
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	je	.L115
.L114:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	je	.L88
	call	usage
.L88:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	parse_args, .-parse_args
	.section	.rodata
	.align 8
.LC70:
	.string	"usage:  %s [-C configfile] [-p port] [-d dir] [-r|-nor] [-dd data_dir] [-s|-nos] [-v|-nov] [-g|-nog] [-u user] [-c cgipat] [-t throttles] [-h host] [-l logfile] [-i pidfile] [-T charset] [-P P3P] [-M maxage] [-V] [-D]\n"
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
	movl	$.LC70, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE11:
	.size	usage, .-usage
	.section	.rodata
.LC71:
	.string	"r"
.LC72:
	.string	" \t\n\r"
.LC73:
	.string	"debug"
.LC74:
	.string	"port"
.LC75:
	.string	"dir"
.LC76:
	.string	"nochroot"
.LC77:
	.string	"data_dir"
.LC78:
	.string	"symlink"
.LC79:
	.string	"nosymlink"
.LC80:
	.string	"symlinks"
.LC81:
	.string	"nosymlinks"
.LC82:
	.string	"user"
.LC83:
	.string	"cgipat"
.LC84:
	.string	"cgilimit"
.LC85:
	.string	"urlpat"
.LC86:
	.string	"noemptyreferers"
.LC87:
	.string	"localpat"
.LC88:
	.string	"throttles"
.LC89:
	.string	"host"
.LC90:
	.string	"logfile"
.LC91:
	.string	"vhost"
.LC92:
	.string	"novhost"
.LC93:
	.string	"globalpasswd"
.LC94:
	.string	"noglobalpasswd"
.LC95:
	.string	"pidfile"
.LC96:
	.string	"charset"
.LC97:
	.string	"p3p"
.LC98:
	.string	"max_age"
	.align 8
.LC99:
	.string	"%s: unknown config option '%s'\n"
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
	subq	$160, %rsp
	movq	%rdi, -152(%rbp)
	movq	-152(%rbp), %rax
	movl	$.LC71, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L119
	movq	-152(%rbp), %rax
	movq	%rax, %rdi
	call	perror
	movl	$1, %edi
	call	exit
.L119:
	jmp	.L120
.L155:
	leaq	-144(%rbp), %rax
	movl	$35, %esi
	movq	%rax, %rdi
	call	strchr
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L121
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
.L121:
	leaq	-144(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$.LC72, %esi
	movq	%rax, %rdi
	call	strspn
	addq	%rax, -8(%rbp)
	jmp	.L122
.L154:
	movq	-8(%rbp), %rax
	movl	$.LC72, %esi
	movq	%rax, %rdi
	call	strcspn
	movq	-8(%rbp), %rdx
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	jmp	.L123
.L124:
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movb	$0, (%rax)
.L123:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	je	.L124
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$9, %al
	je	.L124
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	je	.L124
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$13, %al
	je	.L124
	movq	-8(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$61, %esi
	movq	%rax, %rdi
	call	strchr
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L125
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movb	$0, (%rax)
.L125:
	movq	-40(%rbp), %rax
	movl	$.LC73, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L126
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$1, debug(%rip)
	jmp	.L127
.L126:
	movq	-40(%rbp), %rax
	movl	$.LC74, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L128
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movw	%ax, port(%rip)
	jmp	.L127
.L128:
	movq	-40(%rbp), %rax
	movl	$.LC75, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L129
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, dir(%rip)
	jmp	.L127
.L129:
	movq	-40(%rbp), %rax
	movl	$.LC25, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L130
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$1, do_chroot(%rip)
	movl	$1, no_symlink_check(%rip)
	jmp	.L127
.L130:
	movq	-40(%rbp), %rax
	movl	$.LC76, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L131
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$0, do_chroot(%rip)
	movl	$0, no_symlink_check(%rip)
	jmp	.L127
.L131:
	movq	-40(%rbp), %rax
	movl	$.LC77, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L132
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, data_dir(%rip)
	jmp	.L127
.L132:
	movq	-40(%rbp), %rax
	movl	$.LC78, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L133
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$0, no_symlink_check(%rip)
	jmp	.L127
.L133:
	movq	-40(%rbp), %rax
	movl	$.LC79, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L134
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$1, no_symlink_check(%rip)
	jmp	.L127
.L134:
	movq	-40(%rbp), %rax
	movl	$.LC80, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L135
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$0, no_symlink_check(%rip)
	jmp	.L127
.L135:
	movq	-40(%rbp), %rax
	movl	$.LC81, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L136
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$1, no_symlink_check(%rip)
	jmp	.L127
.L136:
	movq	-40(%rbp), %rax
	movl	$.LC82, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L137
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, user(%rip)
	jmp	.L127
.L137:
	movq	-40(%rbp), %rax
	movl	$.LC83, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L138
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, cgi_pattern(%rip)
	jmp	.L127
.L138:
	movq	-40(%rbp), %rax
	movl	$.LC84, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L139
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, cgi_limit(%rip)
	jmp	.L127
.L139:
	movq	-40(%rbp), %rax
	movl	$.LC85, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L140
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, url_pattern(%rip)
	jmp	.L127
.L140:
	movq	-40(%rbp), %rax
	movl	$.LC86, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L141
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$1, no_empty_referers(%rip)
	jmp	.L127
.L141:
	movq	-40(%rbp), %rax
	movl	$.LC87, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L142
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, local_pattern(%rip)
	jmp	.L127
.L142:
	movq	-40(%rbp), %rax
	movl	$.LC88, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L143
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, throttlefile(%rip)
	jmp	.L127
.L143:
	movq	-40(%rbp), %rax
	movl	$.LC89, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L144
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, hostname(%rip)
	jmp	.L127
.L144:
	movq	-40(%rbp), %rax
	movl	$.LC90, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L145
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, logfile(%rip)
	jmp	.L127
.L145:
	movq	-40(%rbp), %rax
	movl	$.LC91, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L146
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$1, do_vhost(%rip)
	jmp	.L127
.L146:
	movq	-40(%rbp), %rax
	movl	$.LC92, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L147
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$0, do_vhost(%rip)
	jmp	.L127
.L147:
	movq	-40(%rbp), %rax
	movl	$.LC93, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L148
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$1, do_global_passwd(%rip)
	jmp	.L127
.L148:
	movq	-40(%rbp), %rax
	movl	$.LC94, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L149
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	no_value_required
	movl	$0, do_global_passwd(%rip)
	jmp	.L127
.L149:
	movq	-40(%rbp), %rax
	movl	$.LC95, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L150
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, pidfile(%rip)
	jmp	.L127
.L150:
	movq	-40(%rbp), %rax
	movl	$.LC96, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L151
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, charset(%rip)
	jmp	.L127
.L151:
	movq	-40(%rbp), %rax
	movl	$.LC97, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L152
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, p3p(%rip)
	jmp	.L127
.L152:
	movq	-40(%rbp), %rax
	movl	$.LC98, %esi
	movq	%rax, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L153
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	value_required
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, max_age(%rip)
	jmp	.L127
.L153:
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movq	-40(%rbp), %rcx
	movl	$.LC99, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
.L127:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$.LC72, %esi
	movq	%rax, %rdi
	call	strspn
	addq	%rax, -8(%rbp)
.L122:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L154
.L120:
	movq	-32(%rbp), %rdx
	leaq	-144(%rbp), %rax
	movl	$1000, %esi
	movq	%rax, %rdi
	call	fgets
	testq	%rax, %rax
	jne	.L155
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	read_config, .-read_config
	.section	.rodata
	.align 8
.LC100:
	.string	"%s: value required for %s option\n"
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
	jne	.L156
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rcx
	movl	$.LC100, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
.L156:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	value_required, .-value_required
	.section	.rodata
	.align 8
.LC101:
	.string	"%s: no value required for %s option\n"
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
	je	.L158
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rcx
	movl	$.LC101, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
.L158:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	no_value_required, .-no_value_required
	.section	.rodata
	.align 8
.LC102:
	.string	"out of memory copying a string"
	.align 8
.LC103:
	.string	"%s: out of memory copying a string\n"
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
	jne	.L161
	movl	$.LC102, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movl	$.LC103, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
.L161:
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	e_strdup, .-e_strdup
	.section	.rodata
.LC104:
	.string	"%d"
.LC105:
	.string	"getaddrinfo %.80s - %.80s"
.LC106:
	.string	"%s: getaddrinfo %s - %s\n"
	.align 8
.LC107:
	.string	"%.80s - sockaddr too small (%lu < %lu)"
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
	subq	$160, %rsp
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%rdx, -136(%rbp)
	movq	%rcx, -144(%rbp)
	movq	%r8, -152(%rbp)
	movq	%r9, -160(%rbp)
	leaq	-80(%rbp), %rax
	movl	$48, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movl	$0, -76(%rbp)
	movl	$1, -80(%rbp)
	movl	$1, -72(%rbp)
	movzwl	port(%rip), %eax
	movzwl	%ax, %edx
	leaq	-96(%rbp), %rax
	movl	%edx, %ecx
	movl	$.LC104, %edx
	movl	$10, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf
	movq	hostname(%rip), %rax
	leaq	-104(%rbp), %rcx
	leaq	-80(%rbp), %rdx
	leaq	-96(%rbp), %rsi
	movq	%rax, %rdi
	call	getaddrinfo
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	je	.L164
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	gai_strerror
	movq	%rax, %rdx
	movq	hostname(%rip), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$.LC105, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	gai_strerror
	movq	%rax, %rsi
	movq	hostname(%rip), %rcx
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movq	%rsi, %r8
	movl	$.LC106, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
.L164:
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L165
.L171:
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	$2, %eax
	je	.L167
	cmpl	$10, %eax
	jne	.L166
	cmpq	$0, -16(%rbp)
	jne	.L169
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L166
.L169:
	jmp	.L166
.L167:
	cmpq	$0, -24(%rbp)
	jne	.L170
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	jmp	.L178
.L170:
.L178:
	nop
.L166:
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -8(%rbp)
.L165:
	cmpq	$0, -8(%rbp)
	jne	.L171
	cmpq	$0, -16(%rbp)
	jne	.L172
	movq	-160(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L173
.L172:
	movq	-16(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %eax
	cmpq	-152(%rbp), %rax
	jbe	.L174
	movq	-16(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %ecx
	movq	hostname(%rip), %rax
	movq	-152(%rbp), %rdx
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$.LC107, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L174:
	movq	-152(%rbp), %rdx
	movq	-144(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movq	-16(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movq	24(%rax), %rcx
	movq	-144(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memmove
	movq	-160(%rbp), %rax
	movl	$1, (%rax)
.L173:
	cmpq	$0, -24(%rbp)
	jne	.L175
	movq	-136(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L176
.L175:
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %eax
	cmpq	-128(%rbp), %rax
	jbe	.L177
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %ecx
	movq	hostname(%rip), %rax
	movq	-128(%rbp), %rdx
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$.LC107, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L177:
	movq	-128(%rbp), %rdx
	movq	-120(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movq	24(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memmove
	movq	-136(%rbp), %rax
	movl	$1, (%rax)
.L176:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	freeaddrinfo
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	lookup_hostname, .-lookup_hostname
	.section	.rodata
.LC108:
	.string	" %4900[^ \t] %ld-%ld"
.LC109:
	.string	" %4900[^ \t] %ld"
	.align 8
.LC110:
	.string	"unparsable line in %.80s - %.80s"
	.align 8
.LC111:
	.string	"%s: unparsable line in %.80s - %.80s\n"
.LC112:
	.string	"|/"
	.align 8
.LC113:
	.string	"out of memory allocating a throttletab"
	.align 8
.LC114:
	.string	"%s: out of memory allocating a throttletab\n"
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
	pushq	%rbx
	subq	$10088, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -10088(%rbp)
	movq	-10088(%rbp), %rax
	movl	$.LC71, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L180
	movq	-10088(%rbp), %rax
	movq	%rax, %rdx
	movl	$.LC13, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movq	-10088(%rbp), %rax
	movq	%rax, %rdi
	call	perror
	movl	$1, %edi
	call	exit
.L180:
	leaq	-10080(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	jmp	.L181
.L195:
	leaq	-5040(%rbp), %rax
	movl	$35, %esi
	movq	%rax, %rdi
	call	strchr
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	je	.L182
	movq	-40(%rbp), %rax
	movb	$0, (%rax)
.L182:
	leaq	-5040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, -20(%rbp)
	jmp	.L183
.L185:
	subl	$1, -20(%rbp)
	movl	-20(%rbp), %eax
	cltq
	movb	$0, -5040(%rbp,%rax)
.L183:
	cmpl	$0, -20(%rbp)
	jle	.L184
	movl	-20(%rbp), %eax
	subl	$1, %eax
	cltq
	movzbl	-5040(%rbp,%rax), %eax
	cmpb	$32, %al
	je	.L185
	movl	-20(%rbp), %eax
	subl	$1, %eax
	cltq
	movzbl	-5040(%rbp,%rax), %eax
	cmpb	$9, %al
	je	.L185
	movl	-20(%rbp), %eax
	subl	$1, %eax
	cltq
	movzbl	-5040(%rbp,%rax), %eax
	cmpb	$10, %al
	je	.L185
	movl	-20(%rbp), %eax
	subl	$1, %eax
	cltq
	movzbl	-5040(%rbp,%rax), %eax
	cmpb	$13, %al
	je	.L185
.L184:
	cmpl	$0, -20(%rbp)
	jne	.L186
	jmp	.L181
.L186:
	leaq	-10056(%rbp), %rsi
	leaq	-10064(%rbp), %rcx
	leaq	-10048(%rbp), %rdx
	leaq	-5040(%rbp), %rax
	movq	%rsi, %r8
	movl	$.LC108, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf
	cmpl	$3, %eax
	je	.L187
	leaq	-10056(%rbp), %rcx
	leaq	-10048(%rbp), %rdx
	leaq	-5040(%rbp), %rax
	movl	$.LC109, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L188
	movq	$0, -10064(%rbp)
	jmp	.L187
.L188:
	leaq	-5040(%rbp), %rdx
	movq	-10088(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$.LC110, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	leaq	-5040(%rbp), %rsi
	movq	-10088(%rbp), %rcx
	movq	%rsi, %r8
	movl	$.LC111, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	jmp	.L181
.L187:
	movzbl	-10048(%rbp), %eax
	cmpb	$47, %al
	jne	.L189
	leaq	-10048(%rbp), %rax
	leaq	1(%rax), %rdx
	leaq	-10048(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L190
.L189:
	jmp	.L190
.L191:
	movq	-40(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
.L190:
	leaq	-10048(%rbp), %rax
	movl	$.LC112, %esi
	movq	%rax, %rdi
	call	strstr
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L191
	movl	numthrottles(%rip), %edx
	movl	maxthrottles(%rip), %eax
	cmpl	%eax, %edx
	jl	.L192
	movl	maxthrottles(%rip), %eax
	testl	%eax, %eax
	jne	.L193
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
	jmp	.L194
.L193:
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
.L194:
	movq	throttles(%rip), %rax
	testq	%rax, %rax
	jne	.L192
	movl	$.LC113, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movq	argv0(%rip), %rdx
	movq	stderr(%rip), %rax
	movl	$.LC114, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$1, %edi
	call	exit
.L192:
	movq	throttles(%rip), %rcx
	movl	numthrottles(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-10048(%rbp), %rax
	movq	%rax, %rdi
	call	e_strdup
	movq	%rax, (%rbx)
	movq	throttles(%rip), %rcx
	movl	numthrottles(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movq	-10056(%rbp), %rax
	movq	%rax, 8(%rdx)
	movq	throttles(%rip), %rcx
	movl	numthrottles(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movq	-10064(%rbp), %rax
	movq	%rax, 16(%rdx)
	movq	throttles(%rip), %rcx
	movl	numthrottles(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	$0, 24(%rax)
	movq	throttles(%rip), %rcx
	movl	numthrottles(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	$0, 32(%rax)
	movq	throttles(%rip), %rcx
	movl	numthrottles(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	$0, 40(%rax)
	movl	numthrottles(%rip), %eax
	addl	$1, %eax
	movl	%eax, numthrottles(%rip)
.L181:
	movq	-32(%rbp), %rdx
	leaq	-5040(%rbp), %rax
	movl	$5000, %esi
	movq	%rax, %rdi
	call	fgets
	testq	%rax, %rax
	jne	.L195
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	addq	$10088, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	read_throttlefile, .-read_throttlefile
	.type	shut_down, @function
shut_down:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	leaq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	logstats
	movl	$0, -4(%rbp)
	jmp	.L197
.L200:
	movq	connects(%rip), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L198
	movq	connects(%rip), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rax
	leaq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	httpd_close_conn
.L198:
	movq	connects(%rip), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L199
	movq	connects(%rip), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	httpd_destroy_conn
	movq	connects(%rip), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free
	movl	httpd_conn_count(%rip), %eax
	subl	$1, %eax
	movl	%eax, httpd_conn_count(%rip)
	movq	connects(%rip), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	$0, 8(%rax)
.L199:
	addl	$1, -4(%rbp)
.L197:
	movl	max_connects(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L200
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L201
	movq	hs(%rip), %rax
	movq	%rax, -16(%rbp)
	movq	$0, hs(%rip)
	movq	-16(%rbp), %rax
	movl	72(%rax), %eax
	cmpl	$-1, %eax
	je	.L202
	movq	-16(%rbp), %rax
	movl	72(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
.L202:
	movq	-16(%rbp), %rax
	movl	76(%rax), %eax
	cmpl	$-1, %eax
	je	.L203
	movq	-16(%rbp), %rax
	movl	76(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
.L203:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	httpd_terminate
.L201:
	call	mmc_destroy
	call	tmr_destroy
	movq	connects(%rip), %rax
	movq	%rax, %rdi
	call	free
	movq	throttles(%rip), %rax
	testq	%rax, %rax
	je	.L196
	movq	throttles(%rip), %rax
	movq	%rax, %rdi
	call	free
.L196:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	shut_down, .-shut_down
	.section	.rodata
.LC115:
	.string	"too many connections!"
	.align 8
.LC116:
	.string	"the connects free list is messed up"
	.align 8
.LC117:
	.string	"out of memory allocating an httpd_conn"
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
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
.L216:
	movl	num_connects(%rip), %edx
	movl	max_connects(%rip), %eax
	cmpl	%eax, %edx
	jl	.L206
	movl	$.LC115, %esi
	movl	$4, %edi
	movl	$0, %eax
	call	syslog
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_run
	movl	$0, %eax
	jmp	.L217
.L206:
	movl	first_free_connect(%rip), %eax
	cmpl	$-1, %eax
	je	.L208
	movq	connects(%rip), %rcx
	movl	first_free_connect(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L209
.L208:
	movl	$.LC116, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L209:
	movq	connects(%rip), %rcx
	movl	first_free_connect(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L210
	movl	$720, %edi
	call	malloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L211
	movl	$.LC117, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L211:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	$0, (%rax)
	movl	httpd_conn_count(%rip), %eax
	addl	$1, %eax
	movl	%eax, httpd_conn_count(%rip)
.L210:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	hs(%rip), %rax
	movl	-28(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	httpd_get_conn
	testl	%eax, %eax
	je	.L213
	cmpl	$2, %eax
	je	.L214
	jmp	.L218
.L213:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_run
	movl	$0, %eax
	jmp	.L217
.L214:
	movl	$1, %eax
	jmp	.L217
.L218:
	movq	-8(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, first_free_connect(%rip)
	movq	-8(%rbp), %rax
	movl	$-1, 4(%rax)
	movl	num_connects(%rip), %eax
	addl	$1, %eax
	movl	%eax, num_connects(%rip)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 88(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 96(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 104(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 136(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 56(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	704(%rax), %eax
	movl	%eax, %edi
	call	httpd_set_ndelay
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	704(%rax), %eax
	movq	-8(%rbp), %rcx
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
	jle	.L215
	movl	num_connects(%rip), %eax
	movl	%eax, stats_simultaneous(%rip)
	jmp	.L216
.L215:
	jmp	.L216
.L217:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	handle_newconnect, .-handle_newconnect
	.type	handle_read, @function
handle_read:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	160(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	152(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L220
	movq	-16(%rbp), %rax
	movq	152(%rax), %rax
	cmpq	$5000, %rax
	jbe	.L221
	movq	httpd_err400form(%rip), %rcx
	movq	httpd_err400title(%rip), %rdx
	movq	-16(%rbp), %rax
	movl	$.LC45, %r9d
	movq	%rcx, %r8
	movl	$.LC45, %ecx
	movl	$400, %esi
	movq	%rax, %rdi
	call	httpd_send_err
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L219
.L221:
	movq	-16(%rbp), %rax
	movq	152(%rax), %rax
	leaq	1000(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	152(%rax), %rcx
	movq	-16(%rbp), %rax
	addq	$144, %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	httpd_realloc_str
.L220:
	movq	-16(%rbp), %rax
	movq	152(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	160(%rax), %rax
	subq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	144(%rax), %rcx
	movq	-16(%rbp), %rax
	movq	160(%rax), %rax
	addq	%rax, %rcx
	movq	-16(%rbp), %rax
	movl	704(%rax), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L223
	movq	httpd_err400form(%rip), %rcx
	movq	httpd_err400title(%rip), %rdx
	movq	-16(%rbp), %rax
	movl	$.LC45, %r9d
	movq	%rcx, %r8
	movl	$.LC45, %ecx
	movl	$400, %esi
	movq	%rax, %rdi
	call	httpd_send_err
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L219
.L223:
	cmpl	$0, -20(%rbp)
	jns	.L224
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L225
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$11, %eax
	je	.L225
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$11, %eax
	jne	.L226
.L225:
	jmp	.L219
.L226:
	movq	httpd_err400form(%rip), %rcx
	movq	httpd_err400title(%rip), %rdx
	movq	-16(%rbp), %rax
	movl	$.LC45, %r9d
	movq	%rcx, %r8
	movl	$.LC45, %ecx
	movl	$400, %esi
	movq	%rax, %rdi
	call	httpd_send_err
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L219
.L224:
	movq	-16(%rbp), %rax
	movq	160(%rax), %rdx
	movl	-20(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 160(%rax)
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 88(%rax)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	httpd_got_request
	testl	%eax, %eax
	je	.L242
	cmpl	$2, %eax
	jne	.L241
	movq	httpd_err400form(%rip), %rcx
	movq	httpd_err400title(%rip), %rdx
	movq	-16(%rbp), %rax
	movl	$.LC45, %r9d
	movq	%rcx, %r8
	movl	$.LC45, %ecx
	movl	$400, %esi
	movq	%rax, %rdi
	call	httpd_send_err
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L219
.L241:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	httpd_parse_request
	testl	%eax, %eax
	jns	.L230
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L219
.L230:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	check_throttles
	testl	%eax, %eax
	jne	.L231
	movq	-16(%rbp), %rax
	movq	208(%rax), %rsi
	movq	httpd_err503form(%rip), %rcx
	movq	httpd_err503title(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	%rsi, %r9
	movq	%rcx, %r8
	movl	$.LC45, %ecx
	movl	$503, %esi
	movq	%rax, %rdi
	call	httpd_send_err
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L219
.L231:
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	httpd_start_request
	testl	%eax, %eax
	jns	.L232
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L219
.L232:
	movq	-16(%rbp), %rax
	movl	528(%rax), %eax
	testl	%eax, %eax
	je	.L233
	movq	-16(%rbp), %rax
	movq	536(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 136(%rax)
	movq	-16(%rbp), %rax
	movq	544(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 128(%rax)
	jmp	.L234
.L233:
	movq	-16(%rbp), %rax
	movq	192(%rax), %rax
	testq	%rax, %rax
	jns	.L235
	movq	-40(%rbp), %rax
	movq	$0, 128(%rax)
	jmp	.L234
.L235:
	movq	-16(%rbp), %rax
	movq	192(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 128(%rax)
.L234:
	movq	-16(%rbp), %rax
	movq	712(%rax), %rax
	testq	%rax, %rax
	jne	.L236
	movl	$0, -4(%rbp)
	jmp	.L237
.L238:
	movq	throttles(%rip), %rcx
	movq	-40(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	$4, %rdx
	movl	(%rax,%rdx,4), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rax, %rcx
	movq	throttles(%rip), %rsi
	movq	-40(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	$4, %rdx
	movl	(%rax,%rdx,4), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movq	32(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	200(%rax), %rax
	addq	%rdx, %rax
	movq	%rax, 32(%rcx)
	addl	$1, -4(%rbp)
.L237:
	movq	-40(%rbp), %rax
	movl	56(%rax), %eax
	cmpl	-4(%rbp), %eax
	jg	.L238
	movq	-16(%rbp), %rax
	movq	200(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 136(%rax)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L219
.L236:
	movq	-40(%rbp), %rax
	movq	136(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	128(%rax), %rax
	cmpq	%rax, %rdx
	jl	.L239
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L219
.L239:
	movq	-40(%rbp), %rax
	movl	$2, (%rax)
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 80(%rax)
	movq	-40(%rbp), %rax
	movq	$0, 112(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rax
	movl	704(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
	movq	-16(%rbp), %rax
	movl	704(%rax), %eax
	movq	-40(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	fdwatch_add_fd
	jmp	.L219
.L242:
	nop
.L219:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	handle_read, .-handle_read
	.section	.rodata
	.align 8
.LC118:
	.string	"replacing non-null wakeup_timer!"
	.align 8
.LC119:
	.string	"tmr_create(wakeup_connection) failed"
.LC120:
	.string	"write - %m sending %.80s"
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
	subq	$120, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-120(%rbp), %rax
	movq	64(%rax), %rax
	cmpq	$-1, %rax
	jne	.L244
	movq	$1000000000, -24(%rbp)
	jmp	.L245
.L244:
	movq	-120(%rbp), %rax
	movq	64(%rax), %rax
	leaq	3(%rax), %rdx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	sarq	$2, %rax
	movq	%rax, -24(%rbp)
.L245:
	movq	-56(%rbp), %rax
	movq	472(%rax), %rax
	testq	%rax, %rax
	jne	.L246
	movq	-120(%rbp), %rax
	movq	128(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	136(%rax), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	cmpq	%rax, %rdx
	cmova	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	712(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	136(%rax), %rax
	addq	%rax, %rcx
	movq	-56(%rbp), %rax
	movl	704(%rax), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -28(%rbp)
	jmp	.L247
.L246:
	movq	-56(%rbp), %rax
	movq	368(%rax), %rax
	movq	%rax, -112(%rbp)
	movq	-56(%rbp), %rax
	movq	472(%rax), %rax
	movq	%rax, -104(%rbp)
	movq	-56(%rbp), %rax
	movq	712(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	136(%rax), %rax
	addq	%rdx, %rax
	movq	%rax, -96(%rbp)
	movq	-120(%rbp), %rax
	movq	128(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	136(%rax), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	cmpq	%rax, %rdx
	cmovbe	%rdx, %rax
	movq	%rax, -88(%rbp)
	movq	-56(%rbp), %rax
	movl	704(%rax), %eax
	leaq	-112(%rbp), %rcx
	movl	$2, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	writev
	movl	%eax, -28(%rbp)
.L247:
	cmpl	$0, -28(%rbp)
	jns	.L248
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$4, %eax
	jne	.L248
	jmp	.L243
.L248:
	cmpl	$0, -28(%rbp)
	je	.L250
	cmpl	$0, -28(%rbp)
	jns	.L251
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$11, %eax
	je	.L250
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$11, %eax
	jne	.L251
.L250:
	movq	-120(%rbp), %rax
	movq	112(%rax), %rax
	leaq	100(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, 112(%rax)
	movq	-120(%rbp), %rax
	movl	$3, (%rax)
	movq	-56(%rbp), %rax
	movl	704(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
	movq	-120(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-120(%rbp), %rax
	movq	96(%rax), %rax
	testq	%rax, %rax
	je	.L252
	movl	$.LC118, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
.L252:
	movq	-120(%rbp), %rax
	movq	112(%rax), %rcx
	movq	-80(%rbp), %rdx
	movq	-128(%rbp), %rax
	movl	$0, %r8d
	movl	$wakeup_connection, %esi
	movq	%rax, %rdi
	call	tmr_create
	movq	-120(%rbp), %rdx
	movq	%rax, 96(%rdx)
	movq	-120(%rbp), %rax
	movq	96(%rax), %rax
	testq	%rax, %rax
	jne	.L253
	movl	$.LC119, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L253:
	jmp	.L243
.L251:
	cmpl	$0, -28(%rbp)
	jns	.L254
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$32, %eax
	je	.L255
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$22, %eax
	je	.L255
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$104, %eax
	je	.L255
	movq	-56(%rbp), %rax
	movq	208(%rax), %rax
	movq	%rax, %rdx
	movl	$.LC120, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
.L255:
	movq	-128(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	clear_connection
	jmp	.L243
.L254:
	movq	-128(%rbp), %rax
	movq	(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, 88(%rax)
	movq	-56(%rbp), %rax
	movq	472(%rax), %rax
	testq	%rax, %rax
	je	.L256
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	movq	472(%rax), %rax
	cmpq	%rax, %rdx
	jae	.L257
	movq	-56(%rbp), %rax
	movq	472(%rax), %rax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -60(%rbp)
	movl	-60(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	movq	368(%rax), %rcx
	movl	-28(%rbp), %eax
	cltq
	addq	%rax, %rcx
	movq	-56(%rbp), %rax
	movq	368(%rax), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memmove
	movl	-60(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, 472(%rax)
	movl	$0, -28(%rbp)
	jmp	.L256
.L257:
	movl	-28(%rbp), %edx
	movq	-56(%rbp), %rax
	movq	472(%rax), %rax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -28(%rbp)
	movq	-56(%rbp), %rax
	movq	$0, 472(%rax)
.L256:
	movq	-120(%rbp), %rax
	movq	136(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, 136(%rax)
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	movq	-120(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	200(%rdx), %rcx
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	movq	%rdx, 200(%rax)
	movl	$0, -44(%rbp)
	jmp	.L258
.L259:
	movq	throttles(%rip), %rcx
	movq	-120(%rbp), %rax
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	addq	$4, %rdx
	movl	(%rax,%rdx,4), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rax, %rcx
	movq	throttles(%rip), %rsi
	movq	-120(%rbp), %rax
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	addq	$4, %rdx
	movl	(%rax,%rdx,4), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movq	32(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, 32(%rcx)
	addl	$1, -44(%rbp)
.L258:
	movq	-120(%rbp), %rax
	movl	56(%rax), %eax
	cmpl	-44(%rbp), %eax
	jg	.L259
	movq	-120(%rbp), %rax
	movq	136(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	128(%rax), %rax
	cmpq	%rax, %rdx
	jl	.L260
	movq	-128(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L243
.L260:
	movq	-120(%rbp), %rax
	movq	112(%rax), %rax
	cmpq	$100, %rax
	jle	.L261
	movq	-120(%rbp), %rax
	movq	112(%rax), %rax
	leaq	-100(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, 112(%rax)
.L261:
	movq	-120(%rbp), %rax
	movq	64(%rax), %rax
	cmpq	$-1, %rax
	je	.L243
	movq	-128(%rbp), %rax
	movq	(%rax), %rdx
	movq	-120(%rbp), %rax
	movq	80(%rax), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L263
	movq	$1, -40(%rbp)
.L263:
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	movq	200(%rax), %rax
	cqto
	idivq	-40(%rbp)
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	movq	64(%rax), %rax
	cmpq	%rax, %rdx
	jle	.L243
	movq	-120(%rbp), %rax
	movl	$3, (%rax)
	movq	-56(%rbp), %rax
	movl	704(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	movq	200(%rax), %rax
	movq	-120(%rbp), %rdx
	movq	64(%rdx), %rbx
	cqto
	idivq	%rbx
	movl	%eax, %edx
	movq	-40(%rbp), %rax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -64(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-120(%rbp), %rax
	movq	96(%rax), %rax
	testq	%rax, %rax
	je	.L264
	movl	$.LC118, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
.L264:
	cmpl	$0, -64(%rbp)
	jle	.L265
	movl	-64(%rbp), %eax
	cltq
	imulq	$1000, %rax, %rax
	jmp	.L266
.L265:
	movl	$500, %eax
.L266:
	movq	-80(%rbp), %rdx
	movq	-128(%rbp), %rdi
	movl	$0, %r8d
	movq	%rax, %rcx
	movl	$wakeup_connection, %esi
	call	tmr_create
	movq	-120(%rbp), %rdx
	movq	%rax, 96(%rdx)
	movq	-120(%rbp), %rax
	movq	96(%rax), %rax
	testq	%rax, %rax
	jne	.L243
	movl	$.LC119, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L243:
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	handle_send, .-handle_send
	.type	handle_linger, @function
handle_linger:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4128, %rsp
	movq	%rdi, -4120(%rbp)
	movq	%rsi, -4128(%rbp)
	movq	-4120(%rbp), %rax
	movq	8(%rax), %rax
	movl	704(%rax), %eax
	leaq	-4112(%rbp), %rcx
	movl	$4096, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jns	.L269
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L268
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$11, %eax
	je	.L268
.L269:
	cmpl	$0, -4(%rbp)
	jg	.L268
	movq	-4128(%rbp), %rdx
	movq	-4120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	really_clear_connection
.L268:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	handle_linger, .-handle_linger
	.section	.rodata
	.align 8
.LC121:
	.string	"throttle sending count was negative - shouldn't happen!"
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
	movl	$0, 56(%rax)
	movq	-40(%rbp), %rax
	movq	$-1, 72(%rax)
	movq	-40(%rbp), %rax
	movq	72(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 64(%rax)
	movl	$0, -20(%rbp)
	jmp	.L274
.L284:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	240(%rax), %rcx
	movq	throttles(%rip), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movq	(%rax), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	match
	testl	%eax, %eax
	je	.L275
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	24(%rax), %rcx
	movq	throttles(%rip), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movq	8(%rax), %rax
	addq	%rax, %rax
	cmpq	%rax, %rcx
	jle	.L276
	movl	$0, %eax
	jmp	.L277
.L276:
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	24(%rax), %rcx
	movq	throttles(%rip), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movq	16(%rax), %rax
	cmpq	%rax, %rcx
	jge	.L278
	movl	$0, %eax
	jmp	.L277
.L278:
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	40(%rax), %eax
	testl	%eax, %eax
	jns	.L279
	movl	$.LC121, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	$0, 40(%rax)
.L279:
	movq	-40(%rbp), %rax
	movl	56(%rax), %eax
	leal	1(%rax), %ecx
	movq	-40(%rbp), %rdx
	movl	%ecx, 56(%rdx)
	movq	-40(%rbp), %rdx
	cltq
	leaq	4(%rax), %rcx
	movl	-20(%rbp), %eax
	movl	%eax, (%rdx,%rcx,4)
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	40(%rax), %edx
	addl	$1, %edx
	movl	%edx, 40(%rax)
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rcx
	movq	throttles(%rip), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movl	40(%rax), %eax
	movslq	%eax, %rbx
	movq	%rcx, %rax
	cqto
	idivq	%rbx
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rax
	movq	64(%rax), %rax
	cmpq	$-1, %rax
	jne	.L280
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 64(%rax)
	jmp	.L281
.L280:
	movq	-40(%rbp), %rax
	movq	64(%rax), %rdx
	movq	-32(%rbp), %rax
	cmpq	%rax, %rdx
	cmovg	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 64(%rax)
.L281:
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rax
	movq	72(%rax), %rax
	cmpq	$-1, %rax
	jne	.L282
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 72(%rax)
	jmp	.L275
.L282:
	movq	-40(%rbp), %rax
	movq	72(%rax), %rdx
	movq	-32(%rbp), %rax
	cmpq	%rax, %rdx
	cmovl	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 72(%rax)
.L275:
	addl	$1, -20(%rbp)
.L274:
	movl	numthrottles(%rip), %eax
	cmpl	%eax, -20(%rbp)
	jge	.L283
	movq	-40(%rbp), %rax
	movl	56(%rax), %eax
	cmpl	$9, %eax
	jle	.L284
.L283:
	movl	$1, %eax
.L277:
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
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L286
.L287:
	movq	throttles(%rip), %rcx
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
	movl	40(%rax), %edx
	subl	$1, %edx
	movl	%edx, 40(%rax)
	addl	$1, -4(%rbp)
.L286:
	movq	-24(%rbp), %rax
	movl	56(%rax), %eax
	cmpl	-4(%rbp), %eax
	jg	.L287
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	clear_throttles, .-clear_throttles
	.section	.rodata
	.align 8
.LC122:
	.string	"throttle #%d '%.80s' rate %ld greatly exceeding limit %ld; %d sending"
	.align 8
.LC123:
	.string	"throttle #%d '%.80s' rate %ld exceeding limit %ld; %d sending"
	.align 8
.LC124:
	.string	"throttle #%d '%.80s' rate %ld lower than minimum %ld; %d sending"
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
	movl	$0, -20(%rbp)
	jmp	.L289
.L293:
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rsi
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	24(%rax), %rax
	leaq	(%rax,%rax), %rdi
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	32(%rax), %rax
	movq	%rax, %rdx
	shrq	$63, %rdx
	addq	%rdx, %rax
	sarq	%rax
	leaq	(%rdi,%rax), %rcx
	movabsq	$6148914691236517206, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, 24(%rsi)
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	$0, 32(%rax)
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	24(%rax), %rcx
	movq	throttles(%rip), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movq	8(%rax), %rax
	cmpq	%rax, %rcx
	jle	.L290
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	40(%rax), %eax
	testl	%eax, %eax
	je	.L290
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	24(%rax), %rcx
	movq	throttles(%rip), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movq	8(%rax), %rax
	addq	%rax, %rax
	cmpq	%rax, %rcx
	jle	.L291
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	40(%rax), %ecx
	movq	throttles(%rip), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movq	8(%rax), %rdi
	movq	throttles(%rip), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movq	24(%rax), %rsi
	movq	throttles(%rip), %r8
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%r8, %rax
	movq	(%rax), %rdx
	movl	-20(%rbp), %eax
	movl	%ecx, (%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rdx, %rcx
	movl	%eax, %edx
	movl	$.LC122, %esi
	movl	$5, %edi
	movl	$0, %eax
	call	syslog
	jmp	.L290
.L291:
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	40(%rax), %ecx
	movq	throttles(%rip), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movq	8(%rax), %rdi
	movq	throttles(%rip), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movq	24(%rax), %rsi
	movq	throttles(%rip), %r8
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%r8, %rax
	movq	(%rax), %rdx
	movl	-20(%rbp), %eax
	movl	%ecx, (%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rdx, %rcx
	movl	%eax, %edx
	movl	$.LC123, %esi
	movl	$6, %edi
	movl	$0, %eax
	call	syslog
.L290:
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	24(%rax), %rcx
	movq	throttles(%rip), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movq	16(%rax), %rax
	cmpq	%rax, %rcx
	jge	.L292
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	40(%rax), %eax
	testl	%eax, %eax
	je	.L292
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	40(%rax), %ecx
	movq	throttles(%rip), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movq	16(%rax), %rdi
	movq	throttles(%rip), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movq	24(%rax), %rsi
	movq	throttles(%rip), %r8
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%r8, %rax
	movq	(%rax), %rdx
	movl	-20(%rbp), %eax
	movl	%ecx, (%rsp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rdx, %rcx
	movl	%eax, %edx
	movl	$.LC124, %esi
	movl	$5, %edi
	movl	$0, %eax
	call	syslog
.L292:
	addl	$1, -20(%rbp)
.L289:
	movl	numthrottles(%rip), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L293
	movl	$0, -28(%rbp)
	jmp	.L294
.L301:
	movq	connects(%rip), %rcx
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$2, %eax
	je	.L295
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$3, %eax
	jne	.L296
.L295:
	movq	-40(%rbp), %rax
	movq	$-1, 64(%rax)
	movl	$0, -24(%rbp)
	jmp	.L297
.L300:
	movq	-40(%rbp), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	addq	$4, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%eax, -20(%rbp)
	movq	throttles(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rcx
	movq	throttles(%rip), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movl	40(%rax), %eax
	movslq	%eax, %rbx
	movq	%rcx, %rax
	cqto
	idivq	%rbx
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	64(%rax), %rax
	cmpq	$-1, %rax
	jne	.L298
	movq	-40(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 64(%rax)
	jmp	.L299
.L298:
	movq	-40(%rbp), %rax
	movq	64(%rax), %rdx
	movq	-48(%rbp), %rax
	cmpq	%rax, %rdx
	cmovg	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 64(%rax)
.L299:
	addl	$1, -24(%rbp)
.L297:
	movq	-40(%rbp), %rax
	movl	56(%rax), %eax
	cmpl	-24(%rbp), %eax
	jg	.L300
.L296:
	addl	$1, -28(%rbp)
.L294:
	movl	max_connects(%rip), %eax
	cmpl	%eax, -28(%rbp)
	jl	.L301
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
.LC125:
	.string	"replacing non-null linger_timer!"
	.align 8
.LC126:
	.string	"tmr_create(linger_clear_connection) failed"
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
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	96(%rax), %rax
	testq	%rax, %rax
	je	.L304
	movq	-24(%rbp), %rax
	movq	96(%rax), %rax
	movq	%rax, %rdi
	call	tmr_cancel
	movq	-24(%rbp), %rax
	movq	$0, 96(%rax)
.L304:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$4, %eax
	jne	.L305
	movq	-24(%rbp), %rax
	movq	104(%rax), %rax
	movq	%rax, %rdi
	call	tmr_cancel
	movq	-24(%rbp), %rax
	movq	$0, 104(%rax)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	$0, 556(%rax)
.L305:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	556(%rax), %eax
	testl	%eax, %eax
	je	.L306
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$3, %eax
	je	.L307
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	704(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
.L307:
	movq	-24(%rbp), %rax
	movl	$4, (%rax)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	704(%rax), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	shutdown
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	704(%rax), %eax
	movq	-24(%rbp), %rcx
	movl	$0, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	fdwatch_add_fd
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	104(%rax), %rax
	testq	%rax, %rax
	je	.L308
	movl	$.LC125, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	syslog
.L308:
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	$0, %r8d
	movl	$500, %ecx
	movl	$linger_clear_connection, %esi
	movq	%rax, %rdi
	call	tmr_create
	movq	-24(%rbp), %rdx
	movq	%rax, 104(%rdx)
	movq	-24(%rbp), %rax
	movq	104(%rax), %rax
	testq	%rax, %rax
	jne	.L303
	movl	$.LC126, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	syslog
	movl	$1, %edi
	call	exit
.L306:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	really_clear_connection
.L303:
	leave
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
	movq	8(%rax), %rax
	movq	200(%rax), %rdx
	movq	stats_bytes(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, stats_bytes(%rip)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$3, %eax
	je	.L311
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	704(%rax), %eax
	movl	%eax, %edi
	call	fdwatch_del_fd
.L311:
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
	movq	104(%rax), %rax
	testq	%rax, %rax
	je	.L312
	movq	-8(%rbp), %rax
	movq	104(%rax), %rax
	movq	%rax, %rdi
	call	tmr_cancel
	movq	-8(%rbp), %rax
	movq	$0, 104(%rax)
.L312:
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	movl	first_free_connect(%rip), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 4(%rax)
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
	.align 8
.LC127:
	.string	"%.80s connection timed out reading"
	.align 8
.LC128:
	.string	"%.80s connection timed out sending"
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
	movl	$0, -4(%rbp)
	jmp	.L314
.L320:
	movq	connects(%rip), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	.L316
	cmpl	$1, %eax
	jl	.L315
	cmpl	$3, %eax
	jg	.L315
	jmp	.L321
.L316:
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	88(%rax), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cmpq	$59, %rax
	jle	.L318
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	httpd_ntoa
	movq	%rax, %rdx
	movl	$.LC127, %esi
	movl	$6, %edi
	movl	$0, %eax
	call	syslog
	movq	httpd_err408form(%rip), %rcx
	movq	httpd_err408title(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movl	$.LC45, %r9d
	movq	%rcx, %r8
	movl	$.LC45, %ecx
	movl	$408, %esi
	movq	%rax, %rdi
	call	httpd_send_err
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	finish_connection
	jmp	.L315
.L318:
	jmp	.L315
.L321:
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	88(%rax), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cmpq	$299, %rax
	jle	.L319
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	httpd_ntoa
	movq	%rax, %rdx
	movl	$.LC128, %esi
	movl	$6, %edi
	movl	$0, %eax
	call	syslog
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	clear_connection
	jmp	.L322
.L319:
.L322:
	nop
.L315:
	addl	$1, -4(%rbp)
.L314:
	movl	max_connects(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L320
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
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, 96(%rax)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$3, %eax
	jne	.L323
	movq	-8(%rbp), %rax
	movl	$2, (%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	704(%rax), %eax
	movq	-8(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	fdwatch_add_fd
.L323:
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
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
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
	.align 8
.LC129:
	.string	"up %ld seconds, stats for %ld seconds:"
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
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L329
	leaq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	leaq	-48(%rbp), %rax
	movq	%rax, -56(%rbp)
.L329:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	start_time(%rip), %rax
	movq	-16(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -24(%rbp)
	movq	stats_time(%rip), %rax
	movq	-16(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L330
	movq	$1, -8(%rbp)
.L330:
	movq	-16(%rbp), %rax
	movq	%rax, stats_time(%rip)
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$.LC129, %esi
	movl	$6, %edi
	movl	$0, %eax
	call	syslog
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	thttpd_logstats
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	httpd_logstats
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	mmc_logstats
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fdwatch_logstats
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	tmr_logstats
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	logstats, .-logstats
	.section	.rodata
	.align 8
.LC130:
	.string	"  thttpd - %ld connections (%g/sec), %d max simultaneous, %lld bytes (%g/sec), %d httpd_conns allocated"
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
	jle	.L332
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
	movl	$.LC130, %esi
	movl	$6, %edi
	movl	$2, %eax
	call	syslog
.L332:
	movq	$0, stats_connections(%rip)
	movq	$0, stats_bytes(%rip)
	movl	$0, stats_simultaneous(%rip)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	thttpd_logstats, .-thttpd_logstats
	.ident	"GCC: (GNU) 4.8.3 20140911 (Red Hat 4.8.3-9)"
	.section	.note.GNU-stack,"",@progbits

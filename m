Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930E6427F66
	for <lists+linux-doc@lfdr.de>; Sun, 10 Oct 2021 08:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhJJGwN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 10 Oct 2021 02:52:13 -0400
Received: from ivanoab7.miniserver.com ([37.128.132.42]:38016 "EHLO
        www.kot-begemot.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhJJGwM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 10 Oct 2021 02:52:12 -0400
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6] helo=jain.kot-begemot.co.uk)
        by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <anton.ivanov@cambridgegreys.com>)
        id 1mZSem-0007Os-Nb; Sun, 10 Oct 2021 06:50:03 +0000
Received: from madding.kot-begemot.co.uk ([192.168.3.98])
        by jain.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <anton.ivanov@cambridgegreys.com>)
        id 1mZSej-0001wy-QH; Sun, 10 Oct 2021 07:50:00 +0100
Subject: Re: [PATCH] docs: UML: user_mode_linux_howto_v2 edits
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
        linux-um@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <20211010064827.3405-1-rdunlap@infradead.org>
From:   Anton Ivanov <anton.ivanov@cambridgegreys.com>
Organization: Cambridge Greys
Message-ID: <3cda2a03-b9be-8bb2-3147-4196716f55a8@cambridgegreys.com>
Date:   Sun, 10 Oct 2021 07:49:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211010064827.3405-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/10/2021 07:48, Randy Dunlap wrote:
> Fix various typos, command syntax, punctuation, capitalization,
> and whitespace.
> 
> Fixes: 04301bf5b072 ("docs: replace the old User Mode Linux HowTo with a new one")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jeff Dike <jdike@addtoit.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: linux-um@lists.infradead.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>   Documentation/virt/uml/user_mode_linux_howto_v2.rst |  119 +++++-----
>   1 file changed, 62 insertions(+), 57 deletions(-)
> 
> --- linux-next-20211007.orig/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> +++ linux-next-20211007/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> @@ -128,7 +128,7 @@ Create a minimal OS installation on the
>   debootstrap does not set up the root password, fstab, hostname or
>   anything related to networking. It is up to the user to do that.
>   
> -Set the root password -t he easiest way to do that is to chroot into the
> +Set the root password - the easiest way to do that is to chroot into the
>   mounted image::
>   
>      # chroot /mnt
> @@ -144,7 +144,7 @@ will be empty and it needs an entry for
>      /dev/ubd0   ext4    discard,errors=remount-ro  0       1
>   
>   The image hostname will be set to the same as the host on which you
> -are creating it image. It is a good idea to change that to avoid
> +are creating its image. It is a good idea to change that to avoid
>   "Oh, bummer, I rebooted the wrong machine".
>   
>   UML supports two classes of network devices - the older uml_net ones
> @@ -162,7 +162,7 @@ need entries like::
>   
>      # vector UML network devices
>      auto vec0
> -   iface eth0 inet dhcp
> +   iface vec0 inet dhcp
>   
>   We now have a UML image which is nearly ready to run, all we need is a
>   UML kernel and modules for it.
> @@ -179,7 +179,12 @@ directory to the mounted UML filesystem:
>   If you have compiled your own kernel, you need to use the usual "install
>   modules to a location" procedure by running::
>   
> -  # make install MODULES_DIR=/mnt/lib/modules
> +  # make INSTALL_MOD_PATH=/mnt/lib/modules modules_install
> +
> +This will install modules into /mnt/lib/modules/$(KERNELRELEASE).
> +To specify the full module installation path, use::
> +
> +  # make MODLIB=/mnt/lib/modules modules_install
>   
>   At this point the image is ready to be brought up.
>   
> @@ -188,7 +193,7 @@ Setting Up UML Networking
>   *************************
>   
>   UML networking is designed to emulate an Ethernet connection. This
> -connection may be either a point-to-point (similar to a connection
> +connection may be either point-to-point (similar to a connection
>   between machines using a back-to-back cable) or a connection to a
>   switch. UML supports a wide variety of means to build these
>   connections to all of: local machine, remote machine(s), local and
> @@ -231,7 +236,7 @@ remote UML and other VM instances.
>   * All transports which have multi-packet rx and/or tx can deliver pps
>     rates of up to 1Mps or more.
>   
> -* All legacy transports are generally limited to ~600-700MBit and 0.05Mps
> +* All legacy transports are generally limited to ~600-700MBit and 0.05Mps.
>   
>   * GRE and L2TPv3 allow connections to all of: local machine, remote
>     machines, remote network devices and remote UML instances.
> @@ -255,7 +260,7 @@ raw sockets where needed.
>   
>   This can be achieved by granting the user a particular capability instead
>   of running UML as root.  In case of vector transport, a user can add the
> -capability ``CAP_NET_ADMIN`` or ``CAP_NET_RAW``, to the uml binary.
> +capability ``CAP_NET_ADMIN`` or ``CAP_NET_RAW`` to the uml binary.
>   Thenceforth, UML can be run with normal user privilges, along with
>   full networking.
>   
> @@ -286,7 +291,7 @@ These options are common for all transpo
>   
>   * ``mac=XX:XX:XX:XX:XX`` - sets the interface MAC address value.
>   
> -* ``gro=[0,1]`` - sets GRO on or off. Enables receive/transmit offloads.
> +* ``gro=[0,1]`` - sets GRO off or on. Enables receive/transmit offloads.
>     The effect of this option depends on the host side support in the transport
>     which is being configured. In most cases it will enable TCP segmentation and
>     RX/TX checksumming offloads. The setting must be identical on the host side
> @@ -301,7 +306,7 @@ These options are common for all transpo
>   * ``headroom=int`` - adjusts the default headroom (32 bytes) reserved
>     if a packet will need to be re-encapsulated into for instance VXLAN.
>   
> -* ``vec=0`` - disable multipacket io and fall back to packet at a
> +* ``vec=0`` - disable multipacket IO and fall back to packet at a
>     time mode
>   
>   Shared Options
> @@ -331,7 +336,7 @@ Example::
>   This will connect vec0 to tap0 on the host. Tap0 must already exist (for example
>   created using tunctl) and UP.
>   
> -tap0 can be configured as a point-to-point interface and given an ip
> +tap0 can be configured as a point-to-point interface and given an IP
>   address so that UML can talk to the host. Alternatively, it is possible
>   to connect UML to a tap interface which is connected to a bridge.
>   
> @@ -358,7 +363,7 @@ Example::
>   
>   This is an experimental/demo transport which couples tap for transmit
>   and a raw socket for receive. The raw socket allows multi-packet
> -receive resulting in significantly higher packet rates than normal tap
> +receive resulting in significantly higher packet rates than normal tap.
>   
>   Privileges required: hybrid requires ``CAP_NET_RAW`` capability by
>   the UML user as well as the requirements for the tap transport.
> @@ -426,10 +431,10 @@ This will configure an Ethernet over ``G
>   endpoint at host dst_host. ``GRE`` supports the following additional
>   options:
>   
> -* ``rx_key=int`` - GRE 32 bit integer key for rx packets, if set,
> +* ``rx_key=int`` - GRE 32-bit integer key for rx packets, if set,
>     ``txkey`` must be set too
>   
> -* ``tx_key=int`` - GRE 32 bit integer key for tx packets, if set
> +* ``tx_key=int`` - GRE 32-bit integer key for tx packets, if set
>     ``rx_key`` must be set too
>   
>   * ``sequence=[0,1]`` - enable GRE sequence
> @@ -444,12 +449,12 @@ options:
>   
>   GRE has a number of caveats:
>   
> -* You can use only one GRE connection per ip address. There is no way to
> +* You can use only one GRE connection per IP address. There is no way to
>     multiplex connections as each GRE tunnel is terminated directly on
>     the UML instance.
>   
>   * The key is not really a security feature. While it was intended as such
> -  it's "security" is laughable. It is, however, a useful feature to
> +  its "security" is laughable. It is, however, a useful feature to
>     ensure that the tunnel is not misconfigured.
>   
>   An example configuration for a Linux host with a local address of
> @@ -489,22 +494,22 @@ the L2TPv3 UDP flavour and UDP destinati
>   
>   L2TPv3 always requires the following additional options:
>   
> -* ``rx_session=int`` - l2tpv3 32 bit integer session for rx packets
> +* ``rx_session=int`` - l2tpv3 32-bit integer session for rx packets
>   
> -* ``tx_session=int`` - l2tpv3 32 bit integer session for tx packets
> +* ``tx_session=int`` - l2tpv3 32-bit integer session for tx packets
>   
>   As the tunnel is fixed these are not negotiated and they are
>   preconfigured on both ends.
>   
> -Additionally, L2TPv3 supports the following optional parameters
> +Additionally, L2TPv3 supports the following optional parameters.
>   
> -* ``rx_cookie=int`` - l2tpv3 32 bit integer cookie for rx packets - same
> +* ``rx_cookie=int`` - l2tpv3 32-bit integer cookie for rx packets - same
>     functionality as GRE key, more to prevent misconfiguration than provide
>     actual security
>   
> -* ``tx_cookie=int`` - l2tpv3 32 bit integer cookie for tx packets
> +* ``tx_cookie=int`` - l2tpv3 32-bit integer cookie for tx packets
>   
> -* ``cookie64=[0,1]`` - use 64 bit cookies instead of 32 bit.
> +* ``cookie64=[0,1]`` - use 64-bit cookies instead of 32-bit.
>   
>   * ``counter=[0,1]`` - enable l2tpv3 counter
>   
> @@ -518,12 +523,12 @@ Additionally, L2TPv3 supports the follow
>   
>   L2TPv3 has a number of caveats:
>   
> -* you can use only one connection per ip address in raw mode. There is
> +* you can use only one connection per IP address in raw mode. There is
>     no way to multiplex connections as each L2TPv3 tunnel is terminated
>     directly on the UML instance. UDP mode can use different ports for
>     this purpose.
>   
> -Here is an example of how to configure a linux host to connect to UML
> +Here is an example of how to configure a Linux host to connect to UML
>   via L2TPv3:
>   
>   **/etc/network/interfaces**::
> @@ -586,7 +591,7 @@ distribution or a custom built kernel ha
>   These add an executable called linux to the system. This is the UML
>   kernel. It can be run just like any other executable.
>   It will take most normal linux kernel arguments as command line
> -arguments.  Additionally, it will need some UML specific arguments
> +arguments.  Additionally, it will need some UML-specific arguments
>   in order to do something useful.
>   
>   Arguments
> @@ -595,7 +600,7 @@ Arguments
>   Mandatory Arguments:
>   --------------------
>   
> -* ``mem=int[K,M,G]`` - amount of memory. By default bytes. It will
> +* ``mem=int[K,M,G]`` - amount of memory. By default in bytes. It will
>     also accept K, M or G qualifiers.
>   
>   * ``ubdX[s,d,c,t]=`` virtual disk specification. This is not really
> @@ -603,7 +608,7 @@ Mandatory Arguments:
>     specify a root file system.
>     The simplest possible image specification is the name of the image
>     file for the filesystem (created using one of the methods described
> -  in `Creating an image`_)
> +  in `Creating an image`_).
>   
>     * UBD devices support copy on write (COW). The changes are kept in
>       a separate file which can be discarded allowing a rollback to the
> @@ -613,15 +618,15 @@ Mandatory Arguments:
>   
>     * UBD devices can be set to use synchronous IO. Any writes are
>       immediately flushed to disk. This is done by adding ``s`` after
> -    the ``ubdX`` specification
> +    the ``ubdX`` specification.
>   
> -  * UBD performs some euristics on devices specified as a single
> +  * UBD performs some heuristics on devices specified as a single
>       filename to make sure that a COW file has not been specified as
> -    the image. To turn them off, use the ``d`` flag after ``ubdX``
> +    the image. To turn them off, use the ``d`` flag after ``ubdX``.
>   
>     * UBD supports TRIM - asking the Host OS to reclaim any unused
>       blocks in the image. To turn it off, specify the ``t`` flag after
> -    ``ubdX``
> +    ``ubdX``.
>   
>   * ``root=`` root device - most likely ``/dev/ubd0`` (this is a Linux
>     filesystem image)
> @@ -631,7 +636,7 @@ Important Optional Arguments
>   
>   If UML is run as "linux" with no extra arguments, it will try to start an
>   xterm for every console configured inside the image (up to 6 in most
> -linux distributions). Each console is started inside an
> +Linux distributions). Each console is started inside an
>   xterm. This makes it nice and easy to use UML on a host with a GUI. It is,
>   however, the wrong approach if UML is to be used as a testing harness or run
>   in a text-only environment.
> @@ -656,10 +661,10 @@ one is input, the second one output.
>   * The null channel - Discard all input or output. Example ``con=null`` will set
>     all consoles to null by default.
>   
> -* The fd channel - use file descriptor numbers for input/out. Example:
> +* The fd channel - use file descriptor numbers for input/output. Example:
>     ``con1=fd:0,fd:1.``
>   
> -* The port channel - listen on tcp port number. Example: ``con1=port:4321``
> +* The port channel - listen on TCP port number. Example: ``con1=port:4321``
>   
>   * The pty and pts channels - use system pty/pts.
>   
> @@ -667,7 +672,7 @@ one is input, the second one output.
>     will make UML use the host 8th console (usually unused).
>   
>   * The xterm channel - this is the default - bring up an xterm on this channel
> -  and direct IO to it. Note, that in order for xterm to work, the host must
> +  and direct IO to it. Note that in order for xterm to work, the host must
>     have the UML distribution package installed. This usually contains the
>     port-helper and other utilities needed for UML to communicate with the xterm.
>     Alternatively, these need to be complied and installed from source. All
> @@ -685,7 +690,7 @@ We can now run UML.
>       vec0:transport=tap,ifname=tap0,depth=128,gro=1 \
>       root=/dev/ubda con=null con0=null,fd:2 con1=fd:0,fd:1
>   
> -This will run an instance with ``2048M RAM``, try to use the image file
> +This will run an instance with ``2048M RAM`` and try to use the image file
>   called ``Filesystem.img`` as root. It will connect to the host using tap0.
>   All consoles except ``con1`` will be disabled and console 1 will
>   use standard input/output making it appear in the same terminal it was started.
> @@ -702,7 +707,7 @@ The UML Management Console
>   ============================
>   
>   In addition to managing the image from "the inside" using normal sysadmin tools,
> -it is possible to perform a number of low level operations using the UML
> +it is possible to perform a number of low-level operations using the UML
>   management console. The UML management console is a low-level interface to the
>   kernel on a running UML instance, somewhat like the i386 SysRq interface. Since
>   there is a full-blown operating system under UML, there is much greater
> @@ -726,7 +731,7 @@ kernel.  When you boot UML, you'll see a
>   
>      mconsole initialized on /home/jdike/.uml/umlNJ32yL/mconsole
>   
> -If you specify a unique machine id one the UML command line, i.e.
> +If you specify a unique machine id on the UML command line, i.e.
>   ``umid=debian``, you'll see this::
>   
>      mconsole initialized on /home/jdike/.uml/debian/mconsole
> @@ -881,11 +886,11 @@ be able to cache the shared data using a
>   so UML disk requests will be served from the host's memory rather than
>   its disks.  There is a major caveat in doing this on multisocket NUMA
>   machines.  On such hardware, running many UML instances with a shared
> -master image and COW changes may caise issues like NMIs from excess of
> +master image and COW changes may cause issues like NMIs from excess of
>   inter-socket traffic.
>   
> -If you are running UML on high end hardware like this, make sure to
> -bind UML to a set of logical cpus residing on the same socket using the
> +If you are running UML on high-end hardware like this, make sure to
> +bind UML to a set of logical CPUs residing on the same socket using the
>   ``taskset`` command or have a look at the "tuning" section.
>   
>   To add a copy-on-write layer to an existing block device file, simply
> @@ -986,7 +991,7 @@ specify a subdirectory to mount with the
>   
>      # mount none /mnt/home -t hostfs -o /home
>   
> -will mount the hosts's /home on the virtual machine's /mnt/home.
> +will mount the host's /home on the virtual machine's /mnt/home.
>   
>   hostfs as the root filesystem
>   -----------------------------
> @@ -1035,7 +1040,7 @@ The UBD driver, SIGIO and the MMU emulat
>   idle, these threads will be migrated to other processors on a SMP host.
>   This, unfortunately, will usually result in LOWER performance because of
>   all of the cache/memory synchronization traffic between cores. As a
> -result, UML will usually benefit from being pinned on a single CPU
> +result, UML will usually benefit from being pinned on a single CPU,
>   especially on a large system. This can result in performance differences
>   of 5 times or higher on some benchmarks.
>   
> @@ -1061,7 +1066,7 @@ filesystems, devices, virtualization, et
>   opportunities to create and test them without being constrained to
>   emulating specific hardware.
>   
> -Example - want to try how linux will work with 4096 "proper" network
> +Example - want to try how Linux will work with 4096 "proper" network
>   devices?
>   
>   Not an issue with UML. At the same time, this is something which
> @@ -1070,10 +1075,10 @@ constrained by the number of devices all
>   they are trying to emulate (for example 16 on a PCI bus in qemu).
>   
>   If you have something to contribute such as a patch, a bugfix, a
> -new feature, please send it to ``linux-um@lists.infradead.org``
> +new feature, please send it to ``linux-um@lists.infradead.org``.
>   
>   Please follow all standard Linux patch guidelines such as cc-ing
> -relevant maintainers and run ``./sripts/checkpatch.pl`` on your patch.
> +relevant maintainers and run ``./scripts/checkpatch.pl`` on your patch.
>   For more details see ``Documentation/process/submitting-patches.rst``
>   
>   Note - the list does not accept HTML or attachments, all emails must
> @@ -1082,21 +1087,21 @@ be formatted as plain text.
>   Developing always goes hand in hand with debugging. First of all,
>   you can always run UML under gdb and there will be a whole section
>   later on on how to do that. That, however, is not the only way to
> -debug a linux kernel. Quite often adding tracing statements and/or
> +debug a Linux kernel. Quite often adding tracing statements and/or
>   using UML specific approaches such as ptracing the UML kernel process
>   are significantly more informative.
>   
>   Tracing UML
>   =============
>   
> -When running UML consists of a main kernel thread and a number of
> +When running, UML consists of a main kernel thread and a number of
>   helper threads. The ones of interest for tracing are NOT the ones
>   that are already ptraced by UML as a part of its MMU emulation.
>   
>   These are usually the first three threads visible in a ps display.
>   The one with the lowest PID number and using most CPU is usually the
>   kernel thread. The other threads are the disk
> -(ubd) device helper thread and the sigio helper thread.
> +(ubd) device helper thread and the SIGIO helper thread.
>   Running ptrace on this thread usually results in the following picture::
>   
>      host$ strace -p 16566
> @@ -1121,21 +1126,21 @@ Running ptrace on this thread usually re
>      --- SIGALRM {si_signo=SIGALRM, si_code=SI_TIMER, si_timerid=0, si_overrun=0, si_value={int=1631716592, ptr=0x614204f0}} ---
>      rt_sigreturn({mask=[PIPE]})             = -1 EINTR (Interrupted system call)
>   
> -This is a typical picture from a mostly idle UML instance
> +This is a typical picture from a mostly idle UML instance.
>   
>   * UML interrupt controller uses epoll - this is UML waiting for IO
>     interrupts:
>   
>      epoll_wait(4, [{EPOLLIN, {u32=3721159424, u64=3721159424}}], 64, 0) = 1
>   
> -* The sequence of ptrace calls is part of MMU emulation and runnin the
> -  UML userspace
> +* The sequence of ptrace calls is part of MMU emulation and running the
> +  UML userspace.
>   * ``timer_settime`` is part of the UML high res timer subsystem mapping
> -  timer requests from inside UML onto the host high resultion timers.
> +  timer requests from inside UML onto the host high resolution timers.
>   * ``clock_nanosleep`` is UML going into idle (similar to the way a PC
>     will execute an ACPI idle).
>   
> -As you can see UML will generate quite a bit of output even in idle.The output
> +As you can see UML will generate quite a bit of output even in idle. The output
>   can be very informative when observing IO. It shows the actual IO calls, their
>   arguments and returns values.
>   
> @@ -1164,14 +1169,14 @@ in order to really leverage UML, one nee
>   userspace code which maps driver concepts onto actual userspace host
>   calls.
>   
> -This forms the so called "user" portion of the driver. While it can
> +This forms the so-called "user" portion of the driver. While it can
>   reuse a lot of kernel concepts, it is generally just another piece of
>   userspace code. This portion needs some matching "kernel" code which
>   resides inside the UML image and which implements the Linux kernel part.
>   
>   *Note: There are very few limitations in the way "kernel" and "user" interact*.
>   
> -UML does not have a strictly defined kernel to host API. It does not
> +UML does not have a strictly defined kernel-to-host API. It does not
>   try to emulate a specific architecture or bus. UML's "kernel" and
>   "user" can share memory, code and interact as needed to implement
>   whatever design the software developer has in mind. The only
> @@ -1180,7 +1185,7 @@ variables having the same names, the dev
>   which includes and libraries they are trying to refer to.
>   
>   As a result a lot of userspace code consists of simple wrappers.
> -F.e. ``os_close_file()`` is just a wrapper around ``close()``
> +E.g. ``os_close_file()`` is just a wrapper around ``close()``
>   which ensures that the userspace function close does not clash
>   with similarly named function(s) in the kernel part.
>   
> @@ -1188,7 +1193,7 @@ Security Considerations
>   -----------------------
>   
>   Drivers or any new functionality should default to not
> -accepting arbitrary filename, bpf code or other  parameters
> +accepting arbitrary filename, bpf code or other parameters
>   which can affect the host from inside the UML instance.
>   For example, specifying the socket used for IPC communication
>   between a driver and the host at the UML command line is OK
> 
> _______________________________________________
> linux-um mailing list
> linux-um@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-um
> 

Acked-By: anton ivanov <anton.ivanov@cambridgegreys.com>

-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/

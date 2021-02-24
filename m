Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E5C32395D
	for <lists+linux-doc@lfdr.de>; Wed, 24 Feb 2021 10:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234632AbhBXJWr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 24 Feb 2021 04:22:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29178 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234565AbhBXJWS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Feb 2021 04:22:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614158449;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ANNI9p05LZijrPFPThfQ5Drw/HDWnXIEvM6w3/vJoT0=;
        b=QH5krGQRUet+GGWuV2/sZCh5bpKekxKpOjM+fp0hBvyiWloLb1uS8Tu1+k9dDkqlFZkrya
        gVnU//QbAiocuUML1kTGMGtL/AV1qMA9+cWXEubyRtzWzQEmYaOibYSLO6Igus8wIeQYwI
        /heBsRhpbLSEsVgFZONr14FyXQV27ws=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-HytEOVAlMfK8WqQC-nFu6w-1; Wed, 24 Feb 2021 04:19:33 -0500
X-MC-Unique: HytEOVAlMfK8WqQC-nFu6w-1
Received: by mail-ed1-f69.google.com with SMTP id w9so562789edi.15
        for <linux-doc@vger.kernel.org>; Wed, 24 Feb 2021 01:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ANNI9p05LZijrPFPThfQ5Drw/HDWnXIEvM6w3/vJoT0=;
        b=WOH0xUFPOW428rrsWNpZGMEjJKCjeSG6SNRFO/rFCB2D5oQaM3J+2tnYmsmABdVdtr
         hHH6GVX4KfNQQwty6dnLet4n6wwebwvaa60IdVgTprN90M/gG/ER8+OkOQH0dSr9W+Dj
         7OOGjSu3festomKV3Aezh4ylkPTmBr8wyf66JNpLjsEP6TrpyTOWX37cf8eNieUqgeZn
         l2digP/mpwixciKqoMOFjPn7ko+hFyTAWQOYYbl09hxwD3eTcWRQ1O1gzQzsepYgtgCS
         kAsdIK0RxzQiqIDtPRIKXIaY2jD1D4wwgGsRacgMLo1cDhSTnUQF4av1iWkbf4mKYUXf
         Ieyw==
X-Gm-Message-State: AOAM530/OPxQ7q8bUfKG+f9LaDthC1kBupbvqqLRichmyVKECRZ1/yHz
        rRs+A4DugeLgidJf/z8vBvq83qhwQcUf61WVGEmqL1/dpRRVBSYjIvi9yCCXI5Fqm+bBTWALMqw
        JXDrXBKS78NhO7Y5cBE5L
X-Received: by 2002:a05:6402:5194:: with SMTP id q20mr10358576edd.267.1614158371574;
        Wed, 24 Feb 2021 01:19:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzNNgGNcgGNFUxw6N5DK3gWDZJtLFbyecjDufhF0bbnQMG6N4XnNBLtKzszmpLWmvQ2UhGMg==
X-Received: by 2002:a05:6402:5194:: with SMTP id q20mr10358544edd.267.1614158371216;
        Wed, 24 Feb 2021 01:19:31 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
        by smtp.gmail.com with ESMTPSA id h12sm1001867edb.70.2021.02.24.01.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 01:19:30 -0800 (PST)
Date:   Wed, 24 Feb 2021 04:19:25 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Adrian Catangiu <acatan@amazon.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org,
        linux-s390@vger.kernel.org, gregkh@linuxfoundation.org,
        graf@amazon.com, rdunlap@infradead.org, arnd@arndb.de,
        ebiederm@xmission.com, rppt@kernel.org, 0x7f454c46@gmail.com,
        borntraeger@de.ibm.com, Jason@zx2c4.com, jannh@google.com,
        w@1wt.eu, colmmacc@amazon.com, luto@kernel.org, tytso@mit.edu,
        ebiggers@kernel.org, dwmw@amazon.co.uk, bonzini@gnu.org,
        sblbir@amazon.com, raduweis@amazon.com, corbet@lwn.net,
        mhocko@kernel.org, rafael@kernel.org, pavel@ucw.cz,
        mpe@ellerman.id.au, areber@redhat.com, ovzxemul@gmail.com,
        avagin@gmail.com, ptikhomirov@virtuozzo.com, gil@azul.com,
        asmehra@redhat.com, dgunigun@redhat.com, vijaysun@ca.ibm.com,
        oridgar@gmail.com, ghammer@redhat.com
Subject: Re: [PATCH v7 1/2] drivers/misc: sysgenid: add system generation id
 driver
Message-ID: <20210224040516-mutt-send-email-mst@kernel.org>
References: <1614156452-17311-1-git-send-email-acatan@amazon.com>
 <1614156452-17311-2-git-send-email-acatan@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614156452-17311-2-git-send-email-acatan@amazon.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 24, 2021 at 10:47:31AM +0200, Adrian Catangiu wrote:
> - Background and problem
> 
> The System Generation ID feature is required in virtualized or
> containerized environments by applications that work with local copies
> or caches of world-unique data such as random values, uuids,
> monotonically increasing counters, etc.
> Such applications can be negatively affected by VM or container
> snapshotting when the VM or container is either cloned or returned to
> an earlier point in time.
> 
> Furthermore, simply finding out about a system generation change is
> only the starting point of a process to renew internal states of
> possibly multiple applications across the system. This process requires
> a standard interface that applications can rely on and through which
> orchestration can be easily done.
> 
> - Solution
> 
> The System Generation ID is meant to help in these scenarios by
> providing a monotonically increasing u32 counter that changes each time
> the VM or container is restored from a snapshot.
> 
> The `sysgenid` driver exposes a monotonic incremental System Generation
> u32 counter via a char-dev filesystem interface accessible
> through `/dev/sysgenid`. It provides synchronous and asynchronous SysGen
> counter update notifications, as well as counter retrieval and
> confirmation mechanisms.
> The counter starts from zero when the driver is initialized and
> monotonically increments every time the system generation changes.
> 
> Userspace applications or libraries can (a)synchronously consume the
> system generation counter through the provided filesystem interface, to
> make any necessary internal adjustments following a system generation
> update.
> 
> The provided filesystem interface operations can be used to build a
> system level safe workflow that guest software can follow to protect
> itself from negative system snapshot effects.
> 
> The `sysgenid` driver exports the `void sysgenid_bump_generation()`
> symbol which can be used by backend drivers to drive system generation
> changes based on hardware events.
> System generation changes can also be driven by userspace software
> through a dedicated driver ioctl.
> 
> **Please note**, SysGenID alone does not guarantee complete snapshot
> safety to applications using it. A certain workflow needs to be
> followed at the system level, in order to make the system
> snapshot-resilient. Please see the "Snapshot Safety Prerequisites"
> section in the included documentation.
> 
> Signed-off-by: Adrian Catangiu <acatan@amazon.com>
> ---
>  Documentation/misc-devices/sysgenid.rst            | 229 +++++++++++++++
>  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
>  MAINTAINERS                                        |   8 +
>  drivers/misc/Kconfig                               |  15 +
>  drivers/misc/Makefile                              |   1 +
>  drivers/misc/sysgenid.c                            | 322 +++++++++++++++++++++
>  include/uapi/linux/sysgenid.h                      |  18 ++
>  7 files changed, 594 insertions(+)
>  create mode 100644 Documentation/misc-devices/sysgenid.rst
>  create mode 100644 drivers/misc/sysgenid.c
>  create mode 100644 include/uapi/linux/sysgenid.h
> 
> diff --git a/Documentation/misc-devices/sysgenid.rst b/Documentation/misc-devices/sysgenid.rst
> new file mode 100644
> index 0000000..0b8199b
> --- /dev/null
> +++ b/Documentation/misc-devices/sysgenid.rst
> @@ -0,0 +1,229 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +========
> +SYSGENID
> +========
> +
> +The System Generation ID feature is required in virtualized or
> +containerized environments by applications that work with local copies
> +or caches of world-unique data such as random values, UUIDs,
> +monotonically increasing counters, etc.
> +Such applications can be negatively affected by VM or container
> +snapshotting when the VM or container is either cloned or returned to
> +an earlier point in time.
> +
> +The System Generation ID is meant to help in these scenarios by
> +providing a monotonically increasing counter that changes each time the
> +VM or container is restored from a snapshot. The driver for it lives at
> +``drivers/misc/sysgenid.c``.
> +
> +The ``sysgenid`` driver exposes a monotonic incremental System
> +Generation u32 counter via a char-dev filesystem interface accessible
> +through ``/dev/sysgenid`` that provides sync and async SysGen counter
> +update notifications. It also provides SysGen counter retrieval and
> +confirmation mechanisms.
> +
> +The counter starts from zero when the driver is initialized and
> +monotonically increments every time the system generation changes.
> +
> +The ``sysgenid`` driver exports the ``void sysgenid_bump_generation()``
> +symbol which can be used by backend drivers to drive system generation
> +changes based on hardware events.
> +System generation changes can also be driven by userspace software
> +through a dedicated driver ioctl.
> +
> +Userspace applications or libraries can (a)synchronously consume the
> +system generation counter through the provided filesystem interface, to
> +make any necessary internal adjustments following a system generation
> +update.
> +
> +**Please note**, SysGenID alone does not guarantee complete snapshot
> +safety to applications using it. A certain workflow needs to be
> +followed at the system level, in order to make the system
> +snapshot-resilient. Please see the "Snapshot Safety Prerequisites"
> +section below.
> +
> +Driver filesystem interface
> +===========================
> +
> +``open()``:
> +  When the device is opened, a copy of the current SysGenID (counter)
> +  is associated with the open file descriptor. Every open file
> +  descriptor will have readable data available (EPOLLIN) while its
> +  current copy of the SysGenID is outdated. Reading from the fd will
> +  provide the latest SysGenID, while writing to the fd will update the
> +  fd-local copy of the SysGenID and is used as a confirmation
> +  mechanism.
> +
> +``read()``:
> +  Read is meant to provide the *new* system generation counter when a
> +  generation change takes place. The read operation blocks until the
> +  associated counter is no longer up to date, at which point the new
> +  counter is provided/returned.  Nonblocking ``read()`` returns
> +  ``EAGAIN`` to signal that there is no *new* counter value available.
> +  The generation counter is considered *new* for each open file
> +  descriptor that hasn't confirmed the new value following a generation
> +  change. Therefore, once a generation change takes place, all
> +  ``read()`` calls will immediately return the new generation counter
> +  and will continue to do so until the new value is confirmed back to
> +  the driver through ``write()``.
> +  Partial reads are not allowed - read buffer needs to be at least
> +  32 bits in size.
> +
> +``write()``:
> +  Write is used to confirm the up-to-date SysGenID counter back to the
> +  driver.
> +  Following a VM generation change, all existing watchers are marked
> +  as *outdated*. Each file descriptor will maintain the *outdated*
> +  status until a ``write()`` containing the new up-to-date generation
> +  counter is used as an update confirmation mechanism.
> +  Partial writes are not allowed - write buffer should be exactly
> +  32 bits in size.
> +
> +``poll()``:
> +  Poll is implemented to allow polling for generation counter updates.
> +  Such updates result in ``EPOLLIN`` polling status until the new
> +  up-to-date counter is confirmed back to the driver through a
> +  ``write()``.
> +
> +``ioctl()``:
> +  The driver also adds support for waiting on open file descriptors
> +  that haven't acknowledged a generation counter update, as well as a
> +  mechanism for userspace to *trigger* a generation update:
> +
> +  - SYSGENID_SET_WATCHER_TRACKING: takes a bool argument to set tracking
> +    status for current file descriptor. When watcher tracking is
> +    enabled, the driver tracks this file descriptor as an independent
> +    *watcher*. The driver keeps accounting of how many watchers have
> +    confirmed the latest Sys-Gen-Id counter and how many of them are
> +    *outdated*; an outdated watcher is a *tracked* open file descriptor
> +    that has lived through a Sys-Gen-Id change but has not yet confirmed
> +    the new generation counter.
> +    Software that wants to be waited on by the system while it adjusts
> +    to generation changes, should turn tracking on. The sysgenid driver
> +    then keeps track of it and can block system-level adjustment process
> +    until the software has finished adjusting and confirmed it through a
> +    ``write()``.
> +    Tracking is disabled by default and file descriptors need to
> +    explicitly opt-in using this IOCTL.
> +  - SYSGENID_WAIT_WATCHERS: blocks until there are no more *outdated*
> +    tracked watchers or, if a ``timeout`` argument is provided, until
> +    the timeout expires.
> +    If the current caller is *outdated* or a generation change happens
> +    while waiting (thus making current caller *outdated*), the ioctl
> +    returns ``-EINTR`` to signal the user to handle event and retry.
> +  - SYSGENID_TRIGGER_GEN_UPDATE: triggers a generation counter increment.
> +    It takes a ``minimum-generation`` argument which represents the
> +    minimum value the generation counter will be set to. For example if
> +    current generation is ``5`` and ``SYSGENID_TRIGGER_GEN_UPDATE(8)``
> +    is called, the generation counter will increment to ``8``.

And what if it's 9?

> +    This IOCTL can only be used by processes with CAP_CHECKPOINT_RESTORE
> +    or CAP_SYS_ADMIN capabilities.
> +
> +``mmap()``:
> +  The driver supports ``PROT_READ, MAP_SHARED`` mmaps of a single page
> +  in size. The first 4 bytes of the mapped page will contain an
> +  up-to-date u32 copy of the system generation counter.
> +  The mapped memory can be used as a low-latency generation counter
> +  probe mechanism in critical sections.
> +  The mmap() interface is targeted at libraries or code that needs to
> +  check for generation changes in-line, where an event loop is not
> +  available or read()/write() syscalls are too expensive.
> +  In such cases, logic can be added in-line with the sensitive code to
> +  check and trigger on-demand/just-in-time readjustments when changes
> +  are detected on the memory mapped generation counter.
> +  Users of this interface that plan to lazily adjust should not enable
> +  watcher tracking, since waiting on them doesn't make sense.
> +
> +``close()``:
> +  Removes the file descriptor as a system generation counter *watcher*.
> +
> +Snapshot Safety Prerequisites
> +=============================
> +
> +If VM, container or other system-level snapshots happen asynchronously,
> +at arbitrary times during an active workload there is no practical way
> +to ensure that in-flight local copies or caches of world-unique data
> +such as random values, secrets, UUIDs, etc are properly scrubbed and
> +regenerated.
> +The challenge stems from the fact that the categorization of data as
> +snapshot-sensitive is only known to the software working with it, and
> +this software has no logical control over the moment in time when an
> +external system snapshot occurs.
> +
> +Let's take an OpenSSL session token for example. Even if the library
> +code is made 100% snapshot-safe, meaning the library guarantees that
> +the session token is unique (any snapshot that happened during the
> +library call did not duplicate or leak the token), the token is still
> +vulnerable to snapshot events while it transits the various layers of
> +the library caller, then the various layers of the OS before leaving
> +the system.
> +
> +To catch a secret while it's in-flight, we'd have to validate system
> +generation at every layer, every step of the way. Even if that would
> +be deemed the right solution, it would be a long road and a whole
> +universe to patch before we get there.
> +
> +Bottom line is we don't have a way to track all of these in-flight
> +secrets and dynamically scrub them from existence with snapshot
> +events happening arbitrarily.

Above should try harder to explan what are the things that need to be
scrubbed and why. For example, I personally don't really know what is
the OpenSSL session token example and what makes it vulnerable. I guess
snapshots can attack each other?




Here's a simple example of a workflow that submits transactions
to a database and wants to avoid duplicate transactions.
This does not require overseer magic. It does however require
a correct genid from hypervisor, so no mmap tricks work.



	int genid, oldgenid;
	read(&genid);
start:
	oldgenid = genid;
	transid = submit transaction
	read(&genid);
	if (genid != oldgenid) {
			revert transaction (transid);
			goto start:
	}






> +Simplifyng assumption - safety prerequisite
> +-------------------------------------------
> +
> +**Control the snapshot flow**, disallow snapshots coming at arbitrary
> +moments in the workload lifetime.
> +
> +Use a system-level overseer entity that quiesces the system before
> +snapshot, and post-snapshot-resume oversees that software components
> +have readjusted to new environment, to the new generation. Only after,
> +will the overseer un-quiesce the system and allow active workloads.
> +
> +Software components can choose whether they want to be tracked and
> +waited on by the overseer by using the ``SYSGENID_SET_WATCHER_TRACKING``
> +IOCTL.
> +
> +The sysgenid framework standardizes the API for system software to
> +find out about needing to readjust and at the same time provides a
> +mechanism for the overseer entity to wait for everyone to be done, the
> +system to have readjusted, so it can un-quiesce.
> +
> +Example snapshot-safe workflow
> +------------------------------
> +
> +1) Before taking a snapshot, quiesce the VM/container/system. Exactly
> +   how this is achieved is very workload-specific, but the general
> +   description is to get all software to an expected state where their
> +   event loops dry up and they are effectively quiesced.

If you have ability to do this by communicating with
all processes e.g. through a unix domain socket,
why do you need the rest of the stuff in the kernel?
Quescing is a harder problem than waking up.

> +2) Take snapshot.
> +3) Resume the VM/container/system from said snapshot.
> +4) SysGenID counter will either automatically increment if there is
> +   a vmgenid backend (hw-driven), or overseer will trigger generation
> +   bump using ``SYSGENID_TRIGGER_GEN_UPDATE`` IOCLT (sw-driven).
> +5) Software components which have ``/dev/sysgenid`` in their event
> +   loops (either using ``poll()`` or ``read()``) are notified of the
> +   generation change.
> +   They do their specific internal adjustments. Some may have requested
> +   to be tracked and waited on by the overseer, others might choose to
> +   do their adjustments out of band and not block the overseer.
> +   Tracked ones *must* signal when they are done/ready with a ``write()``
> +   while the rest *should* also do so for cleanliness, but it's not
> +   mandatory.
> +6) Overseer will block and wait for all tracked watchers by using the
> +   ``SYSGENID_WAIT_WATCHERS`` IOCTL. Once all tracked watchers are done
> +   in step 5, this overseer will return from this blocking ioctl knowing
> +   that the system has readjusted and is ready for active workload.
> +7) Overseer un-quiesces system.
> +8) There is a class of software, usually libraries, most notably PRNGs
> +   or SSLs, that don't fit the event-loop model and also have strict
> +   latency requirements. These can take advantage of the ``mmap()``
> +   interface and lazily adjust on-demand whenever they are called after
> +   un-quiesce.
> +   For a well-designed service stack, these libraries should not be
> +   called while system is quiesced. When workload is resumed by the
> +   overseer, on the first call into these libs, they will safely JIT
> +   readjust.
> +   Users of this lazy on-demand readjustment model should not enable
> +   watcher tracking since doing so would introduce a logical deadlock:
> +   lazy adjustments happen only after un-quiesce, but un-quiesce is
> +   blocked until all tracked watchers are up-to-date.
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index d02ba2f..39f9482 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -357,6 +357,7 @@ Code  Seq#    Include File                                           Comments
>  0xDB  00-0F  drivers/char/mwave/mwavepub.h
>  0xDD  00-3F                                                          ZFCP device driver see drivers/s390/scsi/
>                                                                       <mailto:aherrman@de.ibm.com>
> +0xE4  01-03  uapi/linux/sysgenid.h                                   SysGenID misc driver
>  0xE5  00-3F  linux/fuse.h
>  0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                   ChromeOS EC driver
>  0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                     sisfb (in development)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1d75afa..b812dad8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17261,6 +17261,14 @@ L:	linux-mmc@vger.kernel.org
>  S:	Maintained
>  F:	drivers/mmc/host/sdhci-pci-dwc-mshc.c
>  
> +SYSGENID
> +M:	Adrian Catangiu <acatan@amazon.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Supported
> +F:	Documentation/misc-devices/sysgenid.rst
> +F:	drivers/misc/sysgenid.c
> +F:	include/uapi/linux/sysgenid.h
> +
>  SYSTEM CONFIGURATION (SYSCON)
>  M:	Lee Jones <lee.jones@linaro.org>
>  M:	Arnd Bergmann <arnd@arndb.de>
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index fafa8b0..a2b7cae 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -456,6 +456,21 @@ config PVPANIC
>  	  a paravirtualized device provided by QEMU; it lets a virtual machine
>  	  (guest) communicate panic events to the host.
>  
> +config SYSGENID
> +	tristate "System Generation ID driver"
> +	help
> +	  This is a System Generation ID driver which provides a system
> +	  generation counter. The driver exposes FS ops on /dev/sysgenid
> +	  through which it can provide information and notifications on system
> +	  generation changes that happen because of VM or container snapshots
> +	  or cloning.
> +	  This enables applications and libraries that store or cache
> +	  sensitive information, to know that they need to regenerate it
> +	  after process memory has been exposed to potential copying.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called sysgenid.
> +
>  config HISI_HIKEY_USB
>  	tristate "USB GPIO Hub on HiSilicon Hikey 960/970 Platform"
>  	depends on (OF && GPIOLIB) || COMPILE_TEST
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index d23231e..4b4933d 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -57,3 +57,4 @@ obj-$(CONFIG_HABANA_AI)		+= habanalabs/
>  obj-$(CONFIG_UACCE)		+= uacce/
>  obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
>  obj-$(CONFIG_HISI_HIKEY_USB)	+= hisi_hikey_usb.o
> +obj-$(CONFIG_SYSGENID)		+= sysgenid.o
> diff --git a/drivers/misc/sysgenid.c b/drivers/misc/sysgenid.c
> new file mode 100644
> index 0000000..ace292b
> --- /dev/null
> +++ b/drivers/misc/sysgenid.c
> @@ -0,0 +1,322 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * System Generation ID driver
> + *
> + * Copyright (C) 2020 Amazon. All rights reserved.
> + *
> + *	Authors:
> + *	  Adrian Catangiu <acatan@amazon.com>
> + *
> + */
> +#include <linux/acpi.h>
> +#include <linux/kernel.h>
> +#include <linux/minmax.h>
> +#include <linux/miscdevice.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/poll.h>
> +#include <linux/random.h>
> +#include <linux/uuid.h>
> +#include <linux/sysgenid.h>
> +
> +struct sysgenid_data {
> +	unsigned long		map_buf;
> +	wait_queue_head_t	read_waitq;
> +	atomic_t		generation_counter;
> +
> +	unsigned int		watchers;
> +	atomic_t		outdated_watchers;
> +	wait_queue_head_t	outdated_waitq;
> +	spinlock_t		lock;
> +};
> +static struct sysgenid_data sysgenid_data;
> +
> +struct file_data {
> +	bool tracked_watcher;
> +	int acked_gen_counter;
> +};
> +
> +static int equals_gen_counter(unsigned int counter)
> +{
> +	return counter == atomic_read(&sysgenid_data.generation_counter);
> +}
> +
> +static void _bump_generation(int min_gen)
> +{
> +	unsigned long flags;
> +	int counter;
> +
> +	spin_lock_irqsave(&sysgenid_data.lock, flags);
> +	counter = max(min_gen, 1 + atomic_read(&sysgenid_data.generation_counter));
> +	atomic_set(&sysgenid_data.generation_counter, counter);
> +	*((int *) sysgenid_data.map_buf) = counter;
> +	atomic_set(&sysgenid_data.outdated_watchers, sysgenid_data.watchers);
> +
> +	wake_up_interruptible(&sysgenid_data.read_waitq);
> +	wake_up_interruptible(&sysgenid_data.outdated_waitq);
> +	spin_unlock_irqrestore(&sysgenid_data.lock, flags);
> +}
> +
> +void sysgenid_bump_generation(void)
> +{
> +	_bump_generation(0);
> +}
> +EXPORT_SYMBOL_GPL(sysgenid_bump_generation);
> +
> +static void put_outdated_watchers(void)
> +{
> +	if (atomic_dec_and_test(&sysgenid_data.outdated_watchers))
> +		wake_up_interruptible(&sysgenid_data.outdated_waitq);
> +}
> +
> +static void start_fd_tracking(struct file_data *fdata)
> +{
> +	unsigned long flags;
> +
> +	if (!fdata->tracked_watcher) {
> +		/* enable tracking this fd as a watcher */
> +		spin_lock_irqsave(&sysgenid_data.lock, flags);
> +			fdata->tracked_watcher = 1;
> +			++sysgenid_data.watchers;
> +			if (!equals_gen_counter(fdata->acked_gen_counter))
> +				atomic_inc(&sysgenid_data.outdated_watchers);
> +		spin_unlock_irqrestore(&sysgenid_data.lock, flags);
> +	}
> +}
> +
> +static void stop_fd_tracking(struct file_data *fdata)
> +{
> +	unsigned long flags;
> +
> +	if (fdata->tracked_watcher) {
> +		/* stop tracking this fd as a watcher */
> +		spin_lock_irqsave(&sysgenid_data.lock, flags);
> +		if (!equals_gen_counter(fdata->acked_gen_counter))
> +			put_outdated_watchers();
> +		--sysgenid_data.watchers;
> +		fdata->tracked_watcher = 0;
> +		spin_unlock_irqrestore(&sysgenid_data.lock, flags);
> +	}
> +}
> +
> +static int sysgenid_open(struct inode *inode, struct file *file)
> +{
> +	struct file_data *fdata = kzalloc(sizeof(struct file_data), GFP_KERNEL);
> +
> +	if (!fdata)
> +		return -ENOMEM;
> +	fdata->tracked_watcher = 0;
> +	fdata->acked_gen_counter = atomic_read(&sysgenid_data.generation_counter);
> +	file->private_data = fdata;
> +
> +	return 0;
> +}
> +
> +static int sysgenid_close(struct inode *inode, struct file *file)
> +{
> +	struct file_data *fdata = file->private_data;
> +
> +	stop_fd_tracking(fdata);
> +	kfree(fdata);
> +
> +	return 0;
> +}
> +
> +static ssize_t sysgenid_read(struct file *file, char __user *ubuf,
> +		size_t nbytes, loff_t *ppos)
> +{
> +	struct file_data *fdata = file->private_data;
> +	ssize_t ret;
> +	int gen_counter;
> +
> +	if (nbytes == 0)
> +		return 0;
> +	/* disallow partial reads */
> +	if (nbytes < sizeof(gen_counter))
> +		return -EINVAL;
> +
> +	if (equals_gen_counter(fdata->acked_gen_counter)) {
> +		if (file->f_flags & O_NONBLOCK)
> +			return -EAGAIN;
> +		ret = wait_event_interruptible(
> +			sysgenid_data.read_waitq,
> +			!equals_gen_counter(fdata->acked_gen_counter)
> +		);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	gen_counter = atomic_read(&sysgenid_data.generation_counter);
> +	ret = copy_to_user(ubuf, &gen_counter, sizeof(gen_counter));
> +	if (ret)
> +		return -EFAULT;
> +
> +	return sizeof(gen_counter);
> +}
> +
> +static ssize_t sysgenid_write(struct file *file, const char __user *ubuf,
> +		size_t count, loff_t *ppos)
> +{
> +	struct file_data *fdata = file->private_data;
> +	unsigned int new_acked_gen;
> +	unsigned long flags;
> +
> +	/* disallow partial writes */
> +	if (count != sizeof(new_acked_gen))
> +		return -ENOBUFS;
> +	if (copy_from_user(&new_acked_gen, ubuf, count))
> +		return -EFAULT;
> +
> +	spin_lock_irqsave(&sysgenid_data.lock, flags);
> +	/* wrong gen-counter acknowledged */
> +	if (!equals_gen_counter(new_acked_gen)) {
> +		spin_unlock_irqrestore(&sysgenid_data.lock, flags);
> +		return -EINVAL;
> +	}
> +	/* update acked gen-counter if necessary */
> +	if (!equals_gen_counter(fdata->acked_gen_counter)) {
> +		fdata->acked_gen_counter = new_acked_gen;
> +		if (fdata->tracked_watcher)
> +			put_outdated_watchers();
> +	}
> +	spin_unlock_irqrestore(&sysgenid_data.lock, flags);
> +
> +	return (ssize_t)count;
> +}
> +
> +static __poll_t sysgenid_poll(struct file *file, poll_table *wait)
> +{
> +	__poll_t mask = 0;
> +	struct file_data *fdata = file->private_data;
> +
> +	if (!equals_gen_counter(fdata->acked_gen_counter))
> +		return EPOLLIN | EPOLLRDNORM;
> +
> +	poll_wait(file, &sysgenid_data.read_waitq, wait);
> +
> +	if (!equals_gen_counter(fdata->acked_gen_counter))
> +		mask = EPOLLIN | EPOLLRDNORM;
> +
> +	return mask;
> +}
> +
> +static long sysgenid_ioctl(struct file *file,
> +		unsigned int cmd, unsigned long arg)
> +{
> +	struct file_data *fdata = file->private_data;
> +	bool tracking = !!arg;
> +	unsigned long timeout_ns, min_gen;
> +	ktime_t until;
> +	int ret = 0;
> +
> +	switch (cmd) {
> +	case SYSGENID_SET_WATCHER_TRACKING:
> +		if (tracking)
> +			start_fd_tracking(fdata);
> +		else
> +			stop_fd_tracking(fdata);
> +		break;
> +	case SYSGENID_WAIT_WATCHERS:
> +		timeout_ns = arg * NSEC_PER_MSEC;
> +		until = timeout_ns ? ktime_set(0, timeout_ns) : KTIME_MAX;
> +
> +		ret = wait_event_interruptible_hrtimeout(
> +			sysgenid_data.outdated_waitq,
> +			(!atomic_read(&sysgenid_data.outdated_watchers) ||
> +					!equals_gen_counter(fdata->acked_gen_counter)),
> +			until
> +		);
> +		if (!equals_gen_counter(fdata->acked_gen_counter))
> +			ret = -EINTR;
> +		break;
> +	case SYSGENID_TRIGGER_GEN_UPDATE:
> +		if (!checkpoint_restore_ns_capable(current_user_ns()))
> +			return -EACCES;
> +		min_gen = arg;
> +		_bump_generation(min_gen);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static int sysgenid_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +	struct file_data *fdata = file->private_data;
> +
> +	if (vma->vm_pgoff != 0 || vma_pages(vma) > 1)
> +		return -EINVAL;
> +
> +	if ((vma->vm_flags & VM_WRITE) != 0)
> +		return -EPERM;
> +
> +	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
> +	vma->vm_flags &= ~VM_MAYWRITE;
> +	vma->vm_private_data = fdata;
> +
> +	return vm_insert_page(vma, vma->vm_start,
> +			virt_to_page(sysgenid_data.map_buf));
> +}
> +
> +static const struct file_operations fops = {
> +	.owner		= THIS_MODULE,
> +	.mmap		= sysgenid_mmap,
> +	.open		= sysgenid_open,
> +	.release	= sysgenid_close,
> +	.read		= sysgenid_read,
> +	.write		= sysgenid_write,
> +	.poll		= sysgenid_poll,
> +	.unlocked_ioctl	= sysgenid_ioctl,
> +};
> +
> +static struct miscdevice sysgenid_misc = {
> +	.minor = MISC_DYNAMIC_MINOR,
> +	.name = "sysgenid",
> +	.fops = &fops,
> +};
> +
> +static int __init sysgenid_init(void)
> +{
> +	int ret;
> +
> +	sysgenid_data.map_buf = get_zeroed_page(GFP_KERNEL);
> +	if (!sysgenid_data.map_buf)
> +		return -ENOMEM;
> +
> +	atomic_set(&sysgenid_data.generation_counter, 0);
> +	atomic_set(&sysgenid_data.outdated_watchers, 0);
> +	init_waitqueue_head(&sysgenid_data.read_waitq);
> +	init_waitqueue_head(&sysgenid_data.outdated_waitq);
> +	spin_lock_init(&sysgenid_data.lock);
> +
> +	ret = misc_register(&sysgenid_misc);
> +	if (ret < 0) {
> +		pr_err("misc_register() failed for sysgenid\n");
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	free_pages(sysgenid_data.map_buf, 0);
> +	sysgenid_data.map_buf = 0;
> +
> +	return ret;
> +}
> +
> +static void __exit sysgenid_exit(void)
> +{
> +	misc_deregister(&sysgenid_misc);
> +	free_pages(sysgenid_data.map_buf, 0);
> +	sysgenid_data.map_buf = 0;
> +}
> +
> +module_init(sysgenid_init);
> +module_exit(sysgenid_exit);
> +
> +MODULE_AUTHOR("Adrian Catangiu");
> +MODULE_DESCRIPTION("System Generation ID");
> +MODULE_LICENSE("GPL");
> +MODULE_VERSION("0.1");
> diff --git a/include/uapi/linux/sysgenid.h b/include/uapi/linux/sysgenid.h
> new file mode 100644
> index 0000000..7279df6
> --- /dev/null
> +++ b/include/uapi/linux/sysgenid.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> +
> +#ifndef _UAPI_LINUX_SYSGENID_H
> +#define _UAPI_LINUX_SYSGENID_H
> +
> +#include <linux/ioctl.h>
> +
> +#define SYSGENID_IOCTL			0xE4
> +#define SYSGENID_SET_WATCHER_TRACKING	_IO(SYSGENID_IOCTL, 1)
> +#define SYSGENID_WAIT_WATCHERS		_IO(SYSGENID_IOCTL, 2)
> +#define SYSGENID_TRIGGER_GEN_UPDATE	_IO(SYSGENID_IOCTL, 3)
> +
> +#ifdef __KERNEL__
> +void sysgenid_bump_generation(void);
> +#endif /* __KERNEL__ */
> +
> +#endif /* _UAPI_LINUX_SYSGENID_H */
> +
> -- 
> 2.7.4
> 
> 
> 
> 
> Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in Romania. Registration number J22/2621/2005.


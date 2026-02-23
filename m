Return-Path: <linux-doc+bounces-76588-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHRZGRuAnGmLIgQAu9opvQ
	(envelope-from <linux-doc+bounces-76588-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 17:28:11 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DF2179C5D
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 17:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85EF430158BC
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 16:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1D830BBA9;
	Mon, 23 Feb 2026 16:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="OA8g5Fsu"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1561E285C88;
	Mon, 23 Feb 2026 16:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771863867; cv=none; b=eVGf82v7eKnlo7wuCt+DFw4yC0nQLrmXP/kj5n/MwDDgrytoTxFowryRkCiZQ2EYRDsUsioLj5eiK30GGyL5oF5A9uRacfGKQzVxuq7kXIYDos/R5wMfZX/MwSI+HZGanlD2lZ9wI90Meqp8cxnYbBI43JQPw3yhgSyDUvYp+bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771863867; c=relaxed/simple;
	bh=3EaqyXrZlxHkHcAeMMa175St8Nd2zMLKr9donDkpKC4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZbuzKQraxdehYWzUQ/qTU7w4Ax4YPOFM+aTnKlh+4nKjiUvpBS9Mvr7ayOWZbc7P/Uy+C2FncUcH93qaQOU9kgPKlNRFi0TJfszITMl0TUoLg6u2w5VxGn830/l1ZZTLTjFQl/joqHv2FqSmaTLFTs9pXzo2r5igjcWZnltN1gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=OA8g5Fsu; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1E30240C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771863865; bh=t7sM3K1Ty+i8WepuzWEWgiBTk0vQFqlL/JyNGaeRDCk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OA8g5Fsus5q70X45mckBfeoQdVLnhtZW8Uypz9hH+p79mSBS8gIa2C6kBWIzfJ3V0
	 7sNWJzTOikSruVRi9XZ1KwT3b8N56qcJSIFDFWlTpjOH4oLYGVdcuLeZnFHaRDdGKQ
	 mm8GbqBCJJrvSL5f+DwKM7D3H8jzyAKia5+dpljjEW6HdCMXkPVvaMV3apazeKW+Bh
	 8Tn4sIPWfb86d44rjNVSDEo3Kg3vyAYycYlnnOHXikOCxwnOrL/FpKFZfZ/E8Zi/iW
	 JAtdcBGlcBJbWIcXqndZr/7UapxtsEV6f7LH+t6uC5uOm0z8Y2LcW5aq1FZD4g2u1B
	 UNqBR72NwZ3eQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1E30240C6F;
	Mon, 23 Feb 2026 16:24:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shubham Chakraborty
 <chakrabortyshubham66@gmail.com>
Subject: Re: [PATCH] docs: sysctl: Add documentation for crypto and debug
 sysctls
In-Reply-To: <20260223161051.8448-1-chakrabortyshubham66@gmail.com>
References: <20260223161051.8448-1-chakrabortyshubham66@gmail.com>
Date: Mon, 23 Feb 2026 09:24:24 -0700
Message-ID: <87ecmb77if.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-76588-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:dkim]
X-Rspamd-Queue-Id: B8DF2179C5D
X-Rspamd-Action: no action

Shubham Chakraborty <chakrabortyshubham66@gmail.com> writes:

> The /proc/sys/crypto and /proc/sys/debug directories lacked documentation in the admin-guide. Add RST files covering fips_enabled, fips_name, fips_version, exception-trace, and kprobes-optimization sysctls.

Thanks for working to improve our documentation!  There are a few things
to fix there, though.

- Please wrap your changelog below the 80-column limit.

- You need to included a Signed-off-by line

> ---
>  Documentation/admin-guide/sysctl/crypto.rst | 59 +++++++++++++++++++
>  Documentation/admin-guide/sysctl/debug.rst  | 63 +++++++++++++++++++++
>  Documentation/admin-guide/sysctl/index.rst  |  8 ++-
>  3 files changed, 128 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/admin-guide/sysctl/crypto.rst
>  create mode 100644 Documentation/admin-guide/sysctl/debug.rst
>
> diff --git a/Documentation/admin-guide/sysctl/crypto.rst b/Documentation/admin-guide/sysctl/crypto.rst
> new file mode 100644
> index 000000000..f44a50f68
> --- /dev/null
> +++ b/Documentation/admin-guide/sysctl/crypto.rst
> @@ -0,0 +1,59 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===================================
> +Documentation for /proc/sys/crypto/
> +===================================

I'd take out "Documentation for" - readers know that this is
documentation. 

> +.. See scripts/check-sysctl-docs to keep this up to date:
> +.. scripts/check-sysctl-docs -vtable="crypto" \
> +..         Documentation/admin-guide/sysctl/crypto.rst \
> +..         $(git grep -l register_sysctl_)
> +
> +Copyright (c) 2026, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +
> +For general info and legal blurb, please look in
> +Documentation/admin-guide/sysctl/index.rst.
> +
> +------------------------------------------------------------------------------

Why the "----------------..." line?

Honestly, this stuff might be better placed at the bottom of the file;
it's not what readers of the file will be most interested in.

> +This file contains documentation for the sysctl files in
> +``/proc/sys/crypto/``.

Here, too, the "this file contains" signposting doesn't really need to
be here.

> +The files in this directory can be used to monitor and configure the
> +Linux kernel's cryptographic subsystem.
> +
> +Currently, these files might (depending on your configuration)
> +show up in ``/proc/sys/crypto/``:
> +
> +.. contents:: :local:
> +
> +fips_enabled
> +============
> +
> +This file contains a read-only flag that indicates whether FIPS mode is
> +enabled.
> +
> +- ``0``: FIPS mode is disabled (default).
> +- ``1``: FIPS mode is enabled.
> +
> +This value is set at boot time via the ``fips=1`` kernel command line
> +parameter. When enabled, the cryptographic API will restrict the use
> +of certain algorithms and perform self-tests to ensure compliance with
> +FIPS (Federal Information Processing Standards) requirements, such as
> +FIPS 140-2 and the newer FIPS 140-3, depending on the kernel
> +configuration and the module in use.
> +
> +fips_name
> +=========
> +
> +This read-only file contains the name of the FIPS module currently in use.
> +The value is typically configured via the ``CONFIG_CRYPTO_FIPS_NAME``
> +kernel configuration option.
> +
> +fips_version
> +============
> +
> +This read-only file contains the version string of the FIPS module.
> +If ``CONFIG_CRYPTO_FIPS_CUSTOM_VERSION`` is set, it uses the value from
> +``CONFIG_CRYPTO_FIPS_VERSION``. Otherwise, it defaults to the kernel
> +release version (``UTS_RELEASE``).
> diff --git a/Documentation/admin-guide/sysctl/debug.rst b/Documentation/admin-guide/sysctl/debug.rst
> new file mode 100644
> index 000000000..1a35042b6
> --- /dev/null
> +++ b/Documentation/admin-guide/sysctl/debug.rst
> @@ -0,0 +1,63 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +==================================
> +Documentation for /proc/sys/debug/
> +==================================

Same comments as above apply here.

> +.. See scripts/check-sysctl-docs to keep this up to date:
> +.. scripts/check-sysctl-docs -vtable="debug" \
> +..         Documentation/admin-guide/sysctl/debug.rst \
> +..         $(git grep -l register_sysctl_)
> +
> +Copyright (c) 2026, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +
> +For general info and legal blurb, please look in
> +Documentation/admin-guide/sysctl/index.rst.
> +
> +------------------------------------------------------------------------------
> +
> +This file contains documentation for the sysctl files in
> +``/proc/sys/debug/``.
> +
> +The files in this directory are used to control various debugging
> +features within the Linux kernel.
> +
> +Currently, these files might (depending on your configuration)
> +show up in ``/proc/sys/debug/``:
> +
> +.. contents:: :local:
> +
> +exception-trace
> +===============
> +
> +This flag controls whether the kernel prints information about unhandled
> +signals (like segmentation faults) to the kernel log (``dmesg``).
> +
> +- ``0``: Unhandled signals are not traced.
> +- ``1``: Information about unhandled signals is printed.
> +
> +The default value is ``1`` on most architectures (like x86, MIPS, RISC-V),
> +but it is ``0`` on **arm64**.
> +
> +The actual information printed and the context provided varies
> +significantly depending on the CPU architecture. For example:
> +
> +- On **x86**, it typically prints the instruction pointer (IP), error
> +  code, and address that caused a page fault.
> +- On **PowerPC**, it may print the next instruction pointer (NIP),
> +  link register (LR), and other relevant registers.
> +
> +When enabled, this feature is often rate-limited to prevent the kernel
> +log from being flooded during a crash loop.
> +
> +kprobes-optimization
> +====================
> +
> +This flag enables or disables the optimization of Kprobes on certain
> +architectures (like x86).
> +
> +- ``0``: Kprobes optimization is turned off.
> +- ``1``: Kprobes optimization is turned on (default).
> +
> +For more details on Kprobes and its optimization, please refer to
> +Documentation/trace/kprobes.rst.
> diff --git a/Documentation/admin-guide/sysctl/index.rst b/Documentation/admin-guide/sysctl/index.rst
> index 4dd2c9b5d..8b51edcf8 100644
> --- a/Documentation/admin-guide/sysctl/index.rst
> +++ b/Documentation/admin-guide/sysctl/index.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +

We need to be careful about adding SPDX lines to files we didn't write
ourselves.  It's probably OK here, I doubt there's much copyrightable in
this file.  But, in any case, this is an independent change that needs
to be done separately.

>  ===========================
>  Documentation for /proc/sys
>  ===========================
> @@ -67,8 +69,8 @@ This documentation is about:
>  =============== ===============================================================
>  abi/		execution domains & personalities
>  <$ARCH>		tuning controls for various CPU architecture (e.g. csky, s390)
> -crypto/		<undocumented>
> -debug/		<undocumented>
> +crypto/		cryptographic subsystem
> +debug/		debugging features
>  dev/		device specific information (e.g. dev/cdrom/info)
>  fs/		specific filesystems
>  		filehandle, inode, dentry and quota tuning
> @@ -96,6 +98,8 @@ it :-)
>     :maxdepth: 1
>  
>     abi
> +   crypto
> +   debug
>     fs
>     kernel
>     net
> -- 
> 2.53.0

Thanks,

jon


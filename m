Return-Path: <linux-doc+bounces-8482-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D917184AFCD
	for <lists+linux-doc@lfdr.de>; Tue,  6 Feb 2024 09:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E955287CE6
	for <lists+linux-doc@lfdr.de>; Tue,  6 Feb 2024 08:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF94C12B172;
	Tue,  6 Feb 2024 08:17:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB4F12BE82
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 08:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707207479; cv=none; b=X0bXmstg9TrHLy02/Iitiwrb2IHkBY9jM8v9iW+IRCYkanfoXUFJJ5wKMfdt5usVFpVg+jwjFV1tsuhbbHR3A2BFunglSGx3wL2wfjaB+yv2WhlvKXPa5HnFN8Jax8DhkfzM61nVnVuBiNOu1ews9SeFmfzLgTZ5vEQMqoEvqSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707207479; c=relaxed/simple;
	bh=s450wOfvSBSteTUkLqao8mIdQacIljDGHpPnabtnEdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SuN9WiBnLHqJFgC5JvHnEzvEAEFqmY+PVf4k/rwervVLXU/7jG1R1EmlMupadQxpE8MDVDFt5RWgVFSaigSM4YTBfx12LM+T16BGx3lQb5hKYDytazqMYStYHAL6DXr+1kVrW7Wc49t0b+ymU/HhPBmdGIEuMQr5VU7mDwqwzVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1rXGeE-0002Xs-AM; Tue, 06 Feb 2024 09:17:42 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1rXGe9-004mrs-2o; Tue, 06 Feb 2024 09:17:37 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1rXGe8-00EA9b-38;
	Tue, 06 Feb 2024 09:17:36 +0100
Date: Tue, 6 Feb 2024 09:17:36 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Alexander Graf <graf@amazon.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, x86@kernel.org,
	Eric Biederman <ebiederm@xmission.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	James Gowans <jgowans@amazon.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	arnd@arndb.de, pbonzini@redhat.com, madvenka@linux.microsoft.com,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Usama Arif <usama.arif@bytedance.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 00/17] kexec: Allow preservation of ftrace buffers
Message-ID: <ZcHrIJ7lxpbkm5sc@pengutronix.de>
References: <20240117144704.602-1-graf@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240117144704.602-1-graf@amazon.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

Hi Alexander,

Nice work!

On Wed, Jan 17, 2024 at 02:46:47PM +0000, Alexander Graf wrote:
> Kexec today considers itself purely a boot loader: When we enter the new
> kernel, any state the previous kernel left behind is irrelevant and the
> new kernel reinitializes the system.
> 
> However, there are use cases where this mode of operation is not what we
> actually want. In virtualization hosts for example, we want to use kexec
> to update the host kernel while virtual machine memory stays untouched.
> When we add device assignment to the mix, we also need to ensure that
> IOMMU and VFIO states are untouched. If we add PCIe peer to peer DMA, we
> need to do the same for the PCI subsystem. If we want to kexec while an
> SEV-SNP enabled virtual machine is running, we need to preserve the VM
> context pages and physical memory. See James' and my Linux Plumbers
> Conference 2023 presentation for details:
> 
>   https://lpc.events/event/17/contributions/1485/
> 
> To start us on the journey to support all the use cases above, this
> patch implements basic infrastructure to allow hand over of kernel state
> across kexec (Kexec HandOver, aka KHO). As example target, we use ftrace:
> With this patch set applied, you can read ftrace records from the
> pre-kexec environment in your post-kexec one. This creates a very powerful
> debugging and performance analysis tool for kexec. It's also slightly
> easier to reason about than full blown VFIO state preservation.
> 
> == Alternatives ==
> 
> There are alternative approaches to (parts of) the problems above:
> 
>   * Memory Pools [1] - preallocated persistent memory region + allocator
>   * PRMEM [2] - resizable persistent memory regions with fixed metadata
>                 pointer on the kernel command line + allocator
>   * Pkernfs [3] - preallocated file system for in-kernel data with fixed
>                   address location on the kernel command line
>   * PKRAM [4] - handover of user space pages using a fixed metadata page
>                 specified via command line
> 
> All of the approaches above fundamentally have the same problem: They
> require the administrator to explicitly carve out a physical memory
> location because they have no mechanism outside of the kernel command
> line to pass data (including memory reservations) between kexec'ing
> kernels.
> 
> KHO provides that base foundation. We will determine later whether we
> still need any of the approaches above for fast bulk memory handover of for
> example IOMMU page tables. But IMHO they would all be users of KHO, with
> KHO providing the foundational primitive to pass metadata and bulk memory
> reservations as well as provide easy versioning for data.
> 
> == Overview ==
> 
> We introduce a metadata file that the kernels pass between each other. How
> they pass it is architecture specific. The file's format is a Flattened
> Device Tree (fdt) which has a generator and parser already included in
> Linux. When the root user enables KHO through /sys/kernel/kho/active, the
> kernel invokes callbacks to every driver that supports KHO to serialize
> its state. When the actual kexec happens, the fdt is part of the image
> set that we boot into. In addition, we keep a "scratch region" available
> for kexec: A physically contiguous memory region that is guaranteed to
> not have any memory that KHO would preserve.  The new kernel bootstraps
> itself using the scratch region and sets all handed over memory as in use.
> When drivers initialize that support KHO, they introspect the fdt and
> recover their state from it. This includes memory reservations, where the
> driver can either discard or claim reservations.
> 
> == Limitations ==
> 
> I currently only implemented file based kexec. The kernel interfaces
> in the patch set are already in place to support user space kexec as well,
> but I have not implemented it yet inside kexec tools.
> 
> == How to Use ==
> 
> To use the code, please boot the kernel with the "kho_scratch=" command
> line parameter set: "kho_scratch=512M". KHO requires a scratch region.
> 
> Make sure to fill ftrace with contents that you want to observe after
> kexec.  Then, before you invoke file based "kexec -l", activate KHO:
> 
>   # echo 1 > /sys/kernel/kho/active
>   # kexec -l Image --initrd=initrd -s
>   # kexec -e
> 
> The new kernel will boot up and contain the previous kernel's trace
> buffers in /sys/kernel/debug/tracing/trace.

Assuming:
- we wont to start tracing as early as possible, before rootfs
  or initrd would be able to configure it.
- traces are stored on a different device, not RAM. For example NVMEM.
- Location of NVMEM is different for different board types, but
  bootloader is able to give the right configuration to the kernel.

What would be the best, acceptable for mainline, way to provide this
kind of configuration? At least part of this information do not
describes devices or device states, this would not fit in to devicetree
universe. Amount of possible information would not fit in to bootconfig
too.

Other more or less overlapping use case I have in mind is a netbootable
embedded system with a requirement to boot as fast as possible. Since
bootloader already established a link and got all needed ip
configuration, it would be able to hand over etherent controller and ip
configuration states. Wille be the KHO the way to go for this use case?

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


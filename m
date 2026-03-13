Return-Path: <linux-doc+bounces-79323-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFYsNDQxtGmuigAAu9opvQ
	(envelope-from <linux-doc+bounces-79323-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 16:45:56 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4564B28648A
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 16:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6B8130BB75B
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 15:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F093BED53;
	Fri, 13 Mar 2026 15:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="bxGjZFhV"
X-Original-To: linux-doc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978F03BA221;
	Fri, 13 Mar 2026 15:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416368; cv=none; b=pC2yHCXPsjmBNTnnfJSwqVvVhOvDRJUlQgpEXzgx3ziEmPiCecI+ktCzC/UBr+ogCB17dXodS4XhMDqYY3qTbqQ2QDKEFNqsIbALJFmJ5jhw7ypHgnPjMYBdA7AbkKeV5kSrZ6Mo8FNQqjxwyUA4Ec/cI+98aeUHnp8nk/9UUIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416368; c=relaxed/simple;
	bh=zPBLkwo3Kdwdr+lDCdfgMjvkdspNsuEcGQKpcizSRbs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ivs+FT+KCnEp7EMAO4jZENFeT8DEVNFXSOtcaqRiFsi7Q4hKS+OHLHOcfEsqea540UkzQohQpJCNbcZaM+nda4RL/EolAkEU4A0N5w7RwaXtckH+s5W9oNvfGSdW7iL+21EnbhIRshCErTiIFqTMy5jBdYWt2PWvc4GCYAAVtlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=bxGjZFhV; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from localhost (unknown [40.65.108.177])
	by linux.microsoft.com (Postfix) with ESMTPSA id D661420B710C;
	Fri, 13 Mar 2026 08:39:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D661420B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773416360;
	bh=VVQdnkFvzB/gHBAeEfjDOu3ipWHlOC3d2TtGMa0Nogc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bxGjZFhVAxog3QqvD0UQFk4sXHeeQ5NE2qTFN5kayLXjvmuIDnMGr+7++bUo9CucU
	 ozt1v8CCrq0QALAxMV7zkbSKkHJCrii46ijMqsaPNHRiGsN8elmzY4FJG5Ye5XbnF8
	 qQbz/XGG8TzAcfJfbSL0GA/sFnxPqdXJNavH1QSw=
Date: Fri, 13 Mar 2026 08:39:18 -0700
From: Jacob Pan <jacob.pan@linux.microsoft.com>
To: David Matlack <dmatlack@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Adithya Jayachandran
 <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro
 <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, David Rientjes
 <rientjes@google.com>, Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke
 <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>,
 kexec@lists.infradead.org, kvm@vger.kernel.org, Leon Romanovsky
 <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, =?utf-8?Q?Mich?=
 =?utf-8?Q?a=C5=82?= Winiarski <michal.winiarski@intel.com>, Mike Rapoport
 <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>,
 Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta
 <rananta@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed
 <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Tomita Moeko <tomitamoeko@gmail.com>,
 Vipin Sharma <vipinsh@google.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu
 <yi.l.liu@intel.com>, Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: Re: [PATCH v2 10/22] vfio/pci: Skip reset of preserved device after
 Live Update
Message-ID: <20260313083918.00005731@linux.microsoft.com>
In-Reply-To: <abNOwcOTXqxCxNzt@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
	<20260129212510.967611-11-dmatlack@google.com>
	<20260226170030.5a938c74@shazbot.org>
	<aaDqhjdLyf1qSTSh@google.com>
	<20260227084658.3767d801@shazbot.org>
	<CALzav=fHy23RAzhgkdaL+JA5T2tL9FT6aPgRfXUh7i9zvYCGPA@mail.gmail.com>
	<20260227105720.522ca97f@shazbot.org>
	<CALzav=fjRPa_ZbXu7iFXyemcf_8Kq_dZTWT6c-A0bc6czF_Rdw@mail.gmail.com>
	<abNOwcOTXqxCxNzt@google.com>
Organization: LSG
X-Mailer: Claws Mail 3.21.0 (GTK+ 2.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.microsoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.microsoft.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79323-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[shazbot.org,nvidia.com,amazon.com,fb.com,linux-foundation.org,google.com,kernel.org,ziepe.ca,lwn.net,intel.com,lists.infradead.org,vger.kernel.org,kvack.org,wunner.de,soleen.com,linuxfoundation.org,linux.intel.com,gmail.com,linux.dev];
	RCPT_COUNT_TWELVE(0.00)[44];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacob.pan@linux.microsoft.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.microsoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.microsoft.com:dkim,linux.microsoft.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4564B28648A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David,

On Thu, 12 Mar 2026 23:39:45 +0000
David Matlack <dmatlack@google.com> wrote:

> On 2026-03-09 10:32 AM, David Matlack wrote:
> > On Fri, Feb 27, 2026 at 9:57=E2=80=AFAM Alex Williamson <alex@shazbot.o=
rg>
> > wrote: =20
>=20
> > > Sorry if I don't have the whole model in my head yet, but is
> > > exposing the restriction to the vfio user of the device
> > > sufficient to manage the liveupdate orchestration?  For example,
> > > a VFIO_DEVICE_INFO_CAP pushes the knowledge to QEMU... what does
> > > QEMU do with that knowledge?  Who imposes the policy decision to
> > > decide what support is sufficient? =20
> >=20
> > Hm.. good questions. I don't think we want userspace inspecting bits
> > exposed by the kernel and trying to infer exactly what's being
> > preserved and whether it's "good enough" to use. And such a UAPI
> > would become tech debt once we finish development, I suspect.
> >=20
> > A better approach would be to hide this support from userspace until
> > we decide it is ready for production use-cases.
> >=20
> > To enable development and testing, we can add an opt-in mechanism =20
>=20
> Here is what I am trending towards sending in v3 as the opt-in
> mechanism:
>=20
> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> index 1e82b44bda1a..770231554221 100644
> --- a/drivers/vfio/pci/Kconfig
> +++ b/drivers/vfio/pci/Kconfig
> @@ -58,6 +58,27 @@ config VFIO_PCI_ZDEV_KVM
>  config VFIO_PCI_DMABUF
>         def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER
>=20
> +config VFIO_PCI_LIVEUPDATE
> +       bool "VFIO PCI support for Live Update (EXPERIMENTAL)"
> +       depends on LIVEUPDATE && VFIO_PCI
> +       help
> +         Support for preserving devices bound to vfio-pci across a
> Live
> +         Update. The eventual goal is that preserved devices can run
> +         uninterrupted during a Live Update, including DMA to
> preserved
> +         memory buffers and P2P. However there are many steps still
> needed to
> +         achieve this, including:
> +
> +          - Preservation of iommufd files
> +          - Preservation of IOMMU driver state
In the interim, what do you think about moving forward with noiommu
mode without preserving IOMMU driver state? I=E2=80=99ve tested your
vfio_pci_liveupdate_kexec_test with the noiommu cdev, and it works as
expected.

> +          - Preservation of PCI state (BAR resources, device state,
> ...)
> +          - Preservation of vfio-pci driver state
> +
> +         This option should only be enabled by developers working on
> +         implementing this support. Once enough support has landed
> in the
> +         kernel, this option will no longer be marked EXPERIMENTAL.
> +
> +         If you don't know what to do here, say N.
> +
>  source "drivers/vfio/pci/mlx5/Kconfig"
>=20
>  source "drivers/vfio/pci/hisilicon/Kconfig"



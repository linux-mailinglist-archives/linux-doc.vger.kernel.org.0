Return-Path: <linux-doc+bounces-96389-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cgISFoJxUWoKFAMAu9opvQ
	(envelope-from <linux-doc+bounces-96389-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 11 Jul 2026 00:26:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B196B73F834
	for <lists+linux-doc@lfdr.de>; Sat, 11 Jul 2026 00:26:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=shazbot.org header.s=fm1 header.b=UpR02u8F;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="e msj31n";
	dmarc=pass (policy=none) header.from=shazbot.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96389-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96389-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AA473036631
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 22:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894D1435EE0;
	Fri, 10 Jul 2026 22:23:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD35F3CA4BB;
	Fri, 10 Jul 2026 22:23:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722217; cv=none; b=H1pFhGqPOeeHpSSSlhoQXBlsajdmvmahE2MZQQmmjqKPg1wlgMcNeEta/LJpH/jNXDgkcAYU/DwVdybn3assEVyBfNRFdBONwgFMrD3/RzSlrBfRRQgYL0k9tI+bw/xTrP8IfPR/tzqo/WNjVS7TStY4QEXEJbZVml7DN1jEtq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722217; c=relaxed/simple;
	bh=6XXM8KSG3FL+3M/D5cGYqLDF30wNcMAjyvsq8MhNMtw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ad+8gdQ3TrZ/HEbf6gzwnNVimPTd9/aYjzApXWKcW+65BNVCfqHXEZFXPqNrvhJSkMdXb6aWy8DVisEP+xvfjFVOz56XPvfPQ0mRHUynC8D9+44/NMWVPKfF5UDgCT3azPyotfc0kIcWMAFDMI2v6pQVmfmewfY9HM6NZncwY0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=UpR02u8F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=emsj31n5; arc=none smtp.client-ip=103.168.172.154
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D6B9A1400049;
	Fri, 10 Jul 2026 18:23:33 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 10 Jul 2026 18:23:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783722213;
	 x=1783808613; bh=UaM0lzab9XGylzFI5LXmaxEpfkeYwL4PMvkC1gUQrl4=; b=
	UpR02u8FlFYoDgFmpbgGuD/qozYI1sM1c7s5DG1ofFHZEevBpFf+QG0uLA7OHmNn
	oqoDPLxaNUq31nkVXYXj3rDhUNo+uMG/yQ8qPVUDDLqCAB7KtO6r2m8c5q/u9ogw
	k0J1dzVJAfXEqQ65S+KQIFTLTustghajPzooRYc0vOH2LZYsLyxnlz4P2fGKoZO3
	8erubBW845id3OsyWQVz5V8e9RAQvk7pWt5B8znroeUjCCq+I6Y+DB4mngpl6xqQ
	Pbfe8bSmAqWUslTAUiM6Yj9rRMGx9O+LzR4c6hmGwmex2onOcuA0+AMrT+ANzya2
	dkWqudAZzK7RyUeyeYncmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783722213; x=
	1783808613; bh=UaM0lzab9XGylzFI5LXmaxEpfkeYwL4PMvkC1gUQrl4=; b=e
	msj31n52FDSbiFKZNM/KM38bBZMReNTY+AHwk5X78kdQ8h3/CCl0RlSPmtM1R0C5
	3Q4rPw6O7qe65s2wNgIfrXYdJScL6UtvSdYCRQhSZNOze4vwGZq2AewTL84F5kf6
	krbWvspJ9GQoxISbirZLUoBER8EjrfCC2/rxYCEIzkKeUVeIBviYnoDxmuAt/kLm
	fqydsnDZBuvYRU/s5smrlRblyioq2+A1Q3KWD8PtF24Xb6cdyed1c92iEgRUNxXs
	bdQaT1bmMJ3SAiouHI3w/FG7s7hyqQdb3AlttgvOA55KZBaomeZ7N6oLHe+E86mE
	lV8/p7TiYEUqW3MKtYklQ==
X-ME-Sender: <xms:5XBRam5pOrY9Yz2RM--x2SRabCBqlENkMR8r55FWWJDO3cLVYMh6gg>
    <xme:5XBRatEOOL34wC3eGW1ftwT0a_f1r-0-747ODoRCwZ4rd1ZLckaojMRK_k7FShItu
    B4nuZZp0hzeaXTaMvCfsEoFLy9g91IUfAUkIreG9UcMb-sgRqAx_A>
X-ME-Received: <xmr:5XBRap-NkczGKuSXNlJre_k6L2BuxF7G9SO_Tk8qAuQ0Bskx5jx2MBHPsNg>
X-ME-Proxy-Cause: dmFkZTGMzXDuQeY5gEq71VJWijR1DWZ9rbms+1N9AX2oGTr8hArY6bxP2G/am96xUkPFv3
    Z4ApYv3m2mSWvALuvslRIxWhZTDC+hQKcWUNwhuKD541gUvs8bDfo88o/gmIt/+eiMSKZ/
    PfsKMxh88JCcjukEpflhKnQPQMXN23KiX+qh8YjqzX+GAfpI0rmfBBb+w/+rK+bUFo73gl
    aP1foO45G+FVhtVWhkJbcsI9jzwmJY7xKCsU82pHyhFyNjMMJasjWA8bW6xCtbAh+JFQbP
    zks9zj+srb+k4G3rfqsKY8R4EvGE/Z76nI2YOYsp8f456nw6SAcrEWEs+ztpMzUV1dHFcV
    WubCqGsJewqhxJctXJzEtFeJrO7J9JbdK6aIgEokYeQnpbO9U07Z3Hjdx3aIZPP1dp5qM4
    AczXB7dIHR/HNnYFNQ4EJr8DraiA0QB6AjWwgR+G7cjwn8XfvPdFHx+8RdVxcJZZNaVfqk
    yiW4ICvXSg29aUGNa0FTAO2cZ2NPrJTYXm6DjYXM/Tq1s9M3go9u0lQ3qYuy7Ut6//yQcC
    i/7ZV3MglwuyD6YFIhnRwTTVcjl/+zbc1ud9ubFtfunR9h6osuVVIvUxEAwctYoRTh1Mbr
    U9CEd+EfNYVA8Dhr6+iIEKhivYms4jaufw2g0MPcC6Npz1lGNg6Lv0H/hGYw
X-ME-Proxy: <xmx:5XBRavUtk2USJzjF2cfLl27lp286tN6w0-Tgb4s2fjTMwo5hct_b8A>
    <xmx:5XBRarGUkrXzH4mZu30E6nZyiJzqk8gS41Soej5UamquzErka09mlw>
    <xmx:5XBRaj78PVjkU_vUlMphE2Mzt4yVORgGvQXZj0xaKqIc_w0-X7KRRg>
    <xmx:5XBRatK2Jl5PsKiRWA0CullMPi-kXyKzySFMq_xKtk8R5oDnxoVMfQ>
    <xmx:5XBRaurMOx9P6Jac-dlSw4-ztL4Qs2I2uzA9OmmaS9Iikg1F9VpCJM1P>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jul 2026 18:23:31 -0400 (EDT)
Date: Fri, 10 Jul 2026 16:23:22 -0600
From: Alex Williamson <alex@shazbot.org>
To: <mhonap@nvidia.com>
Cc: <djbw@kernel.org>, <jgg@ziepe.ca>, <jic23@kernel.org>,
 <dave.jiang@intel.com>, <ankita@nvidia.com>,
 <alejandro.lucero-palau@amd.com>, <alison.schofield@intel.com>,
 <dave@stgolabs.net>, <dmatlack@google.com>, <gourry@gourry.net>,
 <ira.weiny@intel.com>, <cjia@nvidia.com>, <kjaju@nvidia.com>,
 <vsethi@nvidia.com>, <zhiw@nvidia.com>, <kvm@vger.kernel.org>,
 <linux-cxl@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 alex@shazbot.org
Subject: Re: [PATCH v3 05/11] vfio: UAPI for CXL Type-2 device passthrough
Message-ID: <20260710162322.012be635@shazbot.org>
In-Reply-To: <20260625165407.1769572-6-mhonap@nvidia.com>
References: <20260625165407.1769572-1-mhonap@nvidia.com>
	<20260625165407.1769572-6-mhonap@nvidia.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[shazbot.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96389-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alex@shazbot.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mhonap@nvidia.com,m:djbw@kernel.org,m:jgg@ziepe.ca,m:jic23@kernel.org,m:dave.jiang@intel.com,m:ankita@nvidia.com,m:alejandro.lucero-palau@amd.com,m:alison.schofield@intel.com,m:dave@stgolabs.net,m:dmatlack@google.com,m:gourry@gourry.net,m:ira.weiny@intel.com,m:cjia@nvidia.com,m:kjaju@nvidia.com,m:vsethi@nvidia.com,m:zhiw@nvidia.com,m:kvm@vger.kernel.org,m:linux-cxl@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:alex@shazbot.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,shazbot.org:from_mime,shazbot.org:dkim,shazbot.org:mid,nvidia.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B196B73F834

On Thu, 25 Jun 2026 22:24:01 +0530
<mhonap@nvidia.com> wrote:
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 5de618a3a5ee..3707d53c4de5 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -215,6 +215,7 @@ struct vfio_device_info {
>  #define VFIO_DEVICE_FLAGS_FSL_MC (1 << 6)	/* vfio-fsl-mc device */
>  #define VFIO_DEVICE_FLAGS_CAPS	(1 << 7)	/* Info supports caps */
>  #define VFIO_DEVICE_FLAGS_CDX	(1 << 8)	/* vfio-cdx device */
> +#define VFIO_DEVICE_FLAGS_CXL	(1 << 9)	/* vfio-cxl Type-2 device */

Would we define a different flag for type-1/3 if we ever found a need
to expose them through vfio?

>  	__u32	num_regions;	/* Max region index + 1 */
>  	__u32	num_irqs;	/* Max IRQ index + 1 */
>  	__u32   cap_offset;	/* Offset within info struct of first cap */
> @@ -257,6 +258,36 @@ struct vfio_device_info_cap_pci_atomic_comp {
>  	__u32 reserved;
>  };
>  
> +/*
> + * VFIO_DEVICE_INFO capability for CXL Type-2 passthrough devices.
> + * Present when VFIO_DEVICE_FLAGS_CXL is set on vfio_device_info::flags.
> + *
> + * @flags: VFIO_CXL_CAP_HOST_FIRMWARE_COMMITTED indicates the host CXL
> + *	subsystem committed the endpoint HDM decoder.
> + * @hdm_region_idx: VFIO region index for the HDM memory region
> + *	(subtype VFIO_REGION_SUBTYPE_CXL).
> + * @comp_reg_region_idx: VFIO region index for the CXL Component
> + *	Register shadow (subtype VFIO_REGION_SUBTYPE_CXL_COMP_REGS).

These regions are self describing via the noted CXL subtypes, what's
the purpose of double reporting them here?

> + * @comp_reg_bar: PCI BAR index that contains the CXL component
> + *	register block.  Get-region-info on this BAR returns a
> + *	VFIO_REGION_INFO_CAP_SPARSE_MMAP that excludes the CXL block.
> + * @comp_reg_offset: byte offset of the CXL component register block
> + *	within @comp_reg_bar.
> + * @comp_reg_size: byte size of the CXL component register block.

Why don't we describe all of these via a capability on the relevant
region info?

Does that leave this device level capability describing the device as
type-2 (by existence), with only a flags field to declare HDM as
firmware committed, for future compatibility should we support non-fw
committed?  Thanks,

Alex


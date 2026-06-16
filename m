Return-Path: <linux-doc+bounces-92464-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id la0vE9HrMGoNYwUAu9opvQ
	(envelope-from <linux-doc+bounces-92464-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 08:23:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC0268C7C9
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 08:23:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=K6GSroaw;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92464-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92464-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C076300728B
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 06:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8773D9DB0;
	Tue, 16 Jun 2026 06:23:05 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8371F3D7D75;
	Tue, 16 Jun 2026 06:23:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590985; cv=none; b=qoceAbOsRbyTa+mqYbJvQew9BhHAH7XLc2jm7BwDRNgfIzMbTu2l0P6aMIJ05WvvSRu447EdcpaSc2aZNWA9x50v2E1hyDDFpG8Dp9mPVjsrozZ6tfrnWNHFAdr8e+zgnHkDqn+dLUMFBCGL/VBjxV/J570wFjZIZSX0vwwI2Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590985; c=relaxed/simple;
	bh=2hZD5P6iv4LV6rM2c31XzUClq7PpjRi0KqyOvpDKgLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcmZr0f8KBdg58su1GhjIeC3oBh6HnF80jlYj+1ec9gwFcYYUCUw0BZ7fSXH8B/h9+lZP1A0qRn4xKMPa2ceiC8sELtBgC6R4pS9ZaCfajGI627PaQBw+pwjC7f5x9b4Pe02gckDNFC0v/PYa3Uyg8FegtBZadLOgSRIXalm4+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6GSroaw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF171F000E9;
	Tue, 16 Jun 2026 06:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781590984;
	bh=JgENt1aUql5leWB11YhE4AQhVjtbVDS4QwxhrhSyIHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K6GSroawCwbP0PxVEQc17I3NazJ7RtNnYjSWzZ6hX8BidX+413z4mve6p06B6m9mB
	 rjLO9xYk4L11ZlS58wskr7I3MmKAHk9oyEmVlNDpEuO1gvh25fmpDuDrRnFDKhkwGl
	 DM6UEXr6vP23ROYX/Bhz1jUgZDponk+coNBaagfsqGnRXRRalAW79bIq1FFyA/ghGQ
	 wWMuGcAn/SgRZmPD5/pITbQoucTk3Ju5OUrn/WTLX4P3Fi6/sBMvSq7HyZeHRkmFW1
	 cpAdgXkypm7w2V1XKvTExM+7xheraW5WRnldrwcrJhyUh7hmUpVrw+pBppo7+z6Eqg
	 U/kvYrg5/KCZw==
Date: Tue, 16 Jun 2026 08:22:53 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Aksh Garg <a-garg7@ti.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, kwilczynski@kernel.org, bhelgaas@google.com, corbet@lwn.net, 
	kishon@kernel.org, skhan@linuxfoundation.org, lukas@wunner.de, cassel@kernel.org, 
	alistair@alistair23.me, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, s-vadapalli@ti.com, danishanwar@ti.com, srk@ti.com
Subject: Re: [PATCH v5 3/4] PCI: endpoint: Add support for DOE initialization
 and setup in EPC core
Message-ID: <grfjlghqd3k3i3uxll2jksrh7pgi2mtxifbq2vymsdgbzijsnq@dvgu2qp2hza3>
References: <20260611191252.GA499821@bhelgaas>
 <0216a528-3737-4714-b9d1-5d28008e0ec8@ti.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0216a528-3737-4714-b9d1-5d28008e0ec8@ti.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:a-garg7@ti.com,m:helgaas@kernel.org,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:corbet@lwn.net,m:kishon@kernel.org,m:skhan@linuxfoundation.org,m:lukas@wunner.de,m:cassel@kernel.org,m:alistair@alistair23.me,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:s-vadapalli@ti.com,m:danishanwar@ti.com,m:srk@ti.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-92464-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CC0268C7C9

On Fri, Jun 12, 2026 at 01:54:13PM +0530, Aksh Garg wrote:
> 
> 
> On 12/06/26 00:42, Bjorn Helgaas wrote:
> > On Wed, Jun 10, 2026 at 03:32:55PM +0530, Aksh Garg wrote:
> > > Add pci_epc_init_capabilities() in EPC core driver to initialize and
> > > setup the capabilities supported by the EPC driver. This calls
> > > pci_epc_doe_setup() to setup the DOE framework for an endpoint controller,
> > > which discovers the DOE capabilities (extended capability ID 0x2E), and
> > > registers each discovered DOE mailbox for all the functions in the
> > > endpoint controller.
> > > 
> > > Add pci_epc_deinit_capabilities() in EPC core driver for cleanup of the
> > > resources used by the capabilities of the EPC driver. This calls
> > > pci_ep_doe_destroy() to destroy all DOE mailboxes and free associated
> > > resources.
> > > 
> > > Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > Signed-off-by: Aksh Garg <a-garg7@ti.com>
> > > ---
> > > +/**
> > > + * pci_epc_doe_setup() - Discover and setup DOE mailboxes for all functions
> > > + * @epc: the EPC device on which DOE mailboxes has to be setup
> > > + *
> > > + * Discover DOE (Data Object Exchange) capabilities for all physical functions
> > > + * in the endpoint controller and register DOE mailboxes.
> > > + *
> > > + * Returns: 0 on success, -errno on failure
> > > + */
> > > +static int pci_epc_doe_setup(struct pci_epc *epc)
> > > +{
> > > +	u8 func_no, vfunc_no = 0;
> > > +	u16 cap_offset;
> > > +	int ret;
> > > +
> > > +	if (!epc->ops || !epc->ops->find_ext_capability)
> > > +		return -EINVAL;
> > 
> 
> Hi Bjorn,
> 
> Thank you for your feedback comments. I will work on them and post v6
> series incorporating the changes.
> 
> > I don't see anything that sets pci_epc_ops.find_ext_capability in this
> > series, so this looks currently unused and untestable, so likely not
> > mergeable as-is.  What's the plan for users of this?
> > 
> 
> Currently there is no EPC driver upstream which supports DOE yet. However, I
> am working on a platform which supports DOE (support for
> which would be added soon). Mani pointed out that if EPC driver support
> for the same is guaranteed to be added soon, the APIs can be merged
> first.
> 
> For the demonstration purpose, he asked to show how an EPC driver is
> expected to use the API as a snippet in the cover letter itself.
> 

I retract my previous comment here. Let's not introduce dead code in the kernel.
We can review the series now, but cannot merge it until the EPC driver gets
submitted.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


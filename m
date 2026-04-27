Return-Path: <linux-doc+bounces-84843-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIwdEPvP72nZGQEAu9opvQ
	(envelope-from <linux-doc+bounces-84843-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 23:07:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 421C647A847
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 23:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED4E130074E2
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 21:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865B63AA517;
	Mon, 27 Apr 2026 21:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFGNDaTG"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6221B373BE9;
	Mon, 27 Apr 2026 21:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777324021; cv=none; b=CfHqhlnaTTaM+juwvbJIHP1AHxWWdv7DlPWsTPra1dLAdCJXJmK5vLp5x8I6EbSrt+eN1vdT9tQK7dMq1ImwuQ/p0ARLnGv+0t7YA6dCMORnP2RFjOqIw6Xman3NREP0Qq28fnx2QxS5Db1zbgerqW1aJKFqkPlTu5FNNafNXWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777324021; c=relaxed/simple;
	bh=Ji6QG+tICOp3jZRjVIPmRNoeZX3XNm+1s3nZGqpXmws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=V6n6CO2AiEe3BFDUgN6jCIcKpbE6oYSY/dQtVWh4lJs8jtaLdqdkaZUhOzWBUwD+D82CMQHRipfeqTzw0gRHkZRZsykn1Xlf9cxqkcyIHcNf9QnigP7lp+iQluaOZ/EgSnqlPkJlEoKYj8awpD8t57pikstWJhi6yRBEQErL5/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFGNDaTG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11644C19425;
	Mon, 27 Apr 2026 21:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777324021;
	bh=Ji6QG+tICOp3jZRjVIPmRNoeZX3XNm+1s3nZGqpXmws=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=QFGNDaTGW9a6kdfYz+Q7sP5WR3ZkbzEL1ZCMz/x/Se8P+hqKd3UU21B0gzVx4pqBl
	 kykxyVYNOR7VMHGZ+ds/id+OC9sE4OJiDDrLvBJuAtwrEL/oYKUj25SReZiK63RWqV
	 zqLGHgGm4CQzNaDmqo+Ta83Ay0qv+7jcHNQkaY/6E5JQ9nFVjxzjC2iuYoPQaq1/27
	 0XleZbQtLDheHJpPJP0IVRsnCI+hQSiEFIetIZfoCYJn1sRQx3kn2wlhuvPKWYM0G1
	 nI8/zJ/fR1QDFe6OK/JGPNIwx73t5SJiu7g/Tn0MksDCYe357ycHL/XROhv+A4Hhfc
	 cSXQLsRyl3SJw==
Date: Mon, 27 Apr 2026 16:06:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: iommu@lists.linux.dev, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v4 03/11] PCI: liveupdate: Track incoming preserved PCI
 devices
Message-ID: <20260427210658.GA186673@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423212316.3431746-4-dmatlack@google.com>
X-Rspamd-Queue-Id: 421C647A847
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84843-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Thu, Apr 23, 2026 at 09:23:07PM +0000, David Matlack wrote:
> During PCI enumeration, the previous kernel might have passed state about
> devices that were preserved across kexec. The PCI core needs to fetch
> this state to identify which devices are "incoming" and require special
> handling.

> +++ b/drivers/pci/liveupdate.c

> +void pci_liveupdate_finish(struct pci_dev *dev)
> +{
> +	if (!dev->liveupdate_incoming) {
> +		pci_warn(dev, "Cannot finish preserving an unpreserved device\n");
> +		return;
> +	}
> +
> +	pci_info(dev, "Device is finished participating in Live Update\n");
> +
> +	/*
> +	 * Drop the refcount so this device does not get treated as an incoming
> +	 * device again, e.g. in case pci_liveupdate_setup_device() gets called
> +	 * again becase the device is hot-plugged.

s/becase/because/


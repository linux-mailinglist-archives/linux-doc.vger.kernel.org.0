Return-Path: <linux-doc+bounces-84842-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FSLJOXP72nZGQEAu9opvQ
	(envelope-from <linux-doc+bounces-84842-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 23:06:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E67D147A839
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 23:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C5E5302712F
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 21:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A653AA514;
	Mon, 27 Apr 2026 21:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoNJN0KK"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04076373BE9;
	Mon, 27 Apr 2026 21:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777323978; cv=none; b=B/xwzGFwbxvx5C4bTsC/nPVs3fwC3CIBpIywnLXhIFgHZRJUjpHkaWjMA+lMB/qkgalkhr8jGN1IWIdMq8ekWZ4PbVjkFBhrHxUsvcefDHkB/IiK7FtLITE1k9065h3b1dw9wxBxtfGlQwYhrJpLBDCpYQuAQ+4Ys51D3tUsE+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777323978; c=relaxed/simple;
	bh=CIswUHjtV6oSUsxjeWT06cacL6KEcFHO+pUSNAd7kso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZzzXa32G5psX9rPtuGSyjEQXJNDA1JnhWLjiex/HBea+s1D102raPO/pH5Ho7rGY49eE/DgFO81j2PhQYltfj93rl4fub4ZqHX80rmXDgSalhKHmeyYjKKGEmtvddFMUhK2h0ejqAGKRoZO1aj+Hpx8AZc6h+Z++9Z24TOsSUs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YoNJN0KK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4DBC19425;
	Mon, 27 Apr 2026 21:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777323977;
	bh=CIswUHjtV6oSUsxjeWT06cacL6KEcFHO+pUSNAd7kso=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=YoNJN0KKRc41UjoNkjKTVxHCQ9uHmb1vXRgaeoA4tQWz/iAKTXe43aboUj7ZhDG0t
	 grNENZpJKNHzFBJy7Y506+AuuCHjO1qZfDRXYgBS/0Yw8y5dlIOWegmRBKPba4bB6Y
	 5VcibMz6TPsiqAgZkvXp2IBx61Yw3YfO9M4cAandeRfDj83rXbzcmH2WqXx6KVwMY1
	 tFRBliyM+9VjS8JW20gNO4qb1z7tkpfpIBwBl3Wh8cGH9NaUQh2VAbsD4l95ckOfFr
	 7cMHIO7JOZkCSv8VfoEMbGIMwpAhmicK4vHq6YczTKvrrB2AuD0Nao69SvIM0v/DRr
	 xVcZfTO9P4O2Q==
Date: Mon, 27 Apr 2026 16:06:15 -0500
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
Subject: Re: [PATCH v4 02/11] PCI: liveupdate: Track outgoing preserved PCI
 devices
Message-ID: <20260427210615.GA186434@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423212316.3431746-3-dmatlack@google.com>
X-Rspamd-Queue-Id: E67D147A839
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84842-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Thu, Apr 23, 2026 at 09:23:06PM +0000, David Matlack wrote:
> Add APIs to allow drivers to notify the PCI core of which devices are
> being preserved across a Live Update for the next kernel, i.e.
> "outgoing" devices.

> +++ b/drivers/pci/liveupdate.c
> @@ -43,6 +43,26 @@
>   *
>   *  * ``pci_liveupdate_register_flb(driver_file_handler)``
>   *  * ``pci_liveupdate_unregister_flb(driver_file_handler)``
> + *
> + * Device Tracking
> + * ===============
> + *
> + * Drivers must notify the PCI core when specific devices are preserved or
> + * unpreserved with the following APIs:
> + *
> + *  * ``pci_liveupdate_preserve(pci_dev)``
> + *  * ``pci_liveupdate_unpreserve(pci_dev)``
> + *
> + * This allows the PCI core to keep it's FLB data (struct pci_ser) up to date
> + * with the list of **outgoing** preserved devices for the next kernel.

s/it's/its/


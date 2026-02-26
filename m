Return-Path: <linux-doc+bounces-77158-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IXHHOfzn2kyfAQAu9opvQ
	(envelope-from <linux-doc+bounces-77158-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 08:19:03 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E40721A1BF0
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 08:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7C423014698
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 07:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3B536215A;
	Thu, 26 Feb 2026 07:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iaT6n/0f"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D05D2EB5BA;
	Thu, 26 Feb 2026 07:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772090338; cv=none; b=V8XmkPTnmXQllaBipjvrXEQaro0ZpjMxXEZeG4S7SpP3ye6IrLtlFAbNbDNY1QD1aZkXoMjp66P1Wdsfznu2VFsNRNDXF3r30VO5VTNZtGgdcSSqBpKDecCYj7YQ9ejDsZDu7yzkqeS+4Ck3V94/F66LJYxz5DJXZxELvsRUzZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772090338; c=relaxed/simple;
	bh=rVWWGoLzfnEr4YZDjcPykaqYCDvmIZeFsihBUzb3/3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUwrEEeTTMt5cWOqK007c1vmqtNp5HMu5DTXAuo4PP0D4adEoP3X9A2E1bHtbLNtXDVIWaKjknuP3ETcA/sG6As1FrqtLEsrlYk1duc5eJA9pElsngNqxSfUJw3++XCX/29Ke1Jkqr7Tt9PBLq0PrvB/GO/JFok3FmzGqGOTeOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iaT6n/0f; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772090336; x=1803626336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rVWWGoLzfnEr4YZDjcPykaqYCDvmIZeFsihBUzb3/3w=;
  b=iaT6n/0fVlopl97mA648y131clFvguPXVEnFnVy+JDuG04NNkYIsYD9C
   4n/oIG4pGU1kqc7uGk0VVwx92MetDchbCt0L5Me3Zlq/n//HaSXGMCCqA
   7yuwgryS4ugBH2qCspNuWdjI00oBMNuwvmiv953rb4WlEPQvh4aD/oiRW
   KJLS8pVvb0dRk+FY5zXBeYKcQzqBySEFx6oBS3IqzAE05ywuC1kizCO0m
   D6ET+5lYBO9qSeZUKnUlcr9SpdOBR1zbQrJEfr2kVfK6yavYqTQ0dz/AC
   2pFqk4Sdh/t2egxxmPyiDyUgarblvOxmLXAslLSMRH9wpDJjh4roRgHeH
   Q==;
X-CSE-ConnectionGUID: kIgSWHIKTpeDTZiUT4cvuA==
X-CSE-MsgGUID: V/f+evVxQZWSOPYsJPrgzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72354094"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="72354094"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 23:18:55 -0800
X-CSE-ConnectionGUID: tzLjy4iLShKJpLYq/aCM9w==
X-CSE-MsgGUID: ZC3eU4WWRpiXnwMax+3VUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="220617388"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa003.jf.intel.com with ESMTP; 25 Feb 2026 23:18:46 -0800
Date: Thu, 26 Feb 2026 14:59:12 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Peter Colberg <pcolberg@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-fpga@vger.kernel.org,
	driver-core@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 02/10] fpga: dfl-pci: set driver flag to disable
 SR-IOV on remove()
Message-ID: <aZ/vQHV3zr49r7E+@yilunxu-OptiPlex-7050>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
 <20260205-rust-pci-sriov-v2-2-ef9400c7767b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-rust-pci-sriov-v2-2-ef9400c7767b@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-77158-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[41];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,linuxfoundation.org,intel.com,ffwll.ch,lwn.net,redhat.com,vger.kernel.org,nvidia.com,lists.freedesktop.org,lists.linux.dev,ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yilun.xu@linux.intel.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: E40721A1BF0
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 03:59:49PM -0500, Peter Colberg wrote:
> Set the flag managed_sriov in the pci_driver structure to show how a
> PCI driver may opt into disabling the Single Root I/O Virtualization
> (SR-IOV) capability of the device when the driver is removed.
> 
> Merge the function cci_remove_feature_devs() into cci_pci_remove().

I think it makes much clearer demonstration if you split the unrelated
changes out.

> 
> Signed-off-by: Peter Colberg <pcolberg@redhat.com>
> ---
> Changes in v2:
> - Demonstrate flag managed_sriov for dfl-pci driver.
> ---
>  drivers/fpga/dfl-pci.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
> index 602807d6afcc09af9e1d53368b41460ef86545d8..7965c307f9b79bdd2c2c3277d519ab2c4e701797 100644
> --- a/drivers/fpga/dfl-pci.c
> +++ b/drivers/fpga/dfl-pci.c
> @@ -125,15 +125,6 @@ static int cci_init_drvdata(struct pci_dev *pcidev)
>  	return 0;
>  }
>  
> -static void cci_remove_feature_devs(struct pci_dev *pcidev)
> -{
> -	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
> -
> -	/* remove all children feature devices */
> -	dfl_fpga_feature_devs_remove(drvdata->cdev);
> -	cci_pci_free_irq(pcidev);
> -}
> -
>  static int *cci_pci_create_irq_table(struct pci_dev *pcidev, unsigned int nvec)
>  {
>  	unsigned int i;
> @@ -425,10 +416,11 @@ static int cci_pci_sriov_configure(struct pci_dev *pcidev, int num_vfs)
>  
>  static void cci_pci_remove(struct pci_dev *pcidev)
>  {
> -	if (dev_is_pf(&pcidev->dev))
> -		cci_pci_sriov_configure(pcidev, 0);
> +	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
>  
> -	cci_remove_feature_devs(pcidev);
> +	/* remove all children feature devices */
> +	dfl_fpga_feature_devs_remove(drvdata->cdev);
> +	cci_pci_free_irq(pcidev);
>  }
>  
>  static struct pci_driver cci_pci_driver = {
> @@ -437,6 +429,7 @@ static struct pci_driver cci_pci_driver = {
>  	.probe = cci_pci_probe,
>  	.remove = cci_pci_remove,
>  	.sriov_configure = cci_pci_sriov_configure,
> +	.managed_sriov = true,
>  };
>  
>  module_pci_driver(cci_pci_driver);
> 
> -- 
> 2.52.0
> 
> 


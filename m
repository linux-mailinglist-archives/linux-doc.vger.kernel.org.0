Return-Path: <linux-doc+bounces-75946-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEqzFwNGjmmpBQEAu9opvQ
	(envelope-from <linux-doc+bounces-75946-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 22:28:35 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B97EF1313FA
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 22:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF2683062221
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 21:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB30C29AAF3;
	Thu, 12 Feb 2026 21:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcDdt4NT"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DA5296BD2;
	Thu, 12 Feb 2026 21:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770931711; cv=none; b=fY1oGLiJ4k9o8UTsZbWkOAot9iBHZdB72v4Lx07WH6rL241J71UJC8+9oWAbaT2c7FYONzUPWIqUkNafl2/Rx8jBPBVO7XmpjOYSJmN+0w5IbHyQNXkmDvUp/lo/jHSiVxeid1UJ/wDlXomZD7pTvOvkFTY3aYcEydUEcIH0DIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770931711; c=relaxed/simple;
	bh=nWO5M2vv7U2eAIVGBCR1C5NnOXPoJqeq0K9YOO8fig0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=c1X6upWbAQN1hPIam37kxcM/1krLoJf61bZQwm/p6o1t7qsEIUHTM3wiV76B9YFk/Nvps2wU/W81KUhFwrVQxhdhk0P87yXvyjakZosn8lH89ejndcxptz+CMUkxTjIpdTDn7q7E6FoDVh9AUbUjgMMfyrx77KGpfkhkYwPlZA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcDdt4NT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00E4C4CEF7;
	Thu, 12 Feb 2026 21:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770931711;
	bh=nWO5M2vv7U2eAIVGBCR1C5NnOXPoJqeq0K9YOO8fig0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=AcDdt4NTlLiWV2mXwYeRt3NS63f7ocw/xMCpeIiI8UBIB3EvyAGmBRFED3LqMafkD
	 tK4l+umApR53ogu4fLsceGz9GmFY0bXyH1OxJvZw3WiPujth+zt+ayADSaaFn0sE7E
	 2Js26LpLbYMcTeQeh30rcmBcAPkC4xSVDcq8aebNAGCxZDcJ3IAvLZgI8o1kYdzlOl
	 f+PYLkYsIBCOo2HkmB1zkRt3cIhynlHlvAe66MRMOxm1e3VFA+CnkpvlvWlDaqeDIY
	 CAguM3ucGN5dEA4Sz74YXnnvgNM9QIb6+rg3oF5jGHWt9OCh0muA7Sl1tc2vABHC0X
	 rTre973bgoPDA==
Date: Thu, 12 Feb 2026 15:28:29 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org, Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH v2 0/3] Clarify pci_free_irq_vectors() usage constraints
Message-ID: <20260212212829.GA3089824@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1770798299-202288-1-git-send-email-shawn.lin@rock-chips.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75946-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B97EF1313FA
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 04:24:56PM +0800, Shawn Lin wrote:
> pcim_enable_device() automatically manages IRQ vectors, which can cause
> double-free issues if drivers manually call pci_free_irq_vectors().
> 
> This series adds documentation and warnings to prevent this:
> 1. msi-howto.rst guidance
> 2. kernel-doc warning
> 3. TODO comment for future cleanup
> 
> 
> Changes in v2:
> - rework the commit message and documentation
> 
> Shawn Lin (3):
>   Documentation: PCI: Clarify pci_free_irq_vectors() usage for managed
>     devices
>   PCI/MSI: Add warning to pci_free_irq_vectors() documentation
>   PCI/MSI: Add TODO comment about legacy pcim_enable_device()
>     side-effect
> 
>  Documentation/PCI/msi-howto.rst |  7 +++++--
>  drivers/pci/msi/api.c           |  5 +++++
>  drivers/pci/msi/msi.c           | 10 ++++++++++
>  3 files changed, 20 insertions(+), 2 deletions(-)

Squashed the first two patches and applied to pci/msi for v7.1,
thanks!

This will be rebased to v7.0-rc1 after it is tagged.


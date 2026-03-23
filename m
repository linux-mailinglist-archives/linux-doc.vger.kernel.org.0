Return-Path: <linux-doc+bounces-80649-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CFMMUUewWmTQwQAu9opvQ
	(envelope-from <linux-doc+bounces-80649-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 12:04:37 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9AD2F0C9B
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 12:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4D92302A387
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 11:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7554C39098C;
	Mon, 23 Mar 2026 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSTw/RLw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00652390236;
	Mon, 23 Mar 2026 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263786; cv=none; b=rWlOEWVMw4VFUD16y1dD1xw86Xsq3eY639tr5fz9EV325NRmENzPROyslWbAyRjzaRu2bS7+sSMsCp4Lju+Aw3vgtVNGw1egFNeUdSI+Ics7qsVUcZbHMDNcU/zhR1oZAZQ96ExXhfZZoOre7adYmoTMVs3uIo6hB3fzzXMz450=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263786; c=relaxed/simple;
	bh=lwzszmN0gUEL/hG6F2iaX0s8NeEJgFur5NjFkR20Uys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgOClanDl+IdpwoqzM2kk0lNoFarYzoMmVcDP3KOclcE4iUGW3Lo9VZbN9F3O9RHea4aurF43OeyNC/EmLgx+i7cPtnHnP6NrSaE2KhSOE0Lobte+JsnkIYPggDZFvLxUIgEIPLYPMHCsIncK2a0PBvOnMaIQEP4gZ4O4t9LaGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSTw/RLw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774263785; x=1805799785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lwzszmN0gUEL/hG6F2iaX0s8NeEJgFur5NjFkR20Uys=;
  b=JSTw/RLwOAlKBB7e/25YzpmI2KMN8Kjr7Gh2YqR/gknmQ3550f1bFPZQ
   A4dy7OFGV2y1vb4Pp+V5OJvRANlN//tA3KAQRzTvrMCtgM7dcxN9gImYf
   w+hFYjZD6culaZaKztStW1zuOqaEdkJYXFKNFRtYji3qsJRYt2MWsgBkr
   kNGXuRPBjT4NehR0m9+Epnp6VgjuG9NCjLR9Ysg54rGly2+OspyM28soS
   uCyNiTdMigTLoi5BiPMgK6eInw4qlRpYs7AYzffvagQQZjRlk8TFhNPlM
   8VK3cKtXviAUIeG7UqJXorG8eYoAE5Jo9jlmPCEi6yJSU8fNSzaL4ex9x
   g==;
X-CSE-ConnectionGUID: mBOSxtqWTWuaUUdEkVV8yA==
X-CSE-MsgGUID: 2xqiAxhFRqqhYsFcg/YEOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75282125"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75282125"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 04:03:05 -0700
X-CSE-ConnectionGUID: 873TmT3jQ4y335vwFWd4BQ==
X-CSE-MsgGUID: yWr1G0QiR3WIzW2GQd0Elg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="225713352"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 23 Mar 2026 04:03:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 75D2995; Mon, 23 Mar 2026 12:03:01 +0100 (CET)
Date: Mon, 23 Mar 2026 12:03:01 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Maciej Grochowski <mx2pg@pm.me>,
	Kai-Heng Feng <kaihengf@nvidia.com>
Subject: Re: [PATCH] Documentation: PCI: Document decoding of TLP Header in
 AER messages
Message-ID: <20260323110301.GX2275908@black.igk.intel.com>
References: <bf826c41b4c1d255c7dcb16e266b52f774d944ed.1774246067.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bf826c41b4c1d255c7dcb16e266b52f774d944ed.1774246067.git.lukas@wunner.de>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80649-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,wunner.de:email]
X-Rspamd-Queue-Id: 3C9AD2F0C9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 07:52:39AM +0100, Lukas Wunner wrote:
> The prefix/header of the TLP that caused an error is recorded by the Root
> Complex and emitted to the kernel log in raw hex format.  Document the
> existence and usage of tlp-tool, which allows decoding the TLP Header
> into human-readable form.
> 
> The TLP Header hints at the root cause of an error, yet is often ignored
> because of its seeming opaqueness.  Instead, PCIe errors are frequently
> worked around by a change in the kernel without fully understanding the
> actual source of the problem.  With more documentation on available tools
> we'll hopefully come up with better solutions.
> 
> There are also wireshark dissectors for TLPs, but it seems they expect a
> complete TLP, not just the header, and they cannot grok the hex format
> emitted by the kernel directly.  tlp-tool appears to be the most cut and
> dried solution out there.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Cc: Maciej Grochowski <mx2pg@pm.me>

Good idea, this is useful.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>


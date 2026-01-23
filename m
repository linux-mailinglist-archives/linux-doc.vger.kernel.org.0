Return-Path: <linux-doc+bounces-73817-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJwABC6Gc2krxAAAu9opvQ
	(envelope-from <linux-doc+bounces-73817-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jan 2026 15:31:10 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7851F7716C
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jan 2026 15:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22A3C3050EED
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jan 2026 14:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77C7330D26;
	Fri, 23 Jan 2026 14:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XrCcdp64"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BC832695C
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178526; cv=none; b=tOUlyDNy9q7xlwRvzmsLVgPeg/5Rd9GGwLtvR2VzEe4osbNCtDjslERYw/4arYwNpKvnFLnEqKhckTDe6lA31rQEm3JGMrRdDUN5T6naPCfblGBZstPexG1UnPrJbo7yzThVk1ZsRWhNW17c6U9JcysptZmAGFQXxK6ByS6Gt64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178526; c=relaxed/simple;
	bh=zOdQZXXC+ifRORnofi7mnfPrZEWUg4x5bpQutUWv01E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ugVqfSsVzLKXXbEdsbBm0gbItMT1GN1w+P2qqe3700Cq96SuNdRVwP0Da677F5RwhV58Vi0Vsvw34h3YS4Ai1NVj/6uV6c8H1U/0b8VPVvgE2Zp3+ZySmrJSARrCfS33lNDiOXPs4lI/YtKBq8emyNLcv09dwYfxi6pABKnJRec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XrCcdp64; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769178524; x=1800714524;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=zOdQZXXC+ifRORnofi7mnfPrZEWUg4x5bpQutUWv01E=;
  b=XrCcdp646Jyy8+9fyMQKN/omN1BYwHua+eAbm/4SVbFjk7hk71A78NvQ
   ep26BgH13gR1n7OezZXU4sohChzW7jscYvdSA6QPAGHe6fl0RoNyMPZeE
   wldKAJhEYwZPTYhYXzQ1KiAY/P4vgExFHqvm2eWfbLLHvfVzDvD9/tMeO
   6jpBOcmPwwQW2Tru0evO9X1qyUUuU2ZbD+pcMUyS4iycL99fvcAH1gPBf
   1po2LLRe8uankEK7bFOPmDkkrgGYsiAJCS+26xmkw4kTySRsLRTbGixy9
   vARKdy+PZJcp9NjCvCc1bi456hwz8RXW/sYW0oBDsIBzlqDonUGYxXolO
   A==;
X-CSE-ConnectionGUID: FONFjyIsTXS5rcjxHx+0zA==
X-CSE-MsgGUID: QBZTWHwTTdO+sWeU2A4TRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="69627934"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="69627934"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 06:28:42 -0800
X-CSE-ConnectionGUID: vL3ICru9SuWKH41JsDpu+A==
X-CSE-MsgGUID: NWzOCPRlTgS9RrFA9MyhUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="212037598"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.2])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 06:28:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Passing SPHINXOPTS is broken
In-Reply-To: <20260123151033.5acc515f@localhost>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <db84b28d2997a1ce73ca9bc65c33e2d08a90aae8@intel.com>
 <11148f49962022fde99058c15345add4935bbeff@intel.com>
 <20260123123215.32f6c40a@foz.lan>
 <233a2366263111e61700da07f3692a029fc51a50@intel.com>
 <20260123151033.5acc515f@localhost>
Date: Fri, 23 Jan 2026 16:28:37 +0200
Message-ID: <faac4df15ab5b87dc5795143ecafb9b725b9118e@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-73817-lists,linux-doc=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7851F7716C
X-Rspamd-Action: no action

On Fri, 23 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> With Makefile, there isn't. This didn't change: it is just the same
> behavior we used to have before the wrapper addition, after this
> changeset (merged in 2022):
>
> 	c0d3b83100c8 ("kbuild: do not print extra logs for V=2")
>
> Now, currently it is possible to do that by calling the wrapper
> directly:
>
> 	$ ./tools/docs/sphinx-build-wrapper -v htmldocs --sphinxdirs peci
>
> Here, "-v" instructs the wrapper to drop "-q" flag, but doesn't touch
> KBUILD_VERBOSE, so you won't see kernel-doc debug messages.

I'm not really interested in using the wrapper directly. I use make O=
builds, and I don't want to and I should not have to figure out how to
do that with the wrapper.

Again, it should be possible to pass user SPHINXOPTS to sphinx-build.

BR,
Jani.

-- 
Jani Nikula, Intel


Return-Path: <linux-doc+bounces-94605-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hi+kHq5qRmpTTwsAu9opvQ
	(envelope-from <linux-doc+bounces-94605-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 15:42:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D546F872B
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 15:42:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=UTLHgdM7;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94605-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94605-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF32A301FFAA
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 13:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DB54A3402;
	Thu,  2 Jul 2026 13:41:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBEC48124B;
	Thu,  2 Jul 2026 13:41:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782999710; cv=none; b=mSlEow6dYR8M4w2xcPEuMpwowt2ALB6Xxfy0hAlNW3fsCYWJfhtMFr/f+fpz6w8Q/2TGaYtARTsjTiGb1t0m8oin2PSR0G3A/l96ZVwT6t7nsHiUl76ax12Y6T/6/Qhcs+Wb+NytXtuGKKabMq5cHLwgw+jnRrXpjb41ySrPzH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782999710; c=relaxed/simple;
	bh=r5yzlfbgXzs3tjCuy6akoWLqe95kXZ37o1Hv5WdsxVE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F28+2wLDEfq7oUPCymTo2oYnczP5d+0eOyIfBHbFOEf3Pnsih17HiaDQZid1QtxMOOnKfbIxUhG3TTNKALkNs9c2p+nMNAPf+AG4IqsuPWp7HZX2Vm7yVG2YIWFg+URRZ2DWZkREEsJA2EICnJMDbHsD5BU5WOeYZZ6ae22w8+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTLHgdM7; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782999710; x=1814535710;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=r5yzlfbgXzs3tjCuy6akoWLqe95kXZ37o1Hv5WdsxVE=;
  b=UTLHgdM7WD75yFchKWWAL1lYhG4c/PjdF++t7FRPjmMPcWqfdVb2rjpC
   itPCYbecbNTy91VBn6Od5nMuiQT8KPx+KnJnCpzO/YUwmO9myWuZNzBNm
   VFBTWwEB8aj/4xXTHU0LSCBqkgJL3/7eSNC5kIw80lZRovwkxxdSwyk6g
   48cVy2f7AcbFLThqivV/imJijBQ3xHZ1mywivHnfIeMmnbi/g16eMHhci
   1tTYmusw3zz29KtFUwDH8B92PaNzw22ieHruezh1Y7L93mRClbM2gYf0F
   SvAEsB5QWZ3kBouYDVq1KWltTbILAM4KV8XRkk+PuVAThlXEhT9WZchYS
   Q==;
X-CSE-ConnectionGUID: WDtptg/RScWKf+Qpxy+Ukg==
X-CSE-MsgGUID: yGiGrT0fSAaphQmfmPvsLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101178285"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="101178285"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:41:49 -0700
X-CSE-ConnectionGUID: FHlkyB+MTMGrAWNEHZrqIQ==
X-CSE-MsgGUID: jK4m25SURhSW9ph8wdY9NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="256770784"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:41:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lorenzo Stoakes <ljs@kernel.org>, "David Hildenbrand (Arm)"
 <david@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Jens
 Axboe <axboe@kernel.dk>, Jeff Layton <jlayton@kernel.org>, Vlastimil Babka
 <vbabka@kernel.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
In-Reply-To: <akZYSGoysWSb0K1J@lucifer>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
 <5e7b9d23-4291-48fb-bdc6-47db82d33c80@kernel.org>
 <20260702-seekrank-stilrichtung-mitentscheiden-69a64ee097ec@brauner>
 <1f29f48d-b9ff-4de2-a392-dc05781728be@kernel.org>
 <akYz2aMIco1fbD-t@lucifer>
 <54d3a698-a275-488e-ad36-ef423db30f70@kernel.org>
 <akZYSGoysWSb0K1J@lucifer>
Date: Thu, 02 Jul 2026 16:41:40 +0300
Message-ID: <8aa9788c9fc0fc02e2493b3f910437d613506125@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-94605-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:david@kernel.org,m:brauner@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:axboe@kernel.dk,m:jlayton@kernel.org,m:vbabka@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jani.nikula@intel.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79D546F872B

On Thu, 02 Jul 2026, Lorenzo Stoakes <ljs@kernel.org> wrote:
> "Say how much of your patch is LLM written, here are some examples".

I think the question is, did you offload understanding to the LLM, or
just the creation of the patch.

I think Assisted-by gets used as an indication of "the contributor might
not understand the contribution", and the patch might warrant extra
scrutiny. But that's not reliable by any means.

Right or wrong, it used to be that the lack of polish in a patch was
used as a poor proxy for that, but now we get polished patches from
LLMs.


BR,
Jani.


-- 
Jani Nikula, Intel


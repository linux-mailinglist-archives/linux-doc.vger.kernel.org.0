Return-Path: <linux-doc+bounces-94549-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BVLVKjwxRmr7LQsAu9opvQ
	(envelope-from <linux-doc+bounces-94549-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 11:37:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 107156F557E
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 11:37:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=lKXO0I5P;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94549-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94549-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 868A93095E89
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 09:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1093477E4D;
	Thu,  2 Jul 2026 09:20:53 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFBF357CFA;
	Thu,  2 Jul 2026 09:20:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984053; cv=none; b=HGYFvGypouAbv1aO2Bm5DPZIIhJ+bMESh3BM8tvYRThNdM7bfWTZCnEWVL/ODG/O/ljy3A8pHcSaGjfpsnREx0zucE0/xGG6e5OBmbNHEqUGT3PGRCI03uBPH6wREFZw2KwzeT8B06hy4mm4RqqR46vW1I0HZTBSxLSgFtkYMBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984053; c=relaxed/simple;
	bh=gjNPHhngjbQG/fwTaT1PmZuXub3d1bbMsOCUElo4gG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fc/bT+UDQQhNa37NcfmWpw2A6P+vDWdj+8lkcWWX5G1WqkoQp5PWT6Bn/y6h/2f1DEtCk0SmA2gw/B6tJTBXwvwZDBAhQhqFsHTcbYgJ1zPtu6vbwbFiA+HjxPU/2Ah6yDMxlVW9PFXszkG7L+XLl1x9ddwWSL0mTPGnvdAhZGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKXO0I5P; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782984053; x=1814520053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gjNPHhngjbQG/fwTaT1PmZuXub3d1bbMsOCUElo4gG0=;
  b=lKXO0I5P/Zb0z77t+lbEBNCXDVSYNz0WBwMW8m0xdf/GEQdafheFNB+M
   3O2yI9OKJ9QRy0N8chPSW8X9HfFMpGvA0+qr0ezohoFhAhKD+R6D689UO
   Hl29/whOtrGqheQH/upf2H2sq9Kf5BxTHOfhxUtxvuDENXjknu4mFjGUj
   OcC1wpep13o+kHWbJHbyQEcEsF5YasGV2hM+D+MAJ1QGEBVsUKIFQNJwt
   RaOynRWKJyJMgpMxpuPYi1ffhGvGYXH0MwkGTGoRcZzPw2BOqmHiqNRvn
   nEF9YFMxBKFuqXojG2RKTH6bUuO5j2FXnubI98JQ1c2u7kmIQvtwXnTf/
   g==;
X-CSE-ConnectionGUID: 5uOPKmGwQ9avpHvmMYWWlw==
X-CSE-MsgGUID: tjeH6ebGQduTsR68BtbkMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87563994"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="87563994"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:20:52 -0700
X-CSE-ConnectionGUID: BM7/czkqS7WHsjh8y6n9pg==
X-CSE-MsgGUID: 0DBzkv31TQird/u5tzewow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="290935070"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:20:49 -0700
Date: Thu, 2 Jul 2026 12:20:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: [RFC V2 3/3] mm: Replace pgtable entry prints with new format
Message-ID: <akYtbi0Is2JL2t9a@ashevche-desk.local>
References: <20260610043545.3725735-1-anshuman.khandual@arm.com>
 <20260610043545.3725735-4-anshuman.khandual@arm.com>
 <fc57bb9a-4564-489e-8da4-65068b5283ae@kernel.org>
 <4a416383-62f5-1716-8e04-a2ee1f89a864@google.com>
 <dabfd73b-d872-4267-9a40-45463fe146ac@kernel.org>
 <3afa822d-3cc9-1068-9a10-94a5f2e4d29a@google.com>
 <90b5cd31-87ed-4ef7-86cc-458b9e06b02d@kernel.org>
 <5a8e82f3-ed21-48a8-af3c-36a08fd2b0ec@arm.com>
 <82902a84-7e62-496b-b1c0-62bad1be4525@kernel.org>
 <e4ec99fc-dfb1-4205-a193-f694e9f6a13b@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4ec99fc-dfb1-4205-a193-f694e9f6a13b@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94549-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:anshuman.khandual@arm.com,m:david@kernel.org,m:hughd@google.com,m:linux-mm@kvack.org,m:linux@rasmusvillemoes.dk,m:senozhatsky@chromium.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:corbet@lwn.net,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ljs@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.intel.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 107156F557E

On Thu, Jul 02, 2026 at 02:34:22PM +0530, Anshuman Khandual wrote:
> On 02/07/26 1:02 PM, David Hildenbrand (Arm) wrote:
> > On 7/2/26 06:29, Anshuman Khandual wrote:

...

> > Can you take over this approach and refine it (and address Andy's comments)?
> 
> Sure will do that.
> > 
> > I'm not quite happy about the
> > 
> > 	typeof(pud_val(pud)) entry = pud_val(pud);
> > 
> > stuff, but I didn't see an easy (less ugly) way to avoid it. Maybe there is one :)
> 
> Could __auto_type be an alternative ?

Just 'auto'? We should have a macro for the older/newer compiler versions.

-- 
With Best Regards,
Andy Shevchenko




Return-Path: <linux-doc+bounces-92031-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tl/VNJsNK2qx1wMAu9opvQ
	(envelope-from <linux-doc+bounces-92031-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 21:33:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE0674C50
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 21:33:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=FfFjcYBx;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92031-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92031-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 151BB30BFA1E
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 19:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B740D32692C;
	Thu, 11 Jun 2026 19:33:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5C32C08BB;
	Thu, 11 Jun 2026 19:33:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781206422; cv=none; b=aBMKpr9ZR3TgJ5ySp8L5h82+D/XbWg8JKd5Oal6fwv+SD9kXbk2EtssBXqsILPrNI2XbmwLCOMu02wwV1YhIutfLTKZmHJYs97sx5kAMKX09mPA6/wq8K7HNpB1k+eMt1CpsobjBryZDL9A8MSxVqzGZuOsA8zfTgsIm0yu7Bbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781206422; c=relaxed/simple;
	bh=NIR3HYw2JEH9d+Wwq9mB8fwmfiQAFUYzbs2IS3Faf5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlbJ07OxW4Z3DR1Ok95ydQfYHULF6hEOIP3e/uoXcOsAQDXrVgMHikAchH7aHfWSIBactSGUsBGFKEwPAdr+7gBrmg+Y6fYHRTB0Ma0XbmtMAI3NTlmQQa2UMRefDZozddnFOIApEDEk3WWFkvTyR/e3XYNyt9ilaHm7SaCt9XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfFjcYBx; arc=none smtp.client-ip=192.198.163.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781206421; x=1812742421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NIR3HYw2JEH9d+Wwq9mB8fwmfiQAFUYzbs2IS3Faf5A=;
  b=FfFjcYBx9MQIIR1Frhud//03y/aeGDQMfvoQEGTyYULwQDP4NRJSf2aG
   kTnEQ6GMrGdmpFOARPlA8ntgNXHXd3tidUkfkxwbdUAVRgDpbN+hTKJHx
   XUeYwABl+EJN9IwKpUaVbPSfMSbvDMDKGYMj+kOboItesPd5PV6gVvwvZ
   H+dd+Ap5b0oQxL8embAMAWVNC8wJW1SovWAngYRaZduWaMXNjqV2XarbA
   stIu2xhIjmfnVRTym6g2oRXj9D5cdzxDLf/ptaqdO1FUUoxUxQa9BQaS+
   4UHp0ONaCNEcZwjDVMhuGek9xsDmzlS50wSbvZEpvsn/yO/oahrLJvhmk
   Q==;
X-CSE-ConnectionGUID: DEVnIBUKT2S39H9gWKjS/Q==
X-CSE-MsgGUID: e3Ocs9cdT1yLYovnd9CFnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93423640"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="93423640"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:33:40 -0700
X-CSE-ConnectionGUID: 0wSjZKvyRlKvpIUqpBVZeg==
X-CSE-MsgGUID: 1y256R2mT72GQJAJDpkyFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="270614781"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:33:37 -0700
Date: Thu, 11 Jun 2026 22:33:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC V2 0/3] lib/vsprintf: Add support for pgtable entries
Message-ID: <aisNjxHW369cbKiq@ashevche-desk.local>
References: <20260610043545.3725735-1-anshuman.khandual@arm.com>
 <aisJbeVVxxNuYxQ6@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aisJbeVVxxNuYxQ6@casper.infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92031-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:anshuman.khandual@arm.com,m:linux-mm@kvack.org,m:linux@rasmusvillemoes.dk,m:senozhatsky@chromium.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:corbet@lwn.net,m:akpm@linux-foundation.org,m:david@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,ashevche-desk.local:mid,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47CE0674C50

On Thu, Jun 11, 2026 at 08:15:57PM +0100, Matthew Wilcox wrote:
> On Wed, Jun 10, 2026 at 05:35:42AM +0100, Anshuman Khandual wrote:
> > Printing page table entries has been a common requirement both in generic
> > and platform memory management for various purposes. Hence let's create a
> > dedicated printk format for such entries which will also help standardize
> > pgtable printing across different platforms.
> 
> You didn't address my objection here:
> 
> https://lore.kernel.org/linux-mm/aFQP8LzVMctf6XH5@casper.infradead.org/
> 
> ie there is now no typechecking possible.  So you've made it more
> dangerous.  I reiterate my NACK to the concept, not to the implementation.

But this is more of a global question, how do we check the validity of
the parameters of pointer extensions in the kernel? Does anybody go to
commit into GCC plugin or so for this job?

-- 
With Best Regards,
Andy Shevchenko




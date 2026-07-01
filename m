Return-Path: <linux-doc+bounces-94311-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X60qLhzYRGrY1woAu9opvQ
	(envelope-from <linux-doc+bounces-94311-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 11:04:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 229126EB6D6
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 11:04:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="L/sK1EsA";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94311-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94311-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E19163041B8C
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 09:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E539D3F077C;
	Wed,  1 Jul 2026 09:00:08 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519CA3F0A94;
	Wed,  1 Jul 2026 09:00:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896408; cv=none; b=SgoBLOPJvx2tts/EKHviaYIu8Eh16wdwyP/5z36GhrXOd6SdxEMuVkmTXbPg4Er8D6E92Frrz3ANw+K9QXCWeg6BvI9cPIK0MxExKd2ZpXi7OJ1YZ0IE+4XRdFE0lVxlZsM1SNntaaeZmo0luDmfBWSs/xZFad/pMyuPkeWfqMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896408; c=relaxed/simple;
	bh=nHgJI21HPY161RCXXPvHhSW5/EGkSu5uqE1nrC9+G4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMA/CzStr2IjDWhQxW2AxAPCzC6FcYKwOvmK4Q3Txd4nlnupqd156n6WVA8FIrIR3O+qkrAQ4ZMhN+lK7Bjix40e61BVr9NODkqm9bCoxisX/OzorRNGLtSOdUr/0FTiUUA2kciMQXfnQMPKNgNdaYPrcW9pUOnm5fzojVzPGPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/sK1EsA; arc=none smtp.client-ip=192.198.163.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782896407; x=1814432407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nHgJI21HPY161RCXXPvHhSW5/EGkSu5uqE1nrC9+G4U=;
  b=L/sK1EsAn2rV9wO0o1NXBwhP/ZY8i0sZWdLVpsuKvZEWCvvk6jlCAHQF
   pXJKrKruNDpcHYhE+Rlv0GDncg4m5ALoUqfuUULcKhDOwtsORHkTHyqSB
   QVdfLpa81JLjGAG/Kz/p/8tI91+spkLofHNpxrexBsf8jFAZOhmlzJhOG
   yjsC2ZX3QnZSIwC+DDyDtRwp6JlM28mwNj6DnT4zJYJyba7jfNRd5nPHG
   tycQudpfvVnLIz9w9jMOpSJyRX+fiWtFrslZK7zP7yBxxMpvmqQHS0Al7
   xjH0LwFLSRgi2artqXquC6fSOFhSkGEHWLjB0dlde3tolCvWLG9nmGYYQ
   w==;
X-CSE-ConnectionGUID: 4YMMw1gKRMyGwk8CSGI4ZQ==
X-CSE-MsgGUID: kP7wENKIRhuvkmTSlpVfBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="109170685"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="109170685"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 02:00:06 -0700
X-CSE-ConnectionGUID: qmADDl3uRZuJqwO2sQFarg==
X-CSE-MsgGUID: ULkSYhUmQ0SqQeGXnXEstQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="254425816"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 02:00:02 -0700
Date: Wed, 1 Jul 2026 12:00:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hugh Dickins <hughd@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: [RFC V2 3/3] mm: Replace pgtable entry prints with new format
Message-ID: <akTXEOowxiEc0XKy@ashevche-desk.local>
References: <20260610043545.3725735-1-anshuman.khandual@arm.com>
 <20260610043545.3725735-4-anshuman.khandual@arm.com>
 <fc57bb9a-4564-489e-8da4-65068b5283ae@kernel.org>
 <4a416383-62f5-1716-8e04-a2ee1f89a864@google.com>
 <dabfd73b-d872-4267-9a40-45463fe146ac@kernel.org>
 <3afa822d-3cc9-1068-9a10-94a5f2e4d29a@google.com>
 <90b5cd31-87ed-4ef7-86cc-458b9e06b02d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90b5cd31-87ed-4ef7-86cc-458b9e06b02d@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94311-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:hughd@google.com,m:anshuman.khandual@arm.com,m:linux-mm@kvack.org,m:linux@rasmusvillemoes.dk,m:senozhatsky@chromium.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:corbet@lwn.net,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ljs@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.intel.com:from_mime,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 229126EB6D6

On Tue, Jun 30, 2026 at 03:36:58PM +0200, David Hildenbrand (Arm) wrote:
> On 6/16/26 08:19, Hugh Dickins wrote:
> > On Mon, 15 Jun 2026, David Hildenbrand (Arm) wrote:
> >> On 6/12/26 23:26, Hugh Dickins wrote:

...

> +#define PTVAL_STR_MAX	(sizeof(u64) * 4 + 1)
> +
> +static void ptval_bytes_to_str(char *buf, size_t buf_size,
> +		const void *entry, size_t entry_size)
> +{

> +	if (WARN_ON_ONCE(buf_size < entry_size * 2 + 1)) {
> +		snprintf(buf, buf_size, "overflow");
> +		return;
> +	}

If you want to make this available for dynamically allocated buffers of
the exact size, this function should return the result of snprintf()
as int along with accepting NULL, 0 case.

> +	switch (entry_size) {
> +	case sizeof(u32):
> +		snprintf(buf, buf_size, "%08x", *(const u32 *)entry);
> +		break;
> +	case sizeof(u64):
> +		snprintf(buf, buf_size, "%016llx",
> +			 (unsigned long long)*(const u64 *)entry);

Not sure why castings are needed here and below.

> +		break;
> +	case sizeof(u64) * 2: {
> +		const u64 *val = entry;
> +
> +		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
> +			snprintf(buf, buf_size, "%016llx%016llx",
> +				 (unsigned long long)val[0],
> +				 (unsigned long long)val[1]);
> +		else
> +			snprintf(buf, buf_size, "%016llx%016llx",
> +				 (unsigned long long)val[1],
> +				 (unsigned long long)val[0]);
> +		break;
> +	}
> +	default:
> +		snprintf(buf, buf_size, "unsupported");
> +		break;
> +	}
> +}

-- 
With Best Regards,
Andy Shevchenko




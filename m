Return-Path: <linux-doc+bounces-95785-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m+GRC6SeTmpMQwIAu9opvQ
	(envelope-from <linux-doc+bounces-95785-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 21:01:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84511729C2D
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 21:01:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="Ox/qzpCj";
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95785-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95785-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A76F3088F22
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 19:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670DA3C379F;
	Wed,  8 Jul 2026 19:01:08 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3BD3D0C07;
	Wed,  8 Jul 2026 19:01:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783537268; cv=none; b=AnMp+B0HM/9rtwlfIt1m4NTXvmdI78gCsbUF1LdYjxp/M1HlP+2r6B3NkXOKSZ8IsZQIuJNqMFHb3jBr/NHNVcd+92MKEEomP10Yv44QhFNGiZydQ6/eLFRMyb/jV/Ul1g9GknWBCuJdenbduWLUVAN9aUj1PEnuasYBg3g/YN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783537268; c=relaxed/simple;
	bh=JmvmXqvoJhxel/XCqY2ga/B/piNjvTPEr8lOPuxpubA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXwPGJGb2zvuU3NOrM95sclFhylRtBAe2OIwQinjut+I8XAU1j+skRnGbgC4UzC2ciiVolNZbiy65MjmV8O2WCmaKMlZyQP7UfSrx1VFqFKdaoL3jAKagV37r1SjJThv9/n+lYvNYO2OhtBBxPlNqSvrn0RxoZ5nDTXyh1wNnAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ox/qzpCj; arc=none smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783537266; x=1815073266;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JmvmXqvoJhxel/XCqY2ga/B/piNjvTPEr8lOPuxpubA=;
  b=Ox/qzpCjVd4vPGM6qroNVc30olmwg8ENwV9KqmGs9r473Ct7i0nWdVC2
   974ePQiU9yTSMZad3NFxDN9NQ6GDu9CIFbzIHRgcz71Xd/P+qMnjsw0af
   rvyIjtjdaJB/hSHQtX6DVNyruj/H/u07dMXULslDQq2nYPHhb5WX/eNrC
   4K+ARjDk5rjGSUVUNhH+/+qFJzgcm7kYvyWY1wXDHIWFUA07mkgfdZt19
   a7/kux3FL16dMZEciOrg4iqNw5cv/JYZY4FVUOiV2FliBUoN5O86aO92+
   6OMuz3D8iVkK5wVWiIvZlz5Kb5OZoSPI4tplgX7hMaCreve8LYkDXHwfG
   g==;
X-CSE-ConnectionGUID: TG1A1FebR5S4E0wed8ScfA==
X-CSE-MsgGUID: ESx5ZoUMTYKzUKWcPOdrTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94567117"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94567117"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 12:01:05 -0700
X-CSE-ConnectionGUID: 3obKFQgzQqS3quORMBg99Q==
X-CSE-MsgGUID: punpz2zRRdqR7+3AYOReyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="251717242"
Received: from jmaxwel1-mobl.amr.corp.intel.com (HELO [10.125.111.66]) ([10.125.111.66])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 12:01:04 -0700
Message-ID: <1d60cebf-4764-4785-bf01-8ca59ab2cc7d@intel.com>
Date: Wed, 8 Jul 2026 12:01:01 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] x86/virt/tdx: Handle concurrent callers in
 tdx_pamt_get/put()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>, bp@alien8.de, hpa@zytor.com,
 kas@kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com,
 nik.borisov@suse.com, pbonzini@redhat.com, seanjc@google.com,
 tglx@kernel.org, vannapurve@google.com, x86@kernel.org, chao.gao@intel.com,
 yan.y.zhao@intel.com, kai.huang@intel.com
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com>
 <20260526023515.288829-6-rick.p.edgecombe@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 xsFNBE6HMP0BEADIMA3XYkQfF3dwHlj58Yjsc4E5y5G67cfbt8dvaUq2fx1lR0K9h1bOI6fC
 oAiUXvGAOxPDsB/P6UEOISPpLl5IuYsSwAeZGkdQ5g6m1xq7AlDJQZddhr/1DC/nMVa/2BoY
 2UnKuZuSBu7lgOE193+7Uks3416N2hTkyKUSNkduyoZ9F5twiBhxPJwPtn/wnch6n5RsoXsb
 ygOEDxLEsSk/7eyFycjE+btUtAWZtx+HseyaGfqkZK0Z9bT1lsaHecmB203xShwCPT49Blxz
 VOab8668QpaEOdLGhtvrVYVK7x4skyT3nGWcgDCl5/Vp3TWA4K+IofwvXzX2ON/Mj7aQwf5W
 iC+3nWC7q0uxKwwsddJ0Nu+dpA/UORQWa1NiAftEoSpk5+nUUi0WE+5DRm0H+TXKBWMGNCFn
 c6+EKg5zQaa8KqymHcOrSXNPmzJuXvDQ8uj2J8XuzCZfK4uy1+YdIr0yyEMI7mdh4KX50LO1
 pmowEqDh7dLShTOif/7UtQYrzYq9cPnjU2ZW4qd5Qz2joSGTG9eCXLz5PRe5SqHxv6ljk8mb
 ApNuY7bOXO/A7T2j5RwXIlcmssqIjBcxsRRoIbpCwWWGjkYjzYCjgsNFL6rt4OL11OUF37wL
 QcTl7fbCGv53KfKPdYD5hcbguLKi/aCccJK18ZwNjFhqr4MliQARAQABzUVEYXZpZCBDaHJp
 c3RvcGhlciBIYW5zZW4gKEludGVsIFdvcmsgQWRkcmVzcykgPGRhdmUuaGFuc2VuQGludGVs
 LmNvbT7CwXgEEwECACIFAlQ+9J0CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEGg1
 lTBwyZKwLZUP/0dnbhDc229u2u6WtK1s1cSd9WsflGXGagkR6liJ4um3XCfYWDHvIdkHYC1t
 MNcVHFBwmQkawxsYvgO8kXT3SaFZe4ISfB4K4CL2qp4JO+nJdlFUbZI7cz/Td9z8nHjMcWYF
 IQuTsWOLs/LBMTs+ANumibtw6UkiGVD3dfHJAOPNApjVr+M0P/lVmTeP8w0uVcd2syiaU5jB
 aht9CYATn+ytFGWZnBEEQFnqcibIaOrmoBLu2b3fKJEd8Jp7NHDSIdrvrMjYynmc6sZKUqH2
 I1qOevaa8jUg7wlLJAWGfIqnu85kkqrVOkbNbk4TPub7VOqA6qG5GCNEIv6ZY7HLYd/vAkVY
 E8Plzq/NwLAuOWxvGrOl7OPuwVeR4hBDfcrNb990MFPpjGgACzAZyjdmYoMu8j3/MAEW4P0z
 F5+EYJAOZ+z212y1pchNNauehORXgjrNKsZwxwKpPY9qb84E3O9KYpwfATsqOoQ6tTgr+1BR
 CCwP712H+E9U5HJ0iibN/CDZFVPL1bRerHziuwuQuvE0qWg0+0SChFe9oq0KAwEkVs6ZDMB2
 P16MieEEQ6StQRlvy2YBv80L1TMl3T90Bo1UUn6ARXEpcbFE0/aORH/jEXcRteb+vuik5UGY
 5TsyLYdPur3TXm7XDBdmmyQVJjnJKYK9AQxj95KlXLVO38lczsFNBFRjzmoBEACyAxbvUEhd
 GDGNg0JhDdezyTdN8C9BFsdxyTLnSH31NRiyp1QtuxvcqGZjb2trDVuCbIzRrgMZLVgo3upr
 MIOx1CXEgmn23Zhh0EpdVHM8IKx9Z7V0r+rrpRWFE8/wQZngKYVi49PGoZj50ZEifEJ5qn/H
 Nsp2+Y+bTUjDdgWMATg9DiFMyv8fvoqgNsNyrrZTnSgoLzdxr89FGHZCoSoAK8gfgFHuO54B
 lI8QOfPDG9WDPJ66HCodjTlBEr/Cwq6GruxS5i2Y33YVqxvFvDa1tUtl+iJ2SWKS9kCai2DR
 3BwVONJEYSDQaven/EHMlY1q8Vln3lGPsS11vSUK3QcNJjmrgYxH5KsVsf6PNRj9mp8Z1kIG
 qjRx08+nnyStWC0gZH6NrYyS9rpqH3j+hA2WcI7De51L4Rv9pFwzp161mvtc6eC/GxaiUGuH
 BNAVP0PY0fqvIC68p3rLIAW3f97uv4ce2RSQ7LbsPsimOeCo/5vgS6YQsj83E+AipPr09Caj
 0hloj+hFoqiticNpmsxdWKoOsV0PftcQvBCCYuhKbZV9s5hjt9qn8CE86A5g5KqDf83Fxqm/
 vXKgHNFHE5zgXGZnrmaf6resQzbvJHO0Fb0CcIohzrpPaL3YepcLDoCCgElGMGQjdCcSQ+Ci
 FCRl0Bvyj1YZUql+ZkptgGjikQARAQABwsFfBBgBAgAJBQJUY85qAhsMAAoJEGg1lTBwyZKw
 l4IQAIKHs/9po4spZDFyfDjunimEhVHqlUt7ggR1Hsl/tkvTSze8pI1P6dGp2XW6AnH1iayn
 yRcoyT0ZJ+Zmm4xAH1zqKjWplzqdb/dO28qk0bPso8+1oPO8oDhLm1+tY+cOvufXkBTm+whm
 +AyNTjaCRt6aSMnA/QHVGSJ8grrTJCoACVNhnXg/R0g90g8iV8Q+IBZyDkG0tBThaDdw1B2l
 asInUTeb9EiVfL/Zjdg5VWiF9LL7iS+9hTeVdR09vThQ/DhVbCNxVk+DtyBHsjOKifrVsYep
 WpRGBIAu3bK8eXtyvrw1igWTNs2wazJ71+0z2jMzbclKAyRHKU9JdN6Hkkgr2nPb561yjcB8
 sIq1pFXKyO+nKy6SZYxOvHxCcjk2fkw6UmPU6/j/nQlj2lfOAgNVKuDLothIxzi8pndB8Jju
 KktE5HJqUUMXePkAYIxEQ0mMc8Po7tuXdejgPMwgP7x65xtfEqI0RuzbUioFltsp1jUaRwQZ
 MTsCeQDdjpgHsj+P2ZDeEKCbma4m6Ez/YWs4+zDm1X8uZDkZcfQlD9NldbKDJEXLIjYWo1PH
 hYepSffIWPyvBMBTW2W5FRjJ4vLRrJSUoEfJuPQ3vW9Y73foyo/qFoURHO48AinGPZ7PC7TF
 vUaNOTjKedrqHkaOcqB185ahG2had0xnFsDPlx5y
In-Reply-To: <20260526023515.288829-6-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95785-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dave.hansen@intel.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rick.p.edgecombe@intel.com,m:bp@alien8.de,m:hpa@zytor.com,m:kas@kernel.org,m:kvm@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mingo@redhat.com,m:nik.borisov@suse.com,m:pbonzini@redhat.com,m:seanjc@google.com,m:tglx@kernel.org,m:vannapurve@google.com,m:x86@kernel.org,m:chao.gao@intel.com,m:yan.y.zhao@intel.com,m:kai.huang@intel.com,m:kirill.shutemov@linux.intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.hansen@intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84511729C2D

On 5/25/26 19:35, Rick Edgecombe wrote:
> +	scoped_guard(spinlock, &pamt_lock) {
> +		/*
> +		 * If the pamt page is already added (i.e. refcount >= 1),
> +		 * then just increment the refcount.
> +		 */
> +		if (atomic_read(pamt_refcount)) {
> +			atomic_inc(pamt_refcount);
> +			goto out_free;
> +		}

I think this pattern is a good fit for atomic_inc_not_zero().

I think it's also fair to say that using an atomic_t here is unnecessary
because of the spinlock protecting all accesses. But I also understand
that it's here because you want to optimize this path to avoid the
spinlock in the future.

This is not a hot enough path to care about an atomic_t vs. int. In
practice, the performance is going to be bottlenecked on the big
spinlock, *not* the atomic_t overhead.

I'd just add a changelog blurb to handwave it away for the moment:

	The pamt_refcount[]s are atomic_t's. They do not strictly need
	to be because all access is protected by pamt_lock. The overhead
	of an atomic_t in this situation is minuscule compared to the
	global lock. Leave the (unnecessary) atomic_t in place to enable
	future optimization with minimal churn.

Does that work for everybody?


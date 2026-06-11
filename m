Return-Path: <linux-doc+bounces-91938-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HoxyDCCGKmrprgMAu9opvQ
	(envelope-from <linux-doc+bounces-91938-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 11:55:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F3C6709D6
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 11:55:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=ZaTrMu8m;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91938-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91938-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31F64306D636
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 09:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CF63C3C0C;
	Thu, 11 Jun 2026 09:50:40 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4D43BCD07;
	Thu, 11 Jun 2026 09:50:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171440; cv=none; b=HpTwJm39Bp0F7WtHfTk8jr5t81gz2eZF7Pb1W0Wkrrowl164eJUXMuWwNiFy98oehi1dopPPOfM8e7KCpXCzL54VgkeQNnKNVsGScNxaYQOMqw55va5zy1QbnvPJFE8tZxCBcFOUWpuE0uNT60fxhs71fbS8i3RQZrqDUP+8PKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171440; c=relaxed/simple;
	bh=giW2ha6I059T0G+qHAhzVhjSsPjt0+qNu14U4xR5Kok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q02jSleJIYSNqGfW9vRSbMkr2jvlnqx3KIHC4rOASwvdAcCqLs4YSi/GMINjbyUn/cYwuLLDPDj3P2B7AshjTo4YgICUAXHfHX4vOPtF9AoVBnCNXEWNZpRhAdE7CYzTwquvzWX6+sXmahBDFJz//5xNdVSl/wuTZG6Q2adR/fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZaTrMu8m; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB5BA1E5E;
	Thu, 11 Jun 2026 02:50:32 -0700 (PDT)
Received: from [10.174.41.206] (unknown [10.174.41.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 723DF3F99C;
	Thu, 11 Jun 2026 02:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781171437; bh=giW2ha6I059T0G+qHAhzVhjSsPjt0+qNu14U4xR5Kok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZaTrMu8mAWfzsBKisoH3fnQkGfn0yNj/TxIkV+zx2PNNtyQQXWrVHo0eThpQs16p4
	 VZaQ43d6LxXNzSq/wlTpvMWRbR3Tpjk7i1y9adDunaSF+7+4u2qsv34+d3e3SBuTCS
	 jjxnQdSKzFNLvwdBFzq8OxGGg5ZmRV/TISIw9O6A=
Message-ID: <d41a24c1-592e-495f-8adf-dd538b769904@arm.com>
Date: Thu, 11 Jun 2026 15:20:13 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 1/3] lib/vsprintf: Add support for pgtable entries
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Andy Whitcroft <apw@canonical.com>
References: <20260610111339.2465922-1-usama.arif@linux.dev>
 <919d334b-16a3-4412-82f4-b4cd6a35be0d@arm.com>
 <aiphHAkLnG_L2kY2@ashevche-desk.local>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aiphHAkLnG_L2kY2@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91938-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:usama.arif@linux.dev,m:linux-mm@kvack.org,m:linux@rasmusvillemoes.dk,m:senozhatsky@chromium.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:corbet@lwn.net,m:akpm@linux-foundation.org,m:david@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:apw@canonical.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anshuman.khandual@arm.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anshuman.khandual@arm.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,arm.com:dkim,arm.com:email,arm.com:mid,arm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93F3C6709D6



On 11/06/26 12:47 PM, Andy Shevchenko wrote:
> On Thu, Jun 11, 2026 at 10:45:01AM +0530, Anshuman Khandual wrote:
>> On 10/06/26 4:43 PM, Usama Arif wrote:
>>> On Wed, 10 Jun 2026 05:35:43 +0100 Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
> ...
> 
>>>> +		static_assert(sizeof(pte_t) == 4 ||
>>>> +			      sizeof(pte_t) == 8,
>>>> +			      "pte_t size must be 4 or 8 bytes");
> 
> Besides occupying too many lines, why are these static asserts hidden here and
> not declared in the global space? More wide Q is why they are needed at all?

Sure, will move these static_assert just above pxd_pointer()
These asserts ensure

- Platforms have either 32 bit or 64 bit pgtable descriptors
- special_hex_number() can be used to print such descriptors



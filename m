Return-Path: <linux-doc+bounces-79799-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLGBAqaMuWnkJwIAu9opvQ
	(envelope-from <linux-doc+bounces-79799-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 18:17:26 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C0B2AF419
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 18:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D758D300D9E6
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 17:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A4F2459DC;
	Tue, 17 Mar 2026 17:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fW3gcGAV"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0122C11CD;
	Tue, 17 Mar 2026 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767829; cv=none; b=OQRiaorFmpUNsCdRFW8gcySBXJIup5SmeN8lcUBJs7qmmPRW/3kqOZzgCdsGlM3+SPvf8aOgflr90hifijoqFY0xl8aHmQult3sjA4pLDjJrFPVE/gDo27L7yQwIIrn3ZXNIn/r1wXA3jXcy2tRlwmyR+7SecWWoYjfiijlZ9V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767829; c=relaxed/simple;
	bh=pTeY+fLcN95htFrNGBHt7vym3xXoDgwY6cA1oE5cXLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ACTObsNWr55nXzM3c8US85kz6XMKTSh7d3Ui9LVkzBsivJbMtbDaK5sQBX/mn81iM70mX4rIS0vwPkpTIo50V0zWlzVjYgGVGHce3iI1Lz2QdmUdGIVP2nPWoYt5k/pfTNljHWYt0p6iwHq6AgPTWVuySPJLfYl7oM+WTNGW6sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fW3gcGAV; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=v7UGPDzTUVntWZ7B9duUilqk99yTEBA4ZZT8dgC32yk=; b=fW3gcGAVDEtTMh6YEqK00To3LE
	E4vX2+ido/HbsOQoVJFpyOQG8MkuNFk/E6SWu3xt9EJNv1VepyJPxAoDpYU+4gwA1lqENuoyxQQUU
	BxZlVyhx5jFqLEXJ4Blo1OEIeYj2mqnPp+tV4oOx8nM/SJ2OjN4XpA50/D1CYXVMAiqxcwljSrxtj
	aII+ZZGMUiAwqiO5CvsUoVN7Sfu+W2aZAZ1fGEGZt1XszUbplnT20qOWZO8cCD6zxGWS4ip6rIbs/
	TWmv/FFAmxU0V1/pmR8qpoj7Yta4qbnAGkCr3hDqeg8YIH9UdboGs6mLJ1e+DN2Biah/oGmGRLT8U
	XYWItKbg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y2R-00000006urx-0KUn;
	Tue, 17 Mar 2026 17:17:03 +0000
Message-ID: <68072e04-49e6-4418-a465-6a70dbb01f13@infradead.org>
Date: Tue, 17 Mar 2026 10:16:59 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-unstable v15 05/13] mm/khugepaged: generalize
 collapse_huge_page for mTHP collapse
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
 Nico Pache <npache@redhat.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com,
 akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com,
 catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net,
 dave.hansen@linux.intel.com, david@kernel.org, dev.jain@arm.com,
 gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, jack@suse.cz,
 jackmanb@google.com, jannh@google.com, jglisse@google.com,
 joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 mathieu.desnoyers@efficios.com, matthew.brost@intel.com,
 mhiramat@kernel.org, mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de,
 rakie.kim@sk.com, raquini@redhat.com, richard.weiyang@gmail.com,
 rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org,
 ryan.roberts@arm.com, shivankg@amd.com, sunnanyong@huawei.com,
 surenb@google.com, thomas.hellstrom@linux.intel.com, tiwai@suse.de,
 usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com,
 wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org,
 yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com,
 zokeefe@google.com
References: <20260226031741.230674-1-npache@redhat.com>
 <20260226032427.233282-1-npache@redhat.com>
 <9f0b8790-eace-4caa-a0c0-45f66285887f@lucifer.local>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <9f0b8790-eace-4caa-a0c0-45f66285887f@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,redhat.com,linux-foundation.org,arm.com,nvidia.com,kernel.org,linux.alibaba.com,sk.com,gentwo.org,lwn.net,linux.intel.com,gourry.net,cmpxchg.org,google.com,suse.cz,gmail.com,linux.dev,oracle.com,efficios.com,intel.com,suse.com,suse.de,goodmis.org,amd.com,huawei.com,infradead.org,os.amperecomputing.com];
	TAGGED_FROM(0.00)[bounces-79799-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[59];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:dkim,infradead.org:mid]
X-Rspamd-Queue-Id: 40C0B2AF419
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/26 9:51 AM, Lorenzo Stoakes (Oracle) wrote:
> On Wed, Feb 25, 2026 at 08:24:27PM -0700, Nico Pache wrote:
>> Pass an order and offset to collapse_huge_page to support collapsing anon
>> memory to arbitrary orders within a PMD. order indicates what mTHP size we
>> are attempting to collapse to, and offset indicates were in the PMD to
>> start the collapse attempt.
>>
>> For non-PMD collapse we must leave the anon VMA write locked until after
>> we collapse the mTHP-- in the PMD case all the pages are isolated, but in
> The '--' seems weird here 🙂 maybe meant to be ' - '?

"--" is common typewriter(!) style for "dash".
Single "-" is a hyphen.

-- 
~Randy



Return-Path: <linux-doc+bounces-93514-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XN8qLoofPWpVxQgAu9opvQ
	(envelope-from <linux-doc+bounces-93514-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 14:31:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FA36C596E
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 14:31:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=Pu82SVzy;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93514-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93514-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65FCD302AD90
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 12:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E3A3E1201;
	Thu, 25 Jun 2026 12:23:09 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDCE3D891E;
	Thu, 25 Jun 2026 12:23:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390189; cv=none; b=ojC8Asad8eQC0yVm1pJlVhqFuhNfAUmBDDdwnfJdfmos2tSo8d0QloC9q7FkJkR6HGrKC04ydZtE6B76qhUOk+ZItz+yH+pm4jHFSx+/ymfTuA9wwOEmJcgfg3nb/LwEofvPTt6QrZxlXE5ReDXak+110JrCquaH1UGAzK/36Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390189; c=relaxed/simple;
	bh=LDEE5G+NOHafeWW3BlHXZZmLZjy75Uy70/2e9B7rEys=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=M06yUXymHRVUglGox4sExXvDphKhNWhI/l0yZww4sOsf0uPi7zaCKy5UsacY18N0xw00lEFUl7s6l+Qyr5tf69y7ZxtSiBbDLYgvfjbOTHHLdf+81krXmlxpQNXIFmaxV6d+2+x8RlsU8zLGIHOdlRyoOEJEC455KhJmB3SfpoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Pu82SVzy; arc=none smtp.client-ip=113.46.200.223
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DtTrF+dkMhH5wL9XVdpqg+EYpu4n3AZ8BvYl3aOQkWs=;
	b=Pu82SVzyU7dKh9zHrrRfAFclb3zu86TYxOkI5vuEUY0eNHVES52yjxGbOXUnji1L3zyjo7tWr
	hpk2IGB9tsONDex78SNwtga9xcWfokjgnOQKPcT90UfVu7TxF3D3zYuR7ULMeiC3bH5wmKsMKGO
	95g0/YrBB8UU0mZl7x/5OaA=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gmHlk23FBzmV6S;
	Thu, 25 Jun 2026 20:13:54 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 820C140539;
	Thu, 25 Jun 2026 20:23:00 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Jun 2026 20:23:00 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Jun 2026 20:22:58 +0800
Subject: Re: [PATCH v9 4/6] mm/memory-failure: add panic option for
 unrecoverable pages
To: Breno Leitao <leitao@debian.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-trace-kernel@vger.kernel.org>, <kernel-team@meta.com>, Andrew Morton
	<akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, "Lorenzo
 Stoakes" <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
	<rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
	<mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, Naoya Horiguchi
	<nao.horiguchi@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, "Liam R. Howlett" <liam@infradead.org>,
	<lance.yang@linux.dev>, Steven Rostedt <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Mathieu Desnoyers
	<mathieu.desnoyers@efficios.com>
References: <20260609-ecc_panic-v9-0-432a74002e74@debian.org>
 <20260609-ecc_panic-v9-4-432a74002e74@debian.org>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <80c7ddaa-dd8c-1540-f72e-2a9a56aecdb1@huawei.com>
Date: Thu, 25 Jun 2026 20:22:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260609-ecc_panic-v9-4-432a74002e74@debian.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq500010.china.huawei.com (7.202.194.235)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93514-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:leitao@debian.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kernel-team@meta.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:nao.horiguchi@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:liam@infradead.org,m:lance.yang@linux.dev,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:naohoriguchi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linmiaohe@huawei.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[kvack.org,vger.kernel.org,meta.com,linux-foundation.org,kernel.org,google.com,suse.com,gmail.com,lwn.net,linuxfoundation.org,infradead.org,linux.dev,goodmis.org,efficios.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmiaohe@huawei.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06FA36C596E

On 2026/6/9 18:56, Breno Leitao wrote:
> Add a sysctl panic_on_unrecoverable_memory_failure (disabled by
> default) that triggers a kernel panic when memory_failure()
> encounters pages that cannot be recovered.  This provides a clean
> crash with useful debug information rather than allowing silent
> data corruption or a delayed crash at an unrelated code path.
> 
> Panic eligibility is intentionally narrow: only MF_MSG_KERNEL with
> result == MF_IGNORED panics.  After the previous patch, MF_MSG_KERNEL
> covers PG_reserved pages and the kernel-owned pages promoted from
> get_hwpoison_page() via -ENOTRECOVERABLE (slab, page tables,
> large-kmalloc).
> 
> All other action types are excluded:
> 
> - MF_MSG_GET_HWPOISON and MF_MSG_KERNEL_HIGH_ORDER can be reached by
>   transient refcount races with the page allocator (an in-flight buddy
>   allocation has refcount 0 and is no longer on the buddy free list,
>   briefly), and panicking on them would risk killing the box for what
>   is actually a recoverable userspace page.
> 
> - MF_MSG_UNKNOWN means identify_page_state() could not classify the
>   page; that is precisely the wrong basis for a panic decision.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks.
.


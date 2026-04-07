Return-Path: <linux-doc+bounces-82621-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL6pEXpy1GlquAcAu9opvQ
	(envelope-from <linux-doc+bounces-82621-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Apr 2026 04:56:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1A13A9429
	for <lists+linux-doc@lfdr.de>; Tue, 07 Apr 2026 04:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54345301B713
	for <lists+linux-doc@lfdr.de>; Tue,  7 Apr 2026 02:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF50E35A3B4;
	Tue,  7 Apr 2026 02:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="hpoMBAgb"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7C61474CC;
	Tue,  7 Apr 2026 02:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775530612; cv=none; b=UWDZu5W2Eu5XsrjY7StR807B1Mmu1ACKMaCkZ6pcXLdjHRjDrNtu/BWLpbJ44gAOROtSdaYfeXgfRdqjQg8u7bhRCX2bc0T+RvkgfdNAn6yQLsCF9EPBU8396ald9o9AdvqxNk3DWLlyjplkKUi+clrQKVM6r6XDXm9A4PMdJfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775530612; c=relaxed/simple;
	bh=13qllhkRUHt1PMAYO0Z+oD92946z0o+MerNTcRtEq58=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=GtmSRRtSvR3yMy7/xIUARma4ZgVFEObX0k8jTAaReVhy3WLrM509b9pfxNVggD29LD2IdWCOCKDX5WvSV5gZ3bBJTNAUS/toGSr4GOPduHkQS/1JN1V0WCJNmWLdYfeRLYeRUBjMeBohvbfpHBHYFke/aG/rXHNeKAsI8GjFclc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=hpoMBAgb; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jDo6bFyo08dSfTXZAI9StL+3fyXHAaNYa9/ncq3oS4E=;
	b=hpoMBAgbzV/6RVSdbYqmy3rwQJL0KncgwW9CriNOaveUwpYL0YEkswknFuCP8TUavYdvk4Jo9
	FCSmxnfi/HbK9B8CMexEEO7N9pzqkE0d3L7Pp4fdDHNlCdvHDGpUz7POCGZNVxnTMy+0eGJRemr
	PkXrZGErpnFijZUpPiJ4KZw=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fqW01467VzcZxk;
	Tue,  7 Apr 2026 10:50:25 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 9AE6640576;
	Tue,  7 Apr 2026 10:56:40 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Apr 2026 10:56:40 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Apr 2026 10:56:39 +0800
Subject: Re: [PATCH v2 1/3] mm/memory-failure: report MF_MSG_KERNEL for
 reserved pages
To: Breno Leitao <leitao@debian.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <kernel-team@meta.com>, Naoya Horiguchi
	<nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260331-ecc_panic-v2-0-9e40d0f64f7a@debian.org>
 <20260331-ecc_panic-v2-1-9e40d0f64f7a@debian.org>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <e074d5de-f494-4995-2521-32de4f2bd34f@huawei.com>
Date: Tue, 7 Apr 2026 10:56:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260331-ecc_panic-v2-1-9e40d0f64f7a@debian.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq500010.china.huawei.com (7.202.194.235)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kvack.org,vger.kernel.org,meta.com,gmail.com,linux-foundation.org,lwn.net,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	TAGGED_FROM(0.00)[bounces-82621-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:dkim,huawei.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmiaohe@huawei.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA1A13A9429
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/31 19:00, Breno Leitao wrote:
> When get_hwpoison_page() returns a negative value, distinguish
> reserved pages from other failure cases by reporting MF_MSG_KERNEL
> instead of MF_MSG_GET_HWPOISON. Reserved pages belong to the kernel
> and should be classified accordingly for proper handling by the
> panic_on_unrecoverable_memory_failure mechanism.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  mm/memory-failure.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index ee42d4361309..6ff80e01b91a 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -2432,7 +2432,11 @@ int memory_failure(unsigned long pfn, int flags)
>  		}
>  		goto unlock_mutex;
>  	} else if (res < 0) {
> -		res = action_result(pfn, MF_MSG_GET_HWPOISON, MF_IGNORED);
> +		if (PageReserved(p))
> +			res = action_result(pfn, MF_MSG_KERNEL, MF_IGNORED);

Is it safe or common to check page flags without holding extra refcnt?

Thanks.
.


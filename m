Return-Path: <linux-doc+bounces-96649-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sbBwOzeoVWrhrQAAu9opvQ
	(envelope-from <linux-doc+bounces-96649-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 05:08:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44238750910
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 05:08:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96649-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96649-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=zte.com.cn (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 078F5301D699
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 03:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C658377023;
	Tue, 14 Jul 2026 03:08:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945AE36A34D;
	Tue, 14 Jul 2026 03:08:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783998516; cv=none; b=d9aMIVtM8Fetmlu6+qZA7Til4U6DaOKOgM0HWYX3To3SNtKqoc0+VxXFvF2QXZaMiAG9pmAzuxOF7igMrBSvUIu6YFY/iegZeO4BvYOo/KCGztQyYKHXa7mlYHx/3LlZiWKgGTpqyy++KW9rV7amLqWFbx4d60MU18moSeTHOH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783998516; c=relaxed/simple;
	bh=/0ktWZomd1VQnqcpx1TyQ0GIN/rpYpzGlulTEsOvmk4=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=nFp4srVo0ZbkLhBwXwJNJinyiXWE7CakfcMXd6utzOuI6HMpwtHDYNzkDGMWwO5zpYRJKVqIpKTHEjIReqPtGWA189LqwKP9l7CQ4iukmSGGlkp8/LCrxiPd9Va6rbf6JNBo7Im23fNwKgVm668HN8TWMSOZzTe81/XTcuu5tgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gzklg4YBZz8XsC9;
	Tue, 14 Jul 2026 11:08:31 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 66E37qnV026777;
	Tue, 14 Jul 2026 11:07:52 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 14 Jul 2026 11:07:53 +0800 (CST)
X-Zmail-TransId: 2afa6a55a809552-5cf55
X-Mailer: Zmail v1.0
Message-ID: <20260714110753517WvFQ2LIOXx9u9wmDXSxTR@zte.com.cn>
In-Reply-To: <20260711173256542-prxp-gSW6zPAMKAp8GOM@zte.com.cn>
References: 20260711173112482SCQEM08VED2PT1pxUYOXk@zte.com.cn,20260711173256542-prxp-gSW6zPAMKAp8GOM@zte.com.cn
Date: Tue, 14 Jul 2026 11:07:53 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <wang.yaxin@zte.com.cn>, <akpm@linux-foundation.org>
Cc: <wang.yaxin@zte.com.cn>, <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>,
        <corbet@lwn.net>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzNdIGRlbGF5dG9wOiByZWZhY3RvciByZXBldGl0aXZlIGRlbGF5IGZpZWxkcyBpbnRvIGFycmF5IHdpdGggZW51bQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 66E37qnV026777
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 14 Jul 2026 11:08:31 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A55A82F.006/4gzklg4YBZz8XsC9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.64 / 15.00];
	SUBJ_EXCESS_BASE64(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[zte.com.cn : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96649-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wang.yaxin@zte.com.cn,m:akpm@linux-foundation.org,m:fan.yu9@zte.com.cn,m:yang.yang29@zte.com.cn,m:corbet@lwn.net,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[xu.xin16@zte.com.cn,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[xu.xin16@zte.com.cn,linux-doc@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44238750910

> Replace the 9 groups of (count, delay_total, delay_max, delay_max_ts)
> named fields in struct task_info with a struct delay_metrics array
> indexed by enum delay_type. This eliminates all unsafe pointer
> arithmetic via offsetof() from compare_tasks(),
> field_delay_max_and_ts(), and get_field_delay_values().
> 
> The struct field_desc now stores an enum delay_type index instead of
> four separate unsigned long offset values.
> 
> Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>

Acked-by: Xu Xin <xu.xin16@zte.com.cn>


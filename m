Return-Path: <linux-doc+bounces-85442-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Yat+NL4g9WkGIwIAu9opvQ
	(envelope-from <linux-doc+bounces-85442-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 01 May 2026 23:53:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E27364AFDD9
	for <lists+linux-doc@lfdr.de>; Fri, 01 May 2026 23:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0125F300DE12
	for <lists+linux-doc@lfdr.de>; Fri,  1 May 2026 21:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCF1311C36;
	Fri,  1 May 2026 21:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="r4HWzFjm"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBA5EEC3
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 21:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777672379; cv=none; b=XoT0UA48xg5IHqmjclDZQNUm+0ssQHM/DlttPMa73TxNT9LxC+Vz2zht99X+uEsc7aEqhDyA/zX0uHThLnrmxYrlRJr3w49dq5aYDvu7t4tLq6fLtVLqvmvDYJsS65jzAuH0JeLPdQ2qsfYCyq8qlNoBJX+6t71y1tky5IcFx+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777672379; c=relaxed/simple;
	bh=OFJyIQpSW8r+yoi2lzXB8S7YrNyJAYVHZd0aGgFoJlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZtdiiwXROYLpXxteR6puVJPTjb8T8u4WNnpvTIBQhxO4VYwea0Z5NrNIUVaw9QL8LOWTNsP1v9FNSLM0sfkiDHe71kAT0YoG4BZFDdwuonEct9BgRUqZJdCo/N819qzqfVLpT5gB+9Wo7zJUtjMgh8gtUl9l1bOAIvMeLyO8F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=r4HWzFjm; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=LFYadDrg3AdUKlaN7Unac9OnhO0ynkQQCr0sE1JM+bo=; b=r4HWzFjmje1o7dEHY91CO2OPEV
	/crf6EGwnenCMcUXmEx13FuhZzGhgyd4qbmc8OKoqBhy+0PZGh2m7+zOXmKn3zaIf7ei9RKueTmUJ
	8roY2KOP9P3JpR/0hpiOsfBtXhenQIJ+xYJPQMpVHuqiagYVAQIfghH3CMeh3Q1tctFzSbO6f69uy
	NSLcqmCs/zG/whNPmhXJXenSbcIKunjS2gish1XSMcm3WQCcymKSAZ2+bOQ5giSbz8Gta2uYqDRHu
	ts++MJUWY+vOSqQ1ZOKdUstJu6NlSY3V1dVDMSkntbcFdorJf2eYE4ObTb1X+xvzAglSeJaj1lMql
	XxE9vsyQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvn4-00000007ikD-2S7B;
	Fri, 01 May 2026 21:52:54 +0000
Message-ID: <daad5323-e088-409e-b516-0529e5d7ab13@infradead.org>
Date: Fri, 1 May 2026 14:52:54 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: errata: Reformat table for IDs
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
 catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <0d4c8f3968e5c5c0a6f3dc295c3e9f696b9006f4.1777657487.git.robin.murphy@arm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <0d4c8f3968e5c5c0a6f3dc295c3e9f696b9006f4.1777657487.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E27364AFDD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-85442-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]



On 5/1/26 10:52 AM, Robin Murphy wrote:
> We have some inconsistency where multiple errata for the same component
> share the same Kconfig workaround; some are one ID per line, some are
> smooshed together, and some are entirely separate entries. Standardise
> on the single entry, one ID per line format so that things render nice
> and consistently in the HTML docs, and it's simple and clear to add new
> IDs to existing workarounds without churning the table too much.
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

LGTM. Thanks.
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
> v2: Rebase for 7.0-rc1 
> 
> One last tilt at this windmill - at least I did remember! :)
> 
>  Documentation/arch/arm64/silicon-errata.rst | 47 +++++++++++----------
>  1 file changed, 25 insertions(+), 22 deletions(-)
-- 
~Randy


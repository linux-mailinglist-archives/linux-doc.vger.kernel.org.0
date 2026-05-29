Return-Path: <linux-doc+bounces-89926-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNf7D8f9GGoEpggAu9opvQ
	(envelope-from <linux-doc+bounces-89926-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 04:45:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE20C5FC772
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 04:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C81D33013488
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 02:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CB8366816;
	Fri, 29 May 2026 02:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b="n2+M5FFu"
X-Original-To: linux-doc@vger.kernel.org
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAB71A682A;
	Fri, 29 May 2026 02:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.210.214.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780022466; cv=none; b=d+yB8aKsxROs7tQjNtOWuZZXEW1sp3UUuWMtNpnmFuYEI3yKLujYqy8HiaaQtefRQflkfvao7MzOVY4viF4mk3oBemegM90vR7arzcdKxjnwU02nU5eHm8+174HcC3OpvMxOjQ9eBc9SbCWXQ0HB6xWD5hRVowdvXHN+Aq+jkXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780022466; c=relaxed/simple;
	bh=Z6XdDhF48S7c2HyeMlf7I0oXXf/MbmepJPQ5KF0ht2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWeU/09zuKULYGtkjP1Bla2e2dWZUIYrPE+NhBvm92CPz9xLHRU9vWNhEVYgPspW7rAL9s5PHns0VWXVDdNlqgMyN07f3w0FEDMbVv3lMoCOHJkKq29ZuqyOkRcBAkHVDg6/4CgCk9fQhsqAaPTsbzi/bN+nppchbF0uBa3T+q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org; spf=pass smtp.mailfrom=codewreck.org; dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b=n2+M5FFu; arc=none smtp.client-ip=62.210.214.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 8419114C2D6;
	Fri, 29 May 2026 04:41:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1780022463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FdBpLbeSF1+PYunOzClPys8cqaeaZJN5U3Td3axJnzs=;
	b=n2+M5FFu33zteclvxVDDU/lBk3qmXO6hI9LTvkO4fwgSaJHJpDE5xRAXrqi9o0bkmhJdHe
	+Rustp+69+W71o5S5tfq0A1sE5Gn3a2LwKTOb9D+Q16c21uArzzAejqE4TyRu++UKkEEOc
	by2msa6QkKvIyaR/55HLDO0sa+AnelA+sjCAWpO+28Qi1Y/LUDcUtRrqz5Z1Zh97QYR2ux
	AI3W00lBya7FYpDwHuS5b+XyAyTxwuWF6ePnLXwpObb3ZuZxyMqDVeA1U8/Q9Xb1+Wp3pD
	ZKtt/aFDvtUbmd1heVyo3z6oSP4o1L+MJi0v+LBb0i4pYC81eXSfB7Vg1VcQiQ==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id d8b8d90a;
	Fri, 29 May 2026 02:40:58 +0000 (UTC)
Date: Fri, 29 May 2026 11:40:43 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Aayush Patil <aayushpatilsch@gmail.com>
Cc: ericvh@kernel.org, lucho@ionkov.net, linux_oss@crudebyte.com,
	corbet@lwn.net, skhan@linuxfoundation.org, v9fs@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/filesystems/9p: fix broken external links
Message-ID: <ahj8q3KPuS825WRP@codewreck.org>
References: <20260510182856.17569-1-aayushpatilsch@gmail.com>
 <agxW8An7fRApCY1r@codewreck.org>
 <CABc3pKGKCLydod2NOgETP-z0T5BHep8hyy7z2UF3o+DrWEh5yw@mail.gmail.com>
 <CABc3pKEY8QvQzWPeU9QGBFG1dtGSdseTRdXF_5MUX1MeNBV5QQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABc3pKEY8QvQzWPeU9QGBFG1dtGSdseTRdXF_5MUX1MeNBV5QQ@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codewreck.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[codewreck.org:s=2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[codewreck.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-89926-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmadeus@codewreck.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AE20C5FC772
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Aayush Patil wrote on Tue, May 19, 2026 at 07:23:38PM +0530:
> Regarding the replacement links, should I include them in v2 or leave
> those entries removed since you're not sure if they're the same files?
> Happy to go either way.

This is fine as is, if Eric replies or someone wants to add the links
back we can always update again later

(I've also fixed the typo in commit message directly)

Thanks,
-- 
Dominique Martinet | Asmadeus


Return-Path: <linux-doc+bounces-92957-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id afrfIktuNWrDwAYAu9opvQ
	(envelope-from <linux-doc+bounces-92957-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 18:28:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C826A70DF
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 18:28:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hvdrqDyF;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92957-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92957-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 022B1300E701
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 16:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453523B8406;
	Fri, 19 Jun 2026 16:28:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206AF380FF1
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 16:28:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781886503; cv=none; b=Afjyvc3WLJFPA9c9xp+uxTOcBzrsVxbHtZegTl1DTB1Il0pJt5wcaLDAFpK9WxoVL0UjGLZBZQAoLttIQ1sn+JarzUCBxKdv06U5GLayxFhWwJoMIb261SImlfTN8v1PhiAvosbsd+aHtjY21NZtcbnNTQeSlXQf5NFiK5LMMXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781886503; c=relaxed/simple;
	bh=GPVLW6dahVBj2W5GEYGwLHhkC3Sgqj8B4Bu7XaUs0D8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USjYOFOGX1f1nj6/1zqLWPAEQmTL4NfZE/izQvTY0vfW9ufrs1uCXFktAv/af+D2/4V+LyHze5Re3T2ZYPjeBTWfMFPqrVaD92g7LnFmvywPT54h5AOxoDnvby6Z93bkZPkl+NmeC5By8tiMyuxwCFj/XzklBR1ifRyfslbW6UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvdrqDyF; arc=none smtp.client-ip=209.85.216.66
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so1534966a91.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 09:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781886501; x=1782491301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bVDIeJ6MuKfwP2LNcBoxiszDtASW4mF8xuBFi2RWnQ0=;
        b=hvdrqDyF3jzK1+9aE6XmXhVL7KDtDiWRcbQeTRzsrWedfsEEcsXlTx379j0R2iAkRV
         8J0lhC0I+7MYmDeKc4ssHuvVs3C1uP1K7CgIUsm2rAZRJee4/g2jg02rOC1GIFLsXakM
         yhfjgH8hoNEscw0i2zBSeaGYLwLp+jB5Qmm+cL9+4YTYCHmGtQwK9uuQZZAjJY5icMtZ
         EynGM18anIeG3vztbjUngCip/xHKHCo20aNA9NIED+QEbBu+kf4nrgKHlxZbpC27jOgi
         qpv1xxOLRoJuh7tHQHppMuxTpWrsZ2aWucxXNvrAiduIhOe1b5rzRIzUk7iq4TXROf9s
         jz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781886501; x=1782491301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bVDIeJ6MuKfwP2LNcBoxiszDtASW4mF8xuBFi2RWnQ0=;
        b=Anla+UkuHIwwhtjjouSjDepc12rbC2QeHNgYH/n6KfTfRHFpUAWtlIsPagd9BEUroj
         VNnLVmWF1OOjilEMd7rNQlZku0S/qJCaxXFUuunSOXiB7KgBSdNA1HlNszmNYXQfzIVx
         vDLlIahXo/5PzIf2BzSWhzN33l2mf+K33pqunOrhpbQwkaJd7msL6ZLoAWeqzNzCk8dH
         iYC6EuQllw/RphbCcG590NX8m2eXVmK0F/HVoODYF9qlREL/NIKJRtm5jxz26u3zGXM0
         u1ZgRoGey9MAPA7bmjVu2m6dOmrgV6E92kokhrj94p/OqzDSWHqGyhEuqT/mX1Z5Zc29
         d+9A==
X-Forwarded-Encrypted: i=1; AFNElJ/ZNdBXhwr+pYxnnHf9SFFQZ24zqSUjtejyXAddeXVwDgMVNoot3JWNIF7TOq0Nzgx0Cp9+RaSaFtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTjw3U4BbYVOEXDPWh8UV+yqQibqbjMfjt9fh5Xz/X5rAOcp40
	KvT8ug8g2cpdx9cF33J1UM8MHlEO1MDwNrfMwgqlHqm3daAU7CsTzEPr
X-Gm-Gg: AfdE7cnRQo61OAPpxPrqTu6Kgc3jAgZIXSAY5fsfuvlyC/LrRFRJ9M6LLHx7Kmm9F4q
	DfSHBDiVo9P0vdOEhFyvKSB5v18n2qtDZEmoq+VfhVnPqLJ7WariC2rNw5v8z2dAQGUoiIFGLMI
	FNpQbQ47lRUySFVX8yTbzJG8IaEgWw785vD9UZfsSQWKad7l4Xhi27lWOYMoyP/w2sllb/Jk7Ek
	wilw6MjCirndLsp55lSUiXueyMxwwGXg+uZwkmL5KfDDTynsUqUTcFano58CIQCcE3+Nl3aa2Ek
	tShUFmjBh7kuthmMAD75JepHgXsNDVPxDcHAsfstf0xWQSZ86UCpKCMXQ/7ZOiXEtLnL2MC1kUA
	QM2hVdYmNAWw5lpyHs+cP9ak9nDU4N93nb7pQ5mDqDH1fofpY6QHK/HHk16thTc0FzqgZux577Z
	yE09Egvc2NYK8IjKznN8E4
X-Received: by 2002:a17:90b:4b81:b0:369:1dbb:4732 with SMTP id 98e67ed59e1d1-37d18637020mr3626797a91.0.1781886501434;
        Fri, 19 Jun 2026 09:28:21 -0700 (PDT)
Received: from [127.0.0.1] ([103.142.140.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f315842sm47345a91.17.2026.06.19.09.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 09:28:21 -0700 (PDT)
Message-ID: <2cff714a-1662-4c17-a855-e9ff64d0bba3@gmail.com>
Date: Sat, 20 Jun 2026 00:28:16 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] docs/zh_CN: update translation of
 doc-guide/sphinx.rst
To: Jonathan Corbet <corbet@lwn.net>, alexs@kernel.org, si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260619140245.1982921-1-qiujiandong1998@gmail.com>
 <87ldcatxm5.fsf@trenco.lwn.net>
Content-Language: en-US
From: Jiandong Qiu <qiujiandong1998@gmail.com>
In-Reply-To: <87ldcatxm5.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92957-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[qiujiandong1998@gmail.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiujiandong1998@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4C826A70DF

On 6/19/26 10:26 PM, Jonathan Corbet wrote:
> I've added a couple of comments, though I need to defer to others to
> judge the translation work itself.  I do have one question, though: did
> you do the translation yourself, or did you use some sort of tool?  In
> the latter case, you need to document that usage with Assisted-by tags.

Yes, I used Codex to help with the translation. Sorry for not
documenting that in the original submission. I will add the appropriate
Assisted-by tag in the next version.

Thanks,
Jiandong


Return-Path: <linux-doc+bounces-94056-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VpPONdi2QmpUAAoAu9opvQ
	(envelope-from <linux-doc+bounces-94056-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 20:18:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AEA6DDF61
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 20:18:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="s5/UGfiK";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94056-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94056-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 436F8300AED1
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 18:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89531379EF2;
	Mon, 29 Jun 2026 18:17:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2CF381AEB
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 18:17:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757076; cv=none; b=RFcsiVC8cmTpR9vK63oMwIE8h2+Br+M/fcAMd51ZtRdq/MV+DsdxDliWabgS/0CPIIxeWUbcUfPFDGv7KoL1Q6LonElAUd51finL3v6ATIwQm/X8lr289c4FcnBo1ipmswDLOwvVM0k6F2vZ2RVf8jS465YZKkZojE8N/vkIhw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757076; c=relaxed/simple;
	bh=9Imzwz6EgRLo5/3ynxMxR6x7BHSZy7sXOrf/tVTTZgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBFM/hQMtRW1F5xOisqffrzeyjqYXQgYDFZCEOS4aHtvx38G4ITHJsxALAXphtfM7jplrORw7Yqa2fZm4Lr8PfuNZtU2lyXOSkd1kJGQSSptPVftiSssIXwT7YdiTaflUQsmTM/YB7w030gKku4Iv6coX+ClTvfKWPrSUuW7iG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s5/UGfiK; arc=none smtp.client-ip=74.125.82.180
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30eac9abd79so2682187eec.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 11:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782757074; x=1783361874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VfUxWLWQvY9mB/81AVkSpyLi8QxfdBiALIQMC7mv16k=;
        b=s5/UGfiKQYDxEg2MV5pd+YF5sVbXxMhJFk+RIJk3bwUUYT6nqIjHNfGBDHQQJ4Z+kA
         bCvBr4meDT1R25dHUFI4KcYhvsbLAgq60br2UhPc0J6087FfrwpDbwf1FNeWTI38y1GF
         6jfy+Q1XEIdf8RB7ARtSQlEJ6Q3fMcXq2Zc0tC/QBy6Gr+FyBsjnOm95H7yqy/tMqLV9
         9VccLQIyBRGue+/fYPOOu4u5b+00vROgQEripJPUn71xJJo+KSIAGsY79EQNfBZdcdPJ
         XQdIWaeSX/GufGb9HpRlKBG3TWM7+6Dsnm5D8bGMbhE51jXYVJiY7a/HKcgHxXdbTlDf
         O3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782757074; x=1783361874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfUxWLWQvY9mB/81AVkSpyLi8QxfdBiALIQMC7mv16k=;
        b=pOP+EA8eNi3IRSNjQnOGI2EivCU4P3vLUmPtQAcDEjCAFCI7vcAVaYELm56m7L7vYZ
         r+QZUL7575xSHdmcZUBraGp6VXvRKHIeXci07gN6usD8wOb9ztJJmZ56jQ8sPVy2r9xV
         PzzQksQnJJwdSyAYXp8T+2NCMxLt5BnvhipFaeYextQjEP3CWzDwmZOPTzwUqfIszqQT
         9Ia7Wy2ZUjUIGqE3rMBhPqqIiInl5bY1Hj6WrUNo9w2YGxVEVsNPO1d+JcW33VMSzfxl
         onpaEXm1JRcP1ulXBcfoqSjkr1PFPe8V2eYCoibYaiDoQU2yCptSUicU8mFS9x9JX0TX
         E0YA==
X-Forwarded-Encrypted: i=1; AHgh+RrBFlJdDcSVuO5E0mGc6l5+kfj2Ev7D53olvPvGQRy9nMoMPmt/6NLuiKEE876Bj1i6HlIsWSwoitU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD37mbxD3e9jY3ZRaYDBtfOkm9GSUllqtZ74aTpbyZV6OUg9nR
	15MA54dslom7locy3Xmu6AziEY09ghkHDfFiKgLxmqOMbx+T/dwfrAiV
X-Gm-Gg: AfdE7cn0otCpAHUhr79Mjd+jWWzalARsvoR4nuDbcEr2v2d6rfg3cL9hlan5wk7YhiJ
	qbc+flUdTaMt6nrl295LJEUNfZGAfx5JvFj4rFFLbwBR/iCDtfA5TB+FtlJ2ZwPWJLci677KAuq
	pJOrxXAMQHicD5H0dhiGridztgE4+qJOI49VRjme3jgNT3XyDykW5zUvo0Nptkx3qRuqTNjk/52
	Yw8G/BJMRre8857FckxcjGQnBbwjE58kIQrFZxiY501lJO4eGtjuSCzbKK1kw7YUNcuShuteGhF
	1jfVOuLfPq75PIgm0CrUWSBdgPknJk2nThT247L+WCuFLTrp9O3s21gbabzfasLauVuqdEox9HB
	57hQywplJl+lUKE94A5GmAl7IXo+Co+E98PlUehM5vtOlsxZKAXCG2ZdiJIUkL2SPD2bBFfj80Y
	uzZ7vOu1B8xtnCtbmAyKJzntPa1mFeClI2SX9zS9Aioqdw
X-Received: by 2002:a05:7300:72cd:b0:30b:f5c1:4484 with SMTP id 5a478bee46e88-30ee13a2040mr379952eec.35.1782757074358;
        Mon, 29 Jun 2026 11:17:54 -0700 (PDT)
Received: from fedora ([2601:644:937c:6c90:6d4e:7b2d:4a39:fb0c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fc12e7sm70363eec.8.2026.06.29.11.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 11:17:53 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:17:51 -0700
From: Vishal Moola <vishal.moola@gmail.com>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/mm: Fix braces
Message-ID: <akK2z2q_OWiNBpYO@fedora>
References: <20260629161156.90213-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629161156.90213-2-manuelebner@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[vishalmoola@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:jgg@ziepe.ca,m:leon@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shakeel.butt@linux.dev,m:rdunlap@infradead.org,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94056-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishalmoola@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,infradead.org:email,fedora:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47AEA6DDF61

On Mon, Jun 29, 2026 at 06:11:56PM +0200, Manuel Ebner wrote:
> Correct typos in mm documentation by balancing parentheses.
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Vishal Moola <vishal.moola@gmail.com>


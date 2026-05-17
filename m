Return-Path: <linux-doc+bounces-88078-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJlXGPRSCmpazwQAu9opvQ
	(envelope-from <linux-doc+bounces-88078-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 18 May 2026 01:44:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E0D564693
	for <lists+linux-doc@lfdr.de>; Mon, 18 May 2026 01:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DE66300BC8E
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 23:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640923D6475;
	Sun, 17 May 2026 23:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WK2w6zkg"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4083231F9AD;
	Sun, 17 May 2026 23:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779061415; cv=none; b=m/cZYoLC9cVNZwJxF0gN+3+hEHRspImHhYsLv0eh6HawVYbzcTvRkErATKPS0lskcb8DBdrZnZ0QBrWsVXO/8i7tsnCiTP65rMrCPejqf8PxLRIdwKbcQL1YPSoWwVqHkyLim75fDnx13koubyIeQNU5KZPxsV+qIMU0ATOcEM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779061415; c=relaxed/simple;
	bh=C58ff92wWoNH074Y3QiAq04Vkd69pqekAVx6WD6vV3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dKC4NVwI/gTRPRGIZvZ+eIHzAZ4cxnjz1hPE5CpJAknMRrl7qorulebp0TTB1Imp1GZCnU44rHTK15NyDKGWmIFukt7qDkk5j9TseNSx464ht3dFZ0G8+o/Rpr6juwDuC9pFxeS9dK3XbkryfqKhuqsvhfKV9Gz8QdeRMqOHQRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WK2w6zkg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67094C2BCB0;
	Sun, 17 May 2026 23:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779061414;
	bh=C58ff92wWoNH074Y3QiAq04Vkd69pqekAVx6WD6vV3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WK2w6zkg+hyM6I0VJmSXyURzLnFtpc8fa4kp/+6F9Gi5LZf4krxwBHJnM417Z1HwV
	 9umdTxCwTRdKgS9Ti0iL57DO/fztm1+KxMc+o7XdMEC5t2Ww6ErmYWZz1I4mUPgsXF
	 91o+JFyKX1LUceV66zsy+c/FSECXK4H/1woHnRs7IzggpjLwAhXxLSOyVMjFHrAyUI
	 eNSuVol+evLXtWKdS6hblQPBl4JNN3FCSD+f8pW3rOrvzqkpsgR4IJH4vUjmZl5/Ax
	 kygbhDx1GVkFlLh6P9toqqVBHyQ0oHKjQD8aCWbCgT5lUbtdlLZ68D+Tj2rlfdMusy
	 W+rTYYsTPrm+Q==
From: SeongJae Park <sj@kernel.org>
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com
Subject: Re: [RFC PATCH 5/5] mm/damon/paddr: add time budget to migration page walk
Date: Sun, 17 May 2026 16:43:24 -0700
Message-ID: <20260517234326.89365-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260516210357.2247-6-ravis.opensrc@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E4E0D564693
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88078-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,kvack.org,vger.kernel.org,linux-foundation.org,lwn.net,gmail.com,micron.com,sk.com];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sat, 16 May 2026 14:03:57 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

> On populated physical address ranges the pageblock skip optimization
> alone is insufficient — most pageblocks contain at least one allocated
> page, so the walk still iterates millions of PFNs.

So my questions to the fourth patch of this series are also applied here,
especially about the assumption of systems having most memory free.  I will
hold digging deep here until the high level discussion is completed.


Thanks,
SJ

[...]


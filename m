Return-Path: <linux-doc+bounces-77728-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CUECj8ap2m+dgAAu9opvQ
	(envelope-from <linux-doc+bounces-77728-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:28:31 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BA71F49E5
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C43BB3080133
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2026 17:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09AD33AE1B7;
	Tue,  3 Mar 2026 17:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="BFRspSID"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5213A6409;
	Tue,  3 Mar 2026 17:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772558857; cv=none; b=WIPrmhyen3uykJMtyO1A1DHf1vgCbGqbAfXftM4iYsM8jZ/Ldsjm8nFGfnLcG0GPADJpLF7ykp7PnnjCfdfsu+uS6Ouxvr/dtX1lpmgX/wKV6SxWALZlVtG/bp0q/vnfbH6n3dvg9RXFTJp6EGH7vraJ8AGlLgyQV29ctjrGmPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772558857; c=relaxed/simple;
	bh=Cr20l1i5lXlqRpNgR9zGaZA9Tmse+fquECNM2pr3SEc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mzCgLKJnpXWr58+ww4ilYEF0O6pLEzpa9ti+qOcJYYwCdQeLPvPFwG4hj12BN8xlwmWA8YjWjxAwNpKKx9NoeTZa4q0nxdWMDyq/yPitDh8Bbxx3iJOZGf/ywyy2YXQaTfz7my5nILC1AsM3d6pPxjyUdG/31pGzY1mzQ9g3USs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=BFRspSID; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 301B540429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772558856; bh=9f573jxNSxx8H1raqeaD2upHQxMZcgdM8J2J079L11w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BFRspSIDBcUZPcj3Tf9JrnX6xcvuoWGybauK2ZTUd0W92sutuzRSiTj8J4MXdVAot
	 uC8LOit4dEeA6pM73Jsm+DlPhq0Ql2X9Ss3TWXGUR0haOMtCGy0WSD/0CqtqH1OzaE
	 Ey1K6rU7CQEat1tRNOhTt1F3cKVP/rgZ440BUSFFWqAfFEttiDkq8pcgvrlyC74628
	 hB6Vac6K/m19P0aAQ7YxswTXF1oH+A/L1q0KbEpguEvVT0MVSf89tVOVkIe2K6jKlN
	 qTep/L08zm0B0BMfn7fAGg3ONPUI+YCVnM6DerKv1kG29VGKdZUxil1ItGvk1sL9GQ
	 6QuT1QuudIEQg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 301B540429;
	Tue,  3 Mar 2026 17:27:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shubham Chakraborty
 <chakrabortyshubham66@gmail.com>
Subject: Re: [PATCH v2] docs: sysctl: add documentation for crypto and debug
In-Reply-To: <87ecmb5gc0.fsf@trenco.lwn.net>
References: <20260223203724.20874-1-chakrabortyshubham66@gmail.com>
 <87ecmb5gc0.fsf@trenco.lwn.net>
Date: Tue, 03 Mar 2026 10:27:35 -0700
Message-ID: <87seagbz7c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 71BA71F49E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-77728-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linuxfoundation.org,infradead.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,lwn.net:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,trenco.lwn.net:mid,infradead.org:email]
X-Rspamd-Action: no action

Jonathan Corbet <corbet@lwn.net> writes:

> Shubham Chakraborty <chakrabortyshubham66@gmail.com> writes:
>
>> Add documentation for the /proc/sys/crypto and /proc/sys/debug
>> directories in the admin-guide. This includes tunables for FIPS
>> mode (fips_enabled, fips_name, fips_version), exception-trace,
>> and kprobes-optimization.
>>
>> The documentation is based on source code analysis and addresses
>> stylistic feedback to keep it direct and concise.
>>
>> Tested-by: Randy Dunlap <rdunlap@infradead.org>
>> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
>> ---
>>  Documentation/admin-guide/sysctl/crypto.rst | 47 +++++++++++++++++++
>>  Documentation/admin-guide/sysctl/debug.rst  | 52 +++++++++++++++++++++
>>  Documentation/admin-guide/sysctl/index.rst  |  6 ++-
>>  3 files changed, 103 insertions(+), 2 deletions(-)
>>  create mode 100644 Documentation/admin-guide/sysctl/crypto.rst
>>  create mode 100644 Documentation/admin-guide/sysctl/debug.rst
>
> A few other comments:
>
> - This is the second v2 you have posted, which can only lead to
>   confusion.  If you only change was to add Randy's Tested-by, there is
>   no need to post a new version just for that; it will be picked up.
>
> - When posting a new version, it is good to give a quick summary of the
>   changes from the previous version, below the "---" line.
>
> - Please slow down a bit, there is no need to post multiple times in one
>   day.  Give people time to look at your work.
>
> For me, there is no need for you to post a new version unless there are
> other comments that need to be addressed.

Now applied.

Thanks,

jon


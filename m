Return-Path: <linux-doc+bounces-93751-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /eYbNzaqPmrUJwkAu9opvQ
	(envelope-from <linux-doc+bounces-93751-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 18:35:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 662106CF274
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 18:35:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux-foundation.org header.s=korg header.b=PQqM6y8Z;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93751-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-93751-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E89E30E2C9F
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 16:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9673F9F48;
	Fri, 26 Jun 2026 16:27:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBCA3BB673;
	Fri, 26 Jun 2026 16:27:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491265; cv=none; b=INrdZO7wvd5Y1umRdinJuB46fj7kIz29o/JOQZcoNZhCxcuTnsFdNfE1dkJVOdtduugDM+aJcl2ehZgRo/PScOmFYUll6KYU1NvTFROQq/bZkEtg3ygGBl+hkoq55MAlm0/A2EEad3rcNZPrly/sfTpYzsfLmkz5dVpBUcp0qxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491265; c=relaxed/simple;
	bh=ImorTgLxdVBZ8KA+SoiC+IQN13SzOs8n+JsQl8npZi0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eYM4YETvcsRI+riLQCfY8bHNooqQ6aiflZ/L6THqVo3F/G+EnJch47x3xeBKAwtHvZ+ZmVsqZSrs+Msi+pHgW1jKila4VIMV5S1Q0lUP0HgVY+Ii7lNjfPePzshii3vvEbyfj5Zd0+o48S1poZjnM/SE+YCVosR7yqryx931h0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PQqM6y8Z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129131F000E9;
	Fri, 26 Jun 2026 16:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782491263;
	bh=6xdhB1h20JevoCIK0FA3vdUPT1iU5NQ8QI9Cuj4CG3U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=PQqM6y8Zwq77LOJE9kupv7UIeWj6h/06JBTFkhuilrKOfhlxaX3dctYkVnn8BXe7h
	 p4nJis+WgZhlJnu+H/F9D7juqnDnGg3pyP2kzyGY15N9xdJerS2x0e0oumg42fh6wU
	 On9cS26zBQWDtUbm0SoX4z0UCj+TB8vYPO5u5xAE=
Date: Fri, 26 Jun 2026 09:27:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Breno Leitao <leitao@debian.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, "Liam R. Howlett" <liam@infradead.org>,
 lance.yang@linux.dev, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: [PATCH v10 0/6] mm/memory-failure: add panic option for
 unrecoverable pages
Message-Id: <20260626092742.160c3c10196852f075b3f5e3@linux-foundation.org>
In-Reply-To: <20260626-ecc_panic-v10-0-6dacb8ad024d@debian.org>
References: <20260626-ecc_panic-v10-0-6dacb8ad024d@debian.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:leitao@debian.org,m:linmiaohe@huawei.com,m:david@kernel.org,m:ljs@kernel.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:nao.horiguchi@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:liam@infradead.org,m:lance.yang@linux.dev,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kernel-team@meta.com,m:naohoriguchi@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-93751-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,vger.kernel.org:server fail,linux-foundation.org:server fail,sashiko.dev:server fail];
	RCPT_COUNT_TWELVE(0.00)[23];
	DMARC_NA(0.00)[linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[huawei.com,kernel.org,google.com,suse.com,gmail.com,lwn.net,linuxfoundation.org,infradead.org,linux.dev,goodmis.org,efficios.com,kvack.org,vger.kernel.org,meta.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 662106CF274

On Fri, 26 Jun 2026 08:33:14 -0700 Breno Leitao <leitao@debian.org> wrote:

> A multi-bit ECC error on a kernel-owned page that the memory failure
> handler cannot recover is currently swallowed: PG_hwpoison is set, the
> event is logged, and the kernel keeps running.  The corrupted memory
> remains accessible to the kernel and either drives silent data
> corruption or surfaces seconds-to-minutes later as an apparently
> unrelated crash.  In a large fleet that delayed, unattributable crash
> turns into significant engineering effort to root-cause; in a kdump
> configuration, by the time the crash happens the original error
> context (faulting PFN, MCE/GHES record, page state) is long gone.
> 
> This series adds an opt-in sysctl,
> vm.panic_on_unrecoverable_memory_failure, that converts an
> unrecoverable kernel-page hwpoison event into an immediate panic with
> a clean dmesg/vmcore that still contains the original failure
> context.  The default is disabled so existing workloads see no
> change.

Cool, thanks.  I added this to mm.git's mm-new branch.  Next week I'll
move it into the mm-unstable branch, where it will receive linux-next
exposure.

Sashiko identified a few possible things, some pre-existing:

	https://sashiko.dev/#/patchset/20260626-ecc_panic-v10-0-6dacb8ad024d@debian.org


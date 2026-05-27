Return-Path: <linux-doc+bounces-89781-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDqbF4FIF2qS/QcAu9opvQ
	(envelope-from <linux-doc+bounces-89781-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 21:39:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 524F25E9946
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 21:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DBB530225E9
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 19:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2164391833;
	Wed, 27 May 2026 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="k0WaPiIE"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794DA37BE9E;
	Wed, 27 May 2026 19:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779910779; cv=none; b=LjsTjDDHOikV+tXO1IbvvFBY6QNYy2+ahnaWCPWnwsevgtHEk29CqVuS02NLf65yRM9qa0uz/uVNanML9Spa7kJs3IHXcV1jhD3Y8YYwHUGvVg8ScdR5lAITiYW4roRSOjg+o47tSNg7gqMzdXsKOV7FEq3bm8zeesZRx1RYGqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779910779; c=relaxed/simple;
	bh=p8AxX9pryeSSlwsGfbi7RLl+AU19dVQGc8b5AFEemtw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ODpZueLhBESHCS9HEHmYuqhJAeE16p4n+weL/Tvlbt+Qgc08sXuvbOnqjxHXQ6F2/mOKzTBOCxrqoQip/qHkCfKGasBpFja+rNnnGjFPHikG3jrfVdb6dLIDSw+uTnI/YQLO8oF4r1P/xaLtllKj4E2JJ0Win8jtT2tSn9hu9y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=k0WaPiIE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A7D1F000E9;
	Wed, 27 May 2026 19:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779910775;
	bh=Qje0s9+5g7mwBQLx6gyz3RzpOX1+aY/PlmzgLifJRzw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=k0WaPiIEBwU1aZfVY3U7+RBAE7VXMsxFrl481Ofs/0gzrkClEzhhWW/Af7E23YCli
	 0ipemC3dY0d2opQX7XXgRRYAotjFovhhh4r5uKR3k5z7L+JCzDDk0TT0+UfU079iBy
	 oTL2Y855DeQzOc+E+D7mBaQJDL3axvoPT9QZ0l5w=
Date: Wed, 27 May 2026 12:39:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Breno Leitao <leitao@debian.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, "Liam R. Howlett" <liam@infradead.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, kernel-team@meta.com, Lance Yang
 <lance.yang@linux.dev>
Subject: Re: [PATCH v8 0/6] mm/memory-failure: add panic option for
 unrecoverable pages
Message-Id: <20260527123934.77f789b4ecaf403f0ec6cd31@linux-foundation.org>
In-Reply-To: <20260527-ecc_panic-v8-0-9ea0cfa16bb0@debian.org>
References: <20260527-ecc_panic-v8-0-9ea0cfa16bb0@debian.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89781-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[huawei.com,kernel.org,google.com,suse.com,gmail.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,infradead.org,kvack.org,vger.kernel.org,meta.com,linux.dev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sashiko.dev:url]
X-Rspamd-Queue-Id: 524F25E9946
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 07:06:13 -0700 Breno Leitao <leitao@debian.org> wrote:

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

Thanks.  That does seem useful.

I'll pass at this time, due to -rc5 and not-very-reviewed.

AI review said a few things.  It claims to have found one pre-existing
issue.

	https://sashiko.dev/#/patchset/20260527-ecc_panic-v8-0-9ea0cfa16bb0@debian.org


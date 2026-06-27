Return-Path: <linux-doc+bounces-93806-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PRpqLVuBP2r1TwkAu9opvQ
	(envelope-from <linux-doc+bounces-93806-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 09:52:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EC36D16C3
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 09:52:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eoVc6vc8;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93806-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93806-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94A5E302BE3B
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 07:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C9D3093DF;
	Sat, 27 Jun 2026 07:52:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7893B25B0A2;
	Sat, 27 Jun 2026 07:52:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782546774; cv=none; b=Op4GGnz8fBRoDX9v4ggVr9qaimFGYg3M8FHpVXJ+8JMSgHnmeC0TzjWv97sOMKYMxPeN2W5XCMbz9mqozCislB/XdI6nhy7PJxDoIDBwtZ4AM19DW0BzkOyrWL4pQZPoKwrkxWg6CeOLa1AyRuk0TTS8b5BBjEnoZRJ0DEiDzSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782546774; c=relaxed/simple;
	bh=RVlQtCvZvvv1cGr13Nszm1cfhyX21UVNw/O9V+ZI294=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oG7gdmUTFhYeIq+xeBwNViSznbgsMbxwIOlYgwMfyk32H7sDH2oIwwT/4aToNsd2b7/BZpZbRwHfVnBvPJBUFVw7uYbX1eYVWvCMBBTk0oP1W2YXzpNC4x1BjH+DBpiOf/a9nXT9tAz6XWjPyzJdTyUG0Dj7ieBrMgEXmQij+20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoVc6vc8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460311F000E9;
	Sat, 27 Jun 2026 07:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782546773;
	bh=S0znFcK8j0MuvFWz2pu1AoWSdjFNtXQNpSRnuMwlEzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eoVc6vc8yM9DIkM5Wo0O2t6uxw0sx2GB1/c2P9l0zVF+KOXagAc6gIrZVyliop+Qd
	 7nfZY0dAkzYyVw8jAvnHGx5geA4y/4CXYLq06OXBuKn3reSfTXhObbuHe9gQ5ZaFuT
	 lnyo5uaI8nyu5VAEtD/9IkEBv0GcC2DfWs3wxxr/6FtTbubs4oHPPXIVELVf4K+7VY
	 WgmFy2isk/o9L4WzXu/02pEIqSp8VuH6m8O3I3FqFMTgIE1ochTNLkzHylHG1NO/Nm
	 hlANvs76XOjLm23eV7mDwVjSLPNJUEtln/VbUrO/GiOuNH50gJRqnGhSm+ufJ+CDu7
	 A0lMLVpLMK2aA==
Date: Sat, 27 Jun 2026 10:52:42 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Liam R. Howlett" <liam@infradead.org>, lance.yang@linux.dev,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v10 6/6] selftests/mm: add hwpoison-panic destructive test
Message-ID: <aj-BShkN6BXex_ku@kernel.org>
References: <20260626-ecc_panic-v10-0-6dacb8ad024d@debian.org>
 <20260626-ecc_panic-v10-6-6dacb8ad024d@debian.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626-ecc_panic-v10-6-6dacb8ad024d@debian.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93806-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:leitao@debian.org,m:linmiaohe@huawei.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:vbabka@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:nao.horiguchi@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:liam@infradead.org,m:lance.yang@linux.dev,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kernel-team@meta.com,m:naohoriguchi@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[huawei.com,linux-foundation.org,kernel.org,google.com,suse.com,gmail.com,lwn.net,linuxfoundation.org,infradead.org,linux.dev,goodmis.org,efficios.com,kvack.org,vger.kernel.org,meta.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62EC36D16C3

Hi Breno,

On Fri, Jun 26, 2026 at 08:33:20AM -0700, Breno Leitao wrote:
> Add a destructive selftest that verifies
> vm.panic_on_unrecoverable_memory_failure actually panics when a
> hwpoison error hits a kernel-owned page.

> +ksft_skip=4

...

> +ksft_print() { echo "# $*"; }
> +ksft_exit_skip() { ksft_print "$*"; exit "$ksft_skip"; }
> +ksft_exit_fail() { echo "not ok 1 $*"; exit 1; }

There is tools/testing/selftests/kselftest/ktap_helpers.sh that already
implements this :)

-- 
Sincerely yours,
Mike.


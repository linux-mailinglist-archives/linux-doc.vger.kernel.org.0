Return-Path: <linux-doc+bounces-94026-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tNt6KhCXQmoJ+QkAu9opvQ
	(envelope-from <linux-doc+bounces-94026-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 18:02:24 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2E66DD12A
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 18:02:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b="mqqMcK/S";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94026-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94026-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36C283023C05
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 15:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5244741C30A;
	Mon, 29 Jun 2026 15:51:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD3743C065;
	Mon, 29 Jun 2026 15:51:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748297; cv=none; b=agSu0zYrWKX6N+EusJq92XdDyEVrgjbJKmVQKAW6+isTSciFBLidYJWt+nov2gI906hPaLoelmoFRGeuQund7ReqQul5GU/pEqKxDvxacymZSiC0ulHc33ZV8VEDfXDYZmNxUDGIsG7Lv6yfBrpIRJQIgCyUvRpPLNLhBxdAvTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748297; c=relaxed/simple;
	bh=Jfpbh1KLhwtXc+BxstE95MlO6t2jjL+Fd0+Ww72x8xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSBjdfpWEqKzppjZw+4+zXzs4QvcSRrhq9FRMGTtwZ/Ykt1+1BZ1+tOViKjtxN5Xbauq9czSs60h6M9SFgCyYtHVfc036FhieGPr9/7hWe1gy1/OvKgyBgsgpYv7FWTx3Voaje0RNf5HPj4nP+wktdGK85QW8KNgwxNwRneCnS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=mqqMcK/S; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VeejG0MGjUvD4AhkLMN95MQ3Dsdsxp52TnuJQNelYwA=; b=mqqMcK/S0ffTfirKJEMqcC/Ija
	8MScC4GpriSuke5cvw9W89OocMlePAkwIX6hRqRBAOBICl/Jk24xJEReCepneIo9AsQ6T64BsTEuU
	KJ7v6x86URFpLL6v0b35ayfP3ksScr/ZCwY+9RFl7FSivLEKwP1HPvd4T3Ky0pLFbp0Emy+LGVbAT
	pa+V0JFJJnN0R/VjabN8iyidZewJxzgorjpeRhG+v4WZV/eUD+Er5X0mQ+KbBMLPuVhOWukCRRPkg
	UOfYtf/pIAn+/y4sWQEsSlib+rJMDZxTPoWNtksRVS/9IjviHEnjRXOIgnK+lHrm7PpeaF8mwBgHD
	xA9VFsaQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1weEGA-006Ojz-0e;
	Mon, 29 Jun 2026 15:50:58 +0000
Date: Mon, 29 Jun 2026 08:50:51 -0700
From: Breno Leitao <leitao@debian.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, "Liam R. Howlett" <liam@infradead.org>, lance.yang@linux.dev, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v10 6/6] selftests/mm: add hwpoison-panic destructive test
Message-ID: <akKUDDtww19NVra4@gmail.com>
References: <20260626-ecc_panic-v10-0-6dacb8ad024d@debian.org>
 <20260626-ecc_panic-v10-6-6dacb8ad024d@debian.org>
 <aj-BShkN6BXex_ku@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aj-BShkN6BXex_ku@kernel.org>
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94026-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:linmiaohe@huawei.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:vbabka@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:nao.horiguchi@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:liam@infradead.org,m:lance.yang@linux.dev,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kernel-team@meta.com,m:naohoriguchi@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[huawei.com,linux-foundation.org,kernel.org,google.com,suse.com,gmail.com,lwn.net,linuxfoundation.org,infradead.org,linux.dev,goodmis.org,efficios.com,kvack.org,vger.kernel.org,meta.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D2E66DD12A

On Sat, Jun 27, 2026 at 10:52:42AM +0300, Mike Rapoport wrote:
> Hi Breno,
> 
> On Fri, Jun 26, 2026 at 08:33:20AM -0700, Breno Leitao wrote:
> > Add a destructive selftest that verifies
> > vm.panic_on_unrecoverable_memory_failure actually panics when a
> > hwpoison error hits a kernel-owned page.
> 
> > +ksft_skip=4
> 
> ...
> 
> > +ksft_print() { echo "# $*"; }
> > +ksft_exit_skip() { ksft_print "$*"; exit "$ksft_skip"; }
> > +ksft_exit_fail() { echo "not ok 1 $*"; exit 1; }
> 
> There is tools/testing/selftests/kselftest/ktap_helpers.sh that already
> implements this :)

Ack, let me source that file in my selftest.

	DIR="$(dirname "$(readlink -f "$0")")"
	source "${DIR}"/../kselftest/ktap_helpers.sh

I will update, thanks for the review,
--breno


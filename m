Return-Path: <linux-doc+bounces-84485-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qd8POg5n62m2MgAAu9opvQ
	(envelope-from <linux-doc+bounces-84485-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 14:50:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7300745EA81
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 14:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B28CD302F242
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 12:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BE33CEBBC;
	Fri, 24 Apr 2026 12:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cFpBcO2v"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AA23B52FD;
	Fri, 24 Apr 2026 12:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777034921; cv=none; b=ZhNZrte7n9aYqrM3b+acBXRMn+aXT3HbTM7mjb1TbyolCMFvDKh0hkgV9PG+zrqmfyIWgxPpD+VMxstuDzRQ5qytN6FpCJT44S2wOOJrik+uyJ2Z6/IkPjLqr2Tdk/cZYwWKcEa5vKnhLwD0Kd6CRckDlr2lWAUtW0rVf2drEZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777034921; c=relaxed/simple;
	bh=TROVbJzrIa38ArftKGm7M6iYtIDBZWbB0um0eGyg+zU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PYx56c55Lck9cnHOCYGbIWrkh0GmHEU5cTGhKHGxYRJrR2Zm6dXW8n0fZYgZWLlOEAZ3LAXbQDXMuDF318d+WnLIyb+M5r7eu+jMFy3VtYqku+7bi120ZJZ67vQHra5s7x7E9gtWvEEHAyUU66VVNodKmzoyOMpneUZ7ain40e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cFpBcO2v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1A8C19425;
	Fri, 24 Apr 2026 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1777034921;
	bh=TROVbJzrIa38ArftKGm7M6iYtIDBZWbB0um0eGyg+zU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cFpBcO2vALXr7md4hid3exLyeME0fHrvBJjlifO6sM51NXzOxK4YlOkMEBQOymJ8l
	 Bfh2flYFFsoEBJftcGNE15m+vewO3VtLyRNpV459DjEydpAmB/VxIg+aeq+MeFV2Y4
	 6+5v1ltjzw1cQVsfP1HG1TkTQol6eMmalQBLhR50=
Date: Fri, 24 Apr 2026 05:48:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Breno Leitao <leitao@debian.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah
 Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: [PATCH v5 3/4] Documentation: document
 panic_on_unrecoverable_memory_failure sysctl
Message-Id: <20260424054840.a63d80ed01b968caf9d9ef64@linux-foundation.org>
In-Reply-To: <20260424-ecc_panic-v5-3-a35f4b50425c@debian.org>
References: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
	<20260424-ecc_panic-v5-3-a35f4b50425c@debian.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7300745EA81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84485-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[huawei.com,gmail.com,lwn.net,linuxfoundation.org,kernel.org,oracle.com,google.com,suse.com,kvack.org,vger.kernel.org,meta.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,linux-foundation.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, 24 Apr 2026 05:24:01 -0700 Breno Leitao <leitao@debian.org> wrote:

> Add documentation for the new vm.panic_on_unrecoverable_memory_failure
> sysctl, describing the three categories of failures that trigger a
> panic and noting which kernel page types are not yet covered.
> 
>
> ...
>
> +When enabled, this sysctl triggers a panic on three categories of
> +unrecoverable failures: reserved kernel pages, non-buddy kernel pages
> +with zero refcount (e.g. tail pages of high-order allocations), and
> +pages whose state cannot be classified as recoverable.

Before someone asks, I wonder if we should make this a bitfield thing,
so people can select which of the above three should get the panic
treatment.


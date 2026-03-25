Return-Path: <linux-doc+bounces-81265-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCNEGWFrxGnKzAQAu9opvQ
	(envelope-from <linux-doc+bounces-81265-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 00:10:25 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC8532D463
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 00:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF3003038782
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 23:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C863932C8;
	Wed, 25 Mar 2026 23:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEhVA/78"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6495C38C409;
	Wed, 25 Mar 2026 23:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774480169; cv=none; b=tvqPAipO/Qvlzhhpp1uMXaMHlc4MyqXXlcqmYWDDMaZFzJxyHCB3zaL7Qkeqm/Mw/KsSDHqo/TSKH1w+joJbu09FfhDKdBbHipNp/QH30PPItrMqNAIscahKgT+iPMoMCenF2cRApMMh2dOnKRLhb9CXZTtP7pbPcgGRUWPi6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774480169; c=relaxed/simple;
	bh=zBYnC10t2KEUQDzcpYEXzce3sc3uInT0C+rPtVmdkC8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ATkUpQwQM0j7QVaq3skLPO306AcO6d4Lg+pz+yrxq8oYrgcZaAFgJPYdHyUgFOoDB7ERcXI5OFZIDp361e1ov/0e0DJYvabfAvuOtlz1T5sufmOfqewYl4Fjuwniz5l/FTwAejVHyDSxtaE44NyyJMo4AL0dE1+EDMuRGqFXt7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEhVA/78; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9685C4CEF7;
	Wed, 25 Mar 2026 23:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774480169;
	bh=zBYnC10t2KEUQDzcpYEXzce3sc3uInT0C+rPtVmdkC8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LEhVA/78qKyo/9iJst1YMdeenwhPV6n42n+ToOdV+0sQXlzbsUI6rRrKVOldeLFAu
	 nasL7dW47lBs9pnorL4YxnNtO16FX793ojVFlwFGCiP85qJ5tpYWNJbDQKKJYuKHGf
	 dJUimslhtk4I1ffmqDAHk5IdAAM5ZlZSqcMAF+EOTQUR6GC5Qrxlw7BUGsDCtFYBx8
	 CqM9PZtVzOjSVnUSM3XFHEdRHR03Lix++7XAbBFG5p1dARp0n4YdEKcnlH8s1uIfJV
	 zL3sRhtJBXcaG8yJJSvlTMzYYwP91aZgNu9YCCo/EQcRZo8HFPa7wV274rhS3CUxCo
	 S9+xu84TMp3kg==
Date: Wed, 25 Mar 2026 17:09:26 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: "rom.wang" <r4o5m6e8o@163.com>
cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundatio.org>, 
    Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    Yufeng Wang <wangyufeng@kylinos.cn>
Subject: Re: [PATCH] riscv: enable HAVE_IOREMAP_PROT
In-Reply-To: <20260306112734.108186-1-r4o5m6e8o@163.com>
Message-ID: <17838da0-c3e3-6211-72da-e986f9986e70@kernel.org>
References: <20260306112734.108186-1-r4o5m6e8o@163.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-81265-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pjw@kernel.org,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rom.wang:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CBC8532D463
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 6 Mar 2026, rom.wang wrote:

> From: Yufeng Wang <wangyufeng@kylinos.cn>
> 
> RISC-V has implemented pte_pgprot() and selects GENERIC_IOREMAP,
> which provides a generic ioremap_prot() implementation. Enable
> HAVE_IOREMAP_PROT to activate generic_access_phys() support, which
> is useful for debugging (e.g., accessing /dev/mem via gdb).
> 
> Also update the architecture support documentation accordingly.
> 
> Signed-off-by: Yufeng Wang <wangyufeng@kylinos.cn>

Thanks, queued for v7.1.


- Paul


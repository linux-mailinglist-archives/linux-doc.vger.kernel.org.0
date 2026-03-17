Return-Path: <linux-doc+bounces-79771-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDyRGyxtuWm8EgIAu9opvQ
	(envelope-from <linux-doc+bounces-79771-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 16:03:08 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5283A2AC9DC
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 16:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B7B13010783
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 15:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DBA3EAC6B;
	Tue, 17 Mar 2026 15:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sHHiJaLq"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8D73E867C;
	Tue, 17 Mar 2026 15:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759770; cv=none; b=vElyjZnq9ARn+Jjk+VU6DLcFePeVHIMmsso0My+0w1Dbf3QyYfAB9jiVEwxMHWtxdgxX2tZngPqRLmaO++7GygRunHo15EcUCzy1Bpjy0Bz0G61alLJowhUfqV3cGREtZWhUI6lKRzi5yrgcziKjAzzzJVdcRXPYKfwOlZpQARw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759770; c=relaxed/simple;
	bh=YonrKhAswR45i/MEJoFED1plfD3jYpIJPfmmeZP6T7M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N/zGi4WbjdGaRR2WQ5vISgFnG046tEzk3WLzH+asBOjkCY7wWKtwYLsCmBWCLNcb86G+V5VmgfIphH+bsIdlo3l+eGsfAaCbqq1QgTUWlwJUjqJTXvDltcvb/xlHyczXyfMngtefuGT/KI4IQUnDaXhhkNE9VFLg5TH2rg9ScNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sHHiJaLq; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 973AC40C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773759767; bh=bebS9ZbYFlFEfqDFLdKJoNmeithi9QJeunh3C6alh54=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sHHiJaLq30Y1HQo75TkNcyawg6uy4e6RYIDUXDJloQ3GFP/NqgRZmf4XGppeaxWdq
	 Ee0FuXcwvYc/CEnu7zjkoGhKVynBG1JApDtJmseb2Ql91FkcqeSKVg1qCkG+7IHaWo
	 p6akCAkZQq+h0Zq8sBdILUTOepnKLeZAf+qf+3K6qqhAgrZDpHiYKS7qNt/6kMEvFK
	 s0ALiUbF7VWq030XfxWc7MmtFbzJZpTc5sjExkHabs9vm3r9orLhnswgs3DpuYJZ5J
	 OiEz2rIKPFqsbLVx8olK4V5z2nSNadYBBMOQpZL+dl/Lw/gCheaY0Dw5+Y/MLW7ckQ
	 0B8sQH2/UrLdA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 973AC40C7C;
	Tue, 17 Mar 2026 15:02:47 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@airmail.cc>, Collin Funk
 <collin.funk1@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Manuel Ebner <manuelebner@airmail.cc>
Subject: Re: [PATCH v4 1/4] scripts: ver_linux: expand and fix list
In-Reply-To: <20260311165440.183672-2-manuelebner@airmail.cc>
References: <20260311164935.183495-3-manuelebner@airmail.cc>
 <20260311165440.183672-2-manuelebner@airmail.cc>
Date: Tue, 17 Mar 2026 09:02:46 -0600
Message-ID: <87jyvacxd5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79771-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[airmail.cc,gmail.com,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DM_SURBL(0.00)[airmail.cc:email];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,trenco.lwn.net:mid,lwn.net:dkim]
X-Rspamd-Queue-Id: 5283A2AC9DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Manuel Ebner <manuelebner@airmail.cc> writes:

> It is a pain in the ass to compare the software versions on the running
> system (scripts/ver_linux) with the minimal required versions.
> Sorting both lists the same way makes side-by-side comparisons a simple task.

OK, we're getting a lot closer.  But the above text has nothing to do
with what this patch does - there is no sorting here.  What you are
doing is making the names of the tools consistent and adding those that
are missing; that's what your changelog should say.

> fix path to changes.rst
>
> make toolnames uniform with the toolnames in Changes.rst
> make version commands uniform with Changes.rst
>
> Add missing tools in ver_linux
>  bash, bc, bindgen, btrfs-progs, Clang, gdb,  GNU awk, GNU tar,
>  GRUB, GRUB2, gtags, iptables, kmod, mcelog, mkimage, openssl,
>  pahole, Python, Rust, Sphinx, squashfs-tools
>
> Signed-off-by: Manuel Ebner <manuelebner@airmail.cc>
> ---
>  scripts/ver_linux | 50 ++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 36 insertions(+), 14 deletions(-)

Otherwise I think the patch is good.  If this were the only issue, I
would just apply the patch and fix the changelog myself.

Thanks,

jon


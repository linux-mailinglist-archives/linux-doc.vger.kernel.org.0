Return-Path: <linux-doc+bounces-81778-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMtiIsKkymmx+gUAu9opvQ
	(envelope-from <linux-doc+bounces-81778-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 18:28:50 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C8235EC76
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 18:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 230F6303A5F7
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 16:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD96375ABC;
	Mon, 30 Mar 2026 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ltp9k8io"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5F237700F;
	Mon, 30 Mar 2026 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887355; cv=none; b=oV4EdSzNNa7DBR5uMfw0aa7lMjc3aLdxl2NAlxIlyvOt/fc+rQgZoaPR91xAMNNZ2xb3VynggNr7YS9wdoH8C6WQEJsnS+CL5jheyXtIOHHJ6jWu2X4dXJuBuPw6gi6LsgFH9PgnEoevuRXIlVWfxGpDqk4FHvdLO3hAd9ey0eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887355; c=relaxed/simple;
	bh=BtXI0mQao2y5Gas//5IlwF4zRYP1UpwGL3ZM15UiWuk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SB3GVfb2w91AF1L6mlOT5I7e5QALxNhcu04GV+CVsD5hqVZgxBKqeOc8eaAxUjDLPLMaBFF5umF+sbqvYq8BXGLa6K45J7ksfVUa16aBgW32UM6pDpJWeUBE94L1HEv7Xepy2Sxu9wbXNCrSymwUnrP0Jzm+Z3ChWWSQT9clHrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ltp9k8io; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 99343411C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774887353; bh=14wIG45328K8CYuQ29VhCJsnVScrNmHBwd15EFB7ZoQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ltp9k8ioHtudZwy8CkXoWsoIv8I0SFvGJx/J01r4ZBiWpQQxFzKVI3gCFnBqhNstj
	 aF97/pWSylZ+hNQkeC+Sx9JHB6HnlFOhHMAXDa5skIO5caMXR8sv2D3l3u0zjxuJGL
	 rsBdSj+1N4Nnd/oaVrnG+Ip9kRrN8q2l4MrMmmzmHLxukHTAr0a1+Gq1xaxvovQ1xf
	 DULF/gbBJHkpB2+YYF4J2PcAbi50bvAnrYUaJrc9/Oyv7fKIN4DwOhiYFEINU9QO2v
	 Ee1Pnf/JAmjezi7wgyhkrMjctbiEVybc3xkghx1PXxRch2kgmoE9hqBMBNkC9p8zuA
	 rU+SKmCquCWPg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 99343411C2;
	Mon, 30 Mar 2026 16:15:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Cc: tglx@kernel.org, radu@rendec.net, Florian Fainelli
 <florian.fainelli@broadcom.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Illia Ostapyshyn <illia@yshyn.com>, "open list:DOCUMENTATION PROCESS"
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation: Provide hints on how to debug Python GDB
 scripts
In-Reply-To: <20260326233226.2248817-1-florian.fainelli@broadcom.com>
References: <20260326233226.2248817-1-florian.fainelli@broadcom.com>
Date: Mon, 30 Mar 2026 10:15:52 -0600
Message-ID: <87mrzpnvif.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81778-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,trenco.lwn.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E5C8235EC76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Florian Fainelli <florian.fainelli@broadcom.com> writes:

> By default GDB does not print a full stack of its integrated Python
> interpreter, thus making the debugging of GDB scripts more painful than
> it has to be.
>
> Suggested-by: Radu Rendec <radu@rendec.net>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  Documentation/process/debugging/gdb-kernel-debugging.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/process/debugging/gdb-kernel-debugging.rst b/Documentation/process/debugging/gdb-kernel-debugging.rst
> index 9475c759c722..53e225760a4d 100644
> --- a/Documentation/process/debugging/gdb-kernel-debugging.rst
> +++ b/Documentation/process/debugging/gdb-kernel-debugging.rst
> @@ -173,3 +173,12 @@ this is just a snapshot of the initial version::
>  
>  Detailed help can be obtained via "help <command-name>" for commands and "help
>  function <function-name>" for convenience functions.
> +
> +Debugging GDB scripts
> +---------------------
> +
> +GDB does not enable a full Python backtrace which can make debugging GDB
> +scripts more difficult than necessary. The following will allow for printing a
> +full backtrace of the python environment::
> +
> + (gdb) set python print-stack full

Applied, thanks.

jon


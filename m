Return-Path: <linux-doc+bounces-77735-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBomBFEip2mMegAAu9opvQ
	(envelope-from <linux-doc+bounces-77735-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 19:02:57 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 589841F4E8D
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 19:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B05F30E5288
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2026 17:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9D437702A;
	Tue,  3 Mar 2026 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="U223NuIU"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E2E23504B;
	Tue,  3 Mar 2026 17:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772560795; cv=none; b=DTHEaW+VjCYOK0+JEhddCM+dp8eMcSGd5PgHms+jgY8TVUdiSNX1xgLEtCld6ehYi6T86rd/Uj3ZnsZkQAz5Z5Y7P3+yntFRZql5DCJ5peP3MeT90xzm8DXdK1Q94Dp8OAzriApnqIGSH1eye1/xWFgNbGVqR+rQWEswQQORQqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772560795; c=relaxed/simple;
	bh=ND3gldCRjWZIcza/nAkJbOWW+MGA7tpJFrnG91mVpSc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eS9pqa9JimiXtpIYkvpD/siYph5+nFvods9lbtQ2ppMXxMdUtNNe2mmiBP1Wx9VK9Ac+qgSOr7lVfIAV3QOcjVStFeDttGopHaNdQSfZzotVXtkC9r+TznJ6UwqtmhVwbJRkpSfvGbqIn7fY8xVBUa9KSvhq0U8dOLv0Hreb/D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=U223NuIU; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0BAAA40429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772560794; bh=rDBm5j8sC3GEDDtM8JDnIX4EAfJNZoCjCwK+g3cVkyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U223NuIUt1my0jwZuNY8/V+2c/SjeHCLGSMOHTxwTR9iu6Id/7AkQHnPznCotteaP
	 3Pm+RCV+UJhlgUzzbmCSUdJ46wnhAextIX6NvQFcDx50ioCBu3v/aIJdmXN1jxTVxw
	 5PFA2VQjOrg0oKvBUYHELIfh2luQb531rSgVCP/V07LLyh+gY6ksavX3JQE1B2pqrH
	 djWTxDaSDMpQDahsqhCyNavYKZxPRLB6rsLVFAYvhEkKRHY1aDebTRHGlUggXDPSfk
	 87bwM1jhqxMmZt+0eetc0uLuEsARG+REGrFkaWDQ4WqbkLlGWJINCEhEVH07ZUuivW
	 v2h1g3dPDoJmA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0BAAA40429;
	Tue,  3 Mar 2026 17:59:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Matteo Martelli <matteo.martelli@codethink.co.uk>, Shuah Khan
 <skhan@linuxfoundation.org>, Shashank Balaji
 <shashank.mahadasyam@sony.com>, Juri Lelli <juri.lelli@redhat.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Matteo Martelli
 <matteo.martelli@codethink.co.uk>
Subject: Re: [PATCH] sched_deadline, docs: fix cpuset example for cgroupv2
In-Reply-To: <20260223-docs-sched-deadline-fix-example-v1-1-8d0bedc2bc6f@codethink.co.uk>
References: <20260223-docs-sched-deadline-fix-example-v1-1-8d0bedc2bc6f@codethink.co.uk>
Date: Tue, 03 Mar 2026 10:59:53 -0700
Message-ID: <87bjh4bxpi.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 589841F4E8D
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-77735-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,codethink.co.uk:email,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Action: no action

Matteo Martelli <matteo.martelli@codethink.co.uk> writes:

> Documenation/scheduler/sched-deadline.rst provides two examples for how
> to setup cgroup and cpuset for deadline tasks: one for cgroup v1 and one
> cgroup v2. The code block in the latter is not properly html rendered as
> the :: marker is missing.
>
> Add the :: marker before the code block for the cgroup v2 example to fix
> html rendering.
>
> Also make the example description more explicit for better clarity.
>
> Fixes: 0116765035eb ("sched_deadline, docs: add affinity setting with cgroup2 cpuset controller")
> Signed-off-by: Matteo Martelli <matteo.martelli@codethink.co.uk>
> ---
>  Documentation/scheduler/sched-deadline.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/scheduler/sched-deadline.rst b/Documentation/scheduler/sched-deadline.rst
> index ec543a12f848..d23e4afe1a9a 100644
> --- a/Documentation/scheduler/sched-deadline.rst
> +++ b/Documentation/scheduler/sched-deadline.rst
> @@ -700,7 +700,8 @@ Deadline Task Scheduling
>  5.2 Using cgroup v2 cpuset controller
>  -------------------------------------
>  
> - Assuming the cgroup v2 root is mounted at ``/sys/fs/cgroup``.
> + Assuming the cgroup v2 root is mounted at ``/sys/fs/cgroup``, an example of a
> + simple configuration (pin a -deadline task to CPU0) follows::
>  
>     cd /sys/fs/cgroup
>     echo '+cpuset' > cgroup.subtree_control

Applied, thanks.

jon


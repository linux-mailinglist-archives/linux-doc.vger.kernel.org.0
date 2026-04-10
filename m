Return-Path: <linux-doc+bounces-83017-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 71xHMcIL2WlylggAu9opvQ
	(envelope-from <linux-doc+bounces-83017-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 16:40:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7E13D8BED
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 16:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95F373006933
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 14:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A423D47D3;
	Fri, 10 Apr 2026 14:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="joqIhAEz"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7023D5251
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 14:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775831996; cv=none; b=bk+/Ll9E+K4vdlvXo5sTuMQhoKAkIc+XPAk94/46L+wm9Vy5+VlhGrH3gR+XoF4+0J+pJX0eitBUbpKkpuM6KnZ8MJnH51Wqddg2GOTShJ6mbYB7xAfwtcMPvzK04zufhY858oe2XKKbzRM38ti/fXpEWkc4rVOB015DQ66Muh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775831996; c=relaxed/simple;
	bh=7bMjCZiVO2P5H+eiFsIRUca06LdMnnhlxsNHI2pdmWs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s2tMGUZ5O26Iu/4ENkLc0D2GpqZoQDuhwutTOKEjOrB4Rc9O9i07j1FyEpzddumIth5YfFEPNCb4TlOIxxskGnMGXnJe6ZflGnXVa74kmaGJcUx6z3wUuv7gFWwhBHeeU579iTSG95cLuUlMq8vf9vJGjJUERK9R4A1lX8eHUss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=joqIhAEz; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3CD4041089
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775831988; bh=p1LkpgWUcwkEHntwhVsMLRr70PDkyRvOfj+CmbpTa/0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=joqIhAEzZQhBKVNDsQ/fJlA3x13k3Jjpq6I4tPXy1ZQl0QBBSFvIQg2mENll9URxo
	 mskObcTfkWt/ORJa8Kb7IQNcjyWYoXkEUn1QD9q6Ml+fBGQgT9BLSJ7T96LD20SR63
	 KiwPiiaoUyvwKGcFjpCMMayY5+nueCme+mjiZkeQMV5DkswldVmW6jZAGGaoaMHDn7
	 Z6bVopCriq0/CX9VT13PGpQD0ajo77QMfk/09TuEY3aiJUKQV6dKnkYkvF/U4125+6
	 WUqohPSn94luGJRdA9+1mBKR+h+jjV+arrampRDXSR78J/PWNcCXgpySWN9lx15Ygd
	 KOMkOlfSGMQhg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3CD4041089;
	Fri, 10 Apr 2026 14:39:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-doc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH] Documentation: seq_file: drop 2.6 reference
In-Reply-To: <20260410143234.43610-2-wsa+renesas@sang-engineering.com>
References: <20260410143234.43610-2-wsa+renesas@sang-engineering.com>
Date: Fri, 10 Apr 2026 08:39:47 -0600
Message-ID: <87zf3a2824.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83017-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: BA7E13D8BED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

> Even kernels after 2.6 have seq-file support.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> See, somebody still reads it :)
>
>  Documentation/filesystems/seq_file.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/filesystems/seq_file.rst b/Documentation/filesystems/seq_file.rst
> index 1e1713d00010..d753d8177bcb 100644
> --- a/Documentation/filesystems/seq_file.rst
> +++ b/Documentation/filesystems/seq_file.rst
> @@ -27,7 +27,7 @@ position within the virtual file - that position is, likely as not, in the
>  middle of a line of output. The kernel has traditionally had a number of
>  implementations that got this wrong.
>  
> -The 2.6 kernel contains a set of functions (implemented by Alexander Viro)
> +The kernel now contains a set of functions (implemented by Alexander Viro)
>  which are designed to make it easy for virtual file creators to get it

But but but ... it *is* correct as written... :)

(Applied, thanks).

jon

